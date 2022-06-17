	.area _CODE

	.globl __syscall
	.globl _setuid

_setuid:
	ld a, #25
	jp __syscall
