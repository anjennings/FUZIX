	.area _CODE

	.globl __syscall
	.globl _access

_access:
	ld a, #12
	jp __syscall
