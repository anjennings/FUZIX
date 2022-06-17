	.area _CODE

	.globl __syscall
	.globl __select

__select:
	ld a, #72
	jp __syscall
