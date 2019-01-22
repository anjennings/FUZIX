/*
 *	Memory allocation modules for systems with a single flat address
 *	space and no bank or limit registers (eg 68000). These platforms use
 *	a malloc style allocator to manage the memory pool. As flat systems
 *	require a different implementation of uget/uput and friends these are
 *	also kept in this file, and the usual usermem.c is not used
 *
 *	We keep a fixed maximum blocks per user for speed, and to stop bad
 *	processes. We could swap that for a linked list (using 8 bytes at
 *	the head of each allocation).
 *
 *	Other requirements
 *	- fork() is not currently supported in a flat machine (and expensive)
 *	- there is no swap support
 *
 *	Set:
 *	CONFIG_FLAT
 *	MAX_POOLS	maximum number of discontiguous memory pools in the
 *			machine
 *	MAX_BLOCKS	maximum blocks per user
 *
 *	TODO:
 *	Reference counting (for sticky binaries, vfork, fork emulation)
 *	Switch around on free when doing fork emulation (if we have the same
 *	addresses with many users we need to keep the memory available but free
 *	the spare for the next copy when it is copied into the real range).
 *
 *	For speed we chunk in 512 byte blocks and use 512 byte wide fast
 *	copier/exchange calls.
 */

#include <kernel.h>
#include <kdata.h>
#include <printf.h>

#ifdef CONFIG_FLAT

#undef DEBUG

#define MAX_BLOCKS	14	/* Packs to a power of two */

struct memblk {
	void *start;
	void *end;
};

struct mem {
	int users;
	int last;
	struct memblk memblk[MAX_BLOCKS];
};

static struct mem *mem[PTABSIZE];	/* The map we use */
static struct mem *store[PTABSIZE];	/* Where our memory currently lives */
static struct mem memblock[PTABSIZE];

extern struct u_data *udata_shadow;	/* FIXME HACK */

static void mem_free(struct mem *m)
{
	struct memblk *p = &m->memblk[0];
	int i;
	if (m->users == 0)
		panic("mref");
	m->users--;
	if (m->users == 0) {
		for (i = 0; i < MAX_BLOCKS; i++) {
			kfree(p->start);
			p->start = NULL;
			p++;
		}
	}
}

static struct mem *mem_alloc(void)
{
	struct mem *p = &memblock[0];
	int i;
	for (i = 0; i < PTABSIZE; i++) {
		if (p->users == 0) {
			p->users++;
			p->last = -1;
			return p;
		}
		p++;
	}
	panic(PANIC_MLEAK);
}

static void *kdup(void *p, void *e)
{
	void *n = kmalloc(e - p);
	/* We chunk in 512 byte blocks */
	if (n) {
//              copy_blocks(n, p, (e - p) >> 9);
		memcpy32(n, p, (e - p));
	}
	return n;
}

static struct mem *mem_clone(struct mem *m)
{
	struct mem *n = mem_alloc();
	struct memblk *p = &m->memblk[0];
	struct memblk *t = &n->memblk[0];
	int i;
	/* FIXME: need a per block 'RO' flag for non-copied blocks */
	for (i = 0; i < MAX_BLOCKS; i++) {
		if (p->start) {
			t->start = kdup(p->start, p->end);
			if (t->start == NULL) {
				mem_free(n);
				return NULL;
			}
			t->end = t->start + (p->end - p->start);
		}
		t++;
		p++;
	}
	m->users++;
	return n;
}

static void mem_exchange(uint8_t * a8, uint8_t * b8, uint32_t count)
{
	uint32_t *a = (uint32_t *) a8;
	uint32_t *b = (uint32_t *) b8;
#ifdef DEBUG
	kprintf("Exchanging %p and %p for %d.\n", a, b, count);
#endif
	/* Really dumb to get going */
	count >>= 2;
	while (count--) {
		uint32_t x = *a;
		*a++ = *b;
		*b++ = x;
	}
}

static void mem_switch(struct mem *a, struct mem *b)
{
	struct memblk *t1 = &a->memblk[0];
	struct memblk *t2 = &b->memblk[0];
	unsigned int i;

	for (i = 0; i < MAX_BLOCKS; i++) {
		if (t1->start)
			mem_exchange(t1->start, t2->start,
				     t1->end - t1->start);
		t1++;
		t2++;
	}
}

