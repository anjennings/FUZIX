	.area _CODE

	.globl __syscall
	.globl _mknod

_mknod:
	ld a, #4
	jp __syscall
