	.area _CODE

	.globl __syscall
	.globl _getpgrp

_getpgrp:
	ld a, #61
	jp __syscall
