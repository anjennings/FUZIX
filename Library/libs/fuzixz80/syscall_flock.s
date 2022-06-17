	.area _CODE

	.globl __syscall
	.globl _flock

_flock:
	ld a, #60
	jp __syscall
