	.area _CODE

	.globl __syscall
	.globl _fcntl

_fcntl:
	ld a, #47
	jp __syscall
