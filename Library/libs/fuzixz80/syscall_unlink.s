	.area _CODE

	.globl __syscall
	.globl _unlink

_unlink:
	ld a, #6
	jp __syscall
