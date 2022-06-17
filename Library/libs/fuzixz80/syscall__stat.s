	.area _CODE

	.globl __syscall
	.globl __stat

__stat:
	ld a, #15
	jp __syscall
