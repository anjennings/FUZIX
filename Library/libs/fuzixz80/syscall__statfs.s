	.area _CODE

	.globl __syscall
	.globl __statfs

__statfs:
	ld a, #22
	jp __syscall
