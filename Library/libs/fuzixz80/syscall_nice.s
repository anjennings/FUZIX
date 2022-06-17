	.area _CODE

	.globl __syscall
	.globl _nice

_nice:
	ld a, #58
	jp __syscall
