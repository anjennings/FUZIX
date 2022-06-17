	.area _CODE

	.globl __syscall
	.globl _signal

_signal:
	ld a, #35
	jp __syscall
