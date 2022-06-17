	.area _CODE

	.globl __syscall
	.globl _memalloc

_memalloc:
	ld a, #64
	jp __syscall
