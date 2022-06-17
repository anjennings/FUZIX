	.area _CODE

	.globl __syscall
	.globl _memfree

_memfree:
	ld a, #65
	jp __syscall
