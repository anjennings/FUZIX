	.area _CODE

	.globl __syscall
	.globl _fchdir

_fchdir:
	ld a, #48
	jp __syscall
