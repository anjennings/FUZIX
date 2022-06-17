	.area _CODE

	.globl __syscall
	.globl _open

_open:
	ld a, #1
	jp __syscall
