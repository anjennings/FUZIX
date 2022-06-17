	.area _CODE

	.globl __syscall
	.globl _getrlimit

_getrlimit:
	ld a, #75
	jp __syscall
