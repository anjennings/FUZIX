	.area _CODE

	.globl __syscall
	.globl _kill

_kill:
	ld a, #39
	jp __syscall
