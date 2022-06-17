	.area _CODE

	.globl __syscall
	.globl _setrlimit

_setrlimit:
	ld a, #76
	jp __syscall
