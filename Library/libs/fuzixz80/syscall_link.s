	.area _CODE

	.globl __syscall
	.globl _link

_link:
	ld a, #5
	jp __syscall
