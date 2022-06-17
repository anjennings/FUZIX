	.area _CODE

	.globl __syscall
	.globl _close

_close:
	ld a, #2
	jp __syscall
