	.area _CODE

	.globl __syscall
	.globl __sigdisp

__sigdisp:
	ld a, #59
	jp __syscall
