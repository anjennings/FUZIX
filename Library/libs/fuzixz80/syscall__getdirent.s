	.area _CODE

	.globl __syscall
	.globl __getdirent

__getdirent:
	ld a, #24
	jp __syscall
