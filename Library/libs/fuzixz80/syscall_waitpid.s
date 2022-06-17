	.area _CODE

	.globl __syscall
	.globl _waitpid

_waitpid:
	ld a, #55
	jp __syscall
