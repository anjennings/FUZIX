	.area _CODE

	.globl __syscall
	.globl _pipe

_pipe:
	ld a, #40
	jp __syscall
