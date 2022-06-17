	.area _CODE

	.globl __syscall
	.globl _uadmin

_uadmin:
	ld a, #57
	jp __syscall
