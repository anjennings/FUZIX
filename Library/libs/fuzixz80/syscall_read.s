	.area _CODE

	.globl __syscall
	.globl _read

_read:
	ld a, #7
	jp __syscall
