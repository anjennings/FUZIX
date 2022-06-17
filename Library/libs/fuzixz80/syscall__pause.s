	.area _CODE

	.globl __syscall
	.globl __pause

__pause:
	ld a, #37
	jp __syscall
