	.area _CODE

	.globl __syscall
	.globl _fchmod

_fchmod:
	ld a, #49
	jp __syscall
