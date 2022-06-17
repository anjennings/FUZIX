	.area _CODE

	.globl __syscall
	.globl __uname

__uname:
	ld a, #54
	jp __syscall
