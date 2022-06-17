	.area _CODE

	.globl __syscall
	.globl ___netcall

___netcall:
	ld a, #66
	jp __syscall
