	.area _CODE

	.globl __syscall
	.globl _brk

_brk:
	ld a, #30
	jp __syscall
