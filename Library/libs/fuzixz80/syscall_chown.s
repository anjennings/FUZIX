	.area _CODE

	.globl __syscall
	.globl _chown

_chown:
	ld a, #14
	jp __syscall
