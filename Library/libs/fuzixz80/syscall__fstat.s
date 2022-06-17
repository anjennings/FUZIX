	.area _CODE

	.globl __syscall
	.globl __fstat

__fstat:
	ld a, #16
	jp __syscall
