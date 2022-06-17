	.area _CODE

	.globl __syscall
	.globl __nosys68

__nosys68:
	ld a, #68
	jp __syscall