static void mem_copy(struct mem *to, struct mem *from)
{
	struct memblk *t1 = &from->memblk[0];
	struct memblk *t2 = &to->memblk[0];
	unsigned int i;

	for (i = 0; i < MAX_BLOCKS; i++) {
		if (t1->start)
			memcpy32(t2->start, t1->start,
				 t1->end - t1->start);
		t1++;
		t2++;
	}
}

/*
 *	We make an assumption here: The user process is not guaranteed that
 *	two allocations are adjacent, therefore we don't allow a copy across
 *	what happens to be a join of two banks. We could fix this but it's not
 *	clear it would be wise!
 */
usize_t valaddr(const char *pp, usize_t l)
{
	const void *p = pp;
	const void *e = p + l;
	unsigned int proc = udata.u_page;
	int n = 0;
	struct memblk *m = &mem[proc]->memblk[0];

	while (n < MAX_BLOCKS) {
		/* Found the right block ? */
		if (m->start && p >= m->start && p < m->end) {
			/* Check the actual space */
			if (e >= m->end)
				e = m->end;
			/* Return the size we can copy */
			return e - m->start;
		}
		m++;
		n++;
	}
	return 0;
}

/* Called on a fork and similar

   We make a copy of the pages in the memory, but we don't actually create
   anything useful because the copy can't be mapped at the right address
   
   p is the process we are going to create maps for, udata.u_ptab is our
   own process. init is a special case!
   
   FIXME: where do we need to call pagemap_alloc from to get it early
   and make the valaddr and init data special cases go away ?
*/

int pagemap_alloc(ptptr p)
{
	unsigned int proc = udata.u_page;
	unsigned int nproc = p - ptab;

#ifdef DEBUG
	kprintf("%d: pagemap_alloc %p\n", proc, p);
#endif
	p->p_page = nproc;
	platform_udata_set(p);
	/* Init is special */
	if (p->p_pid == 1) {
		struct memblk *mb;
		udata_shadow = p->p_udata;
		store[nproc] = mem_alloc();
		mem[nproc] = store[nproc];
		mem[nproc]->last = 0;
		mb = &mem[nproc]->memblk[0];
		/* Must be a multiple of 512 */
		mb->start = kmalloc(8192);
		mb->end = mb->start + 8192;
		if (mb->start == 0)
			panic("alloc");
#ifdef DEBUG
		kprintf("init at %p\n", mb->start);
#endif
		return 0;
	}
	/* Allocate memory for the new process. The old will run first
	   We know that mem[proc] = store[proc] as proc is running the fork() */
#ifdef DEBUG
	kprintf("%d: Cloning %d as %d\n", proc, proc, nproc);
#endif
	store[nproc] = mem_clone(mem[proc]);
	if (store[nproc] == NULL)
		return ENOMEM;
	mem[nproc] = mem[proc];
	/* Last for our child is us */
#ifdef DEBUG
	kprintf("%d: pa:store %p mem %p\n", proc, store[nproc],
		mem[nproc]);
#endif
	mem[nproc]->last = proc;
	return 0;
}

/*
 *	store == mem
 *		Which means we ran last with these mappings so all is good
 *
 *	store != mem
 *		In which case our store needs to be swapped
 *		We
 *		- exchange the bytes
 *		- set our mem = store
 *		- set the last users store to be our old "mem"
 */
void pagemap_switch(ptptr p, int death)
{
	unsigned int proc = p->p_page;
	int lproc;

#ifdef DEBUG
	kprintf("%d: ps:store %p mem %p\n", proc, store[proc], mem[proc]);
#endif
	/* We have the right map (unique or we ran the forked copy last) */
	if (store[proc] == mem[proc]) {
#ifdef DEBUG
		kprintf("Slot %d was mapped already.\n", proc);
#endif
		return;
	}
	/* Who had our memory last ? */
	lproc = mem[proc]->last;
#ifdef DEBUG
	kprintf("%d: Slot %d last had our memory.\n", proc, lproc);
	kprintf("%d: ps:store lp is %p mem %p\n", proc, store[lproc],
		mem[lproc]);
#endif
	/* Give them our store */
	store[lproc] = store[proc];
	/* Take over the correctly mapped copy */
	store[proc] = mem[proc];
	/* Exchange the actual data */
	if (death)
		mem_copy(store[proc], store[lproc]);
	else
		mem_switch(store[proc], store[lproc]);
	/* Admit to owning it */
	mem[lproc]->last = proc;
#ifdef DEBUG
	kprintf("%d:Swapped over (now owned by %d not %d).\n", proc, proc,
		lproc);
	kprintf("%d:pse:store %p mem %p\n", proc, store[proc], mem[proc]);
	kprintf("%d:pse:store lp is %p mem %p\n", proc, store[lproc],
		mem[lproc]);
	kprintf("%d:lp->next %d p->next %d\n", proc, mem[lproc]->last,
		mem[proc]->last);
#endif
}

