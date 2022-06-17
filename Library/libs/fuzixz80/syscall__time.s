	.area _CODE

	.globl __syscall
	.globl __time

__time:
	ld a, #27
	jp __syscall
