	.area _CODE

	.globl __syscall
	.globl _fchown

_fchown:
	ld a, #50
	jp __syscall
