	.area _CODE

	.globl __syscall
	.globl _utime

_utime:
	ld a, #43
	jp __syscall
