	.area _CODE

	.globl __syscall
	.globl _umask

_umask:
	ld a, #21
	jp __syscall
