	.area _CODE

	.globl __syscall
	.globl _setgroups

_setgroups:
	ld a, #73
	jp __syscall
