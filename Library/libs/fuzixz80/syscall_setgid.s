	.area _CODE

	.globl __syscall
	.globl _setgid

_setgid:
	ld a, #26
	jp __syscall
