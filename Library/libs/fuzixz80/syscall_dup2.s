	.area _CODE

	.globl __syscall
	.globl _dup2

_dup2:
	ld a, #36
	jp __syscall
