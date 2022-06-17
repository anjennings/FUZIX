	.area _CODE

	.globl __syscall
	.globl _setsid

_setsid:
	ld a, #78
	jp __syscall