static int pagemap_sharer(struct mem *ms)
{
	struct mem **m = mem;
	int i;
	for (i = 0; i < PTABSIZE; i++) {
		if (*m == ms && store[i] != ms)
			return i;
		m++;
	}
	panic("share");
}

/* Called on exit */

void pagemap_free(ptptr p)
{
	unsigned int proc = udata.u_page;
	struct mem *m;

	m = mem[proc];
	/*
	 *      Not a saved copy: easy
	 */
	if (m == store[proc]) {
		/* We own the live space but we can't free up the live space
		   if it has another user */
		if (m->users > 1) {
			int n = pagemap_sharer(m);
#ifdef DEBUG
			kprintf
			    ("%d: pagemap_free: busy non live - giving away to %d.\n",
			     proc, n);
#endif

			pagemap_switch(&ptab[n], 1);
			/* We gave our copy away, so free the store copy
			   we just got donated */
			mem_free(store[proc]);
		}
#ifdef DEBUG
		kprintf("%d: pagemap_free: own live copy.\n", proc);
#endif
		/* Drop the reference count on the mem */
		mem_free(m);
		mem[proc] = NULL;
		store[proc] = NULL;
		return;
	}
	/*      Our copy is not the live copy. This cannot normally occur.
	 *      If we hit the case we can just flush it out.
	 */
#ifdef DEBUG
	kprintf("%d:pagemap_free:freeing our copy.\n", proc);
#endif
	mem_free(m);
	store[proc] = NULL;
	mem[proc] = NULL;
}

/* Called on execve */
int pagemap_realloc(usize_t code, usize_t size, usize_t stack)
{
	unsigned int proc = udata.u_page;
	struct memblk *mb;


	pagemap_free(udata.u_ptab);

	store[proc] = mem[proc] = mem_alloc();

#ifdef DEBUG
	kprintf("%d:pr:store %p mem %p\n", proc, store[proc], mem[proc]);
#endif

	mb = &mem[proc]->memblk[0];

	/* Snap to a block boundary for a fast memcpy/swap */
	size = (size + 511) & ~511;

	mb->start = kmalloc(size);
	mb->end = mb->start + size;

	/* FIXME: on the fail case we should put back the old maps */
	if (mb->start == NULL)
		return ENOMEM;
	return 0;
}

unsigned long pagemap_mem_used(void)
{
	return kmemused() >> 10;	/* In kBytes */
}

/* Extra helper for exec32 */

uaddr_t pagemap_base(void)
{
	unsigned int proc = udata.u_page;
	return mem[proc]->memblk[0].start;
}

/* The extra syscalls for the pool allocator */

#define size (uint32_t)udata.u_argn
#define flags (uint32_t)udata.u_argn1

/*
 *	void *memalloc(size, flags)
 *
 *	Allocate memory. Flags should currently be set to zero.
 */
arg_t _memalloc(void)
{
	unsigned int proc = udata.u_page;
	struct memblk *m = &mem[proc]->memblk[0];
	int i;

	/* Map 0 is the image, the user doesn't get to play with that one */
	for (i = 1; i < MAX_BLOCKS; i++) {
		if (m->start == NULL) {
			m->start = kmalloc(size);
			if (m->start == NULL) {
				udata.u_error = ENOMEM;
				return -1;
			}
			m->end = m->start + size;
			return (arg_t) m->start;
		}
		m++;
	}
	udata.u_error = EMLINK;
	return -1;
}

#undef size
#undef flags

#define base (void *)udata.u_argn

/*
 *	int memfree(void *ptr)
 *
 *	Free a block
 */
arg_t _memfree(void)
{
	unsigned int proc = udata.u_page;
	struct memblk *m = &mem[proc]->memblk[0];
	int i;

	for (i = 1; i < MAX_BLOCKS; i++) {
		if (m->start == base) {
			kfree(base);
			m->start = NULL;
			return 0;
		}
		m++;
	}
	udata.u_error = EINVAL;
	return -1;
}

#undef size

#endif
