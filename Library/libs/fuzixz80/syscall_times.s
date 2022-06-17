	.area _CODE

	.globl __syscall
	.globl _times

_times:
	ld a, #42
	jp __syscall
