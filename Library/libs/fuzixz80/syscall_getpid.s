	.area _CODE

	.globl __syscall
	.globl _getpid

_getpid:
	ld a, #18
	jp __syscall
