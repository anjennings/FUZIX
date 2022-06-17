	.area _CODE

	.globl __syscall
	.globl _rename

_rename:
	ld a, #3
	jp __syscall
