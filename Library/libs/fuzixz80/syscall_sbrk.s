	.area _CODE

	.globl __syscall
	.globl _sbrk

_sbrk:
	ld a, #31
	jp __syscall
