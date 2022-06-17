	.area _CODE

	.globl __syscall
	.globl _getegid

_getegid:
	ld a, #45
	jp __syscall
