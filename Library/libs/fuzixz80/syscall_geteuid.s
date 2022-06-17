	.area _CODE

	.globl __syscall
	.globl _geteuid

_geteuid:
	ld a, #44
	jp __syscall
