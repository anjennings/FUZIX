	.area _CODE

	.globl __syscall
	.globl _rmdir

_rmdir:
	ld a, #52
	jp __syscall
