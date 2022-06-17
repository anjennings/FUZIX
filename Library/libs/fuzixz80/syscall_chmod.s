	.area _CODE

	.globl __syscall
	.globl _chmod

_chmod:
	ld a, #13
	jp __syscall
