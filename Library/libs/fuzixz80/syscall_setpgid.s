	.area _CODE

	.globl __syscall
	.globl _setpgid

_setpgid:
	ld a, #77
	jp __syscall
