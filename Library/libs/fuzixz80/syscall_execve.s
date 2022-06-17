	.area _CODE

	.globl __syscall
	.globl _execve

_execve:
	ld a, #23
	jp __syscall
