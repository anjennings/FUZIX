	.area _CODE

	.globl __syscall
	.globl _setpgrp

_setpgrp:
	ld a, #53
	jp __syscall
