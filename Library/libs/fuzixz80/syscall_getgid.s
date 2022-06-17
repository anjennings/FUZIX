	.area _CODE

	.globl __syscall
	.globl _getgid

_getgid:
	ld a, #41
	jp __syscall
