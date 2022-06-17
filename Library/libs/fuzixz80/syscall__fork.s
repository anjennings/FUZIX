	.area _CODE

	.globl __syscall
	.globl __fork

__fork:
	ld a, #32
	jp __syscall
