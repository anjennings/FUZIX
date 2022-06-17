	.area _CODE

	.globl __syscall
	.globl __nosys71

__nosys71:
	ld a, #71
	jp __syscall
