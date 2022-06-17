	.area _CODE

	.globl __syscall
	.globl __lseek

__lseek:
	ld a, #9
	jp __syscall
