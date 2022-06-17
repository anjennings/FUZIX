	.area _CODE

	.globl __syscall
	.globl _getsid

_getsid:
	ld a, #79
	jp __syscall
