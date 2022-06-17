	.area _CODE

	.globl __syscall
	.globl _getgroups

_getgroups:
	ld a, #74
	jp __syscall
