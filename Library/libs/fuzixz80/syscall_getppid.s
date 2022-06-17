	.area _CODE

	.globl __syscall
	.globl _getppid

_getppid:
	ld a, #19
	jp __syscall
