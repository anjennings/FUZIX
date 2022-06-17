	.area _CODE

	.globl __syscall
	.globl _write

_write:
	ld a, #8
	jp __syscall
