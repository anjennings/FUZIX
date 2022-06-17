	.area _CODE

	.globl __syscall
	.globl __stime

__stime:
	ld a, #28
	jp __syscall
