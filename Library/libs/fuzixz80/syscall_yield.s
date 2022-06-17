	.area _CODE

	.globl __syscall
	.globl _yield

_yield:
	ld a, #62
	jp __syscall
