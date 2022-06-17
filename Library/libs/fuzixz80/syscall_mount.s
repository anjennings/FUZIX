	.area _CODE

	.globl __syscall
	.globl _mount

_mount:
	ld a, #33
	jp __syscall
