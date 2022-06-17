	.area _CODE

	.globl __syscall
	.globl _chdir

_chdir:
	ld a, #10
	jp __syscall
