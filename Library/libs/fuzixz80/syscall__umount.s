	.area _CODE

	.globl __syscall
	.globl __umount

__umount:
	ld a, #34
	jp __syscall
