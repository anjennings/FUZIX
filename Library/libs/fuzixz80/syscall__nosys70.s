	.area _CODE

	.globl __syscall
	.globl __nosys70

__nosys70:
	ld a, #70
	jp __syscall
