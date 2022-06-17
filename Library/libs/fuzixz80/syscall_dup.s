	.area _CODE

	.globl __syscall
	.globl _dup

_dup:
	ld a, #17
	jp __syscall
