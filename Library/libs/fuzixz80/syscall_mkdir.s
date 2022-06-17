	.area _CODE

	.globl __syscall
	.globl _mkdir

_mkdir:
	ld a, #51
	jp __syscall
