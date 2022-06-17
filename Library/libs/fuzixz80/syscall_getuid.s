	.area _CODE

	.globl __syscall
	.globl _getuid

_getuid:
	ld a, #20
	jp __syscall
