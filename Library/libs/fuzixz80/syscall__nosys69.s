	.area _CODE

	.globl __syscall
	.globl __nosys69

__nosys69:
	ld a, #69
	jp __syscall
