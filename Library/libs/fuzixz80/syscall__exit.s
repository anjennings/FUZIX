	.area _CODE

	.globl __syscall
	.globl __exit

__exit:
	ld a, #0
	jp __syscall
