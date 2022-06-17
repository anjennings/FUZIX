	.area _CODE

	.globl __syscall
	.globl _sync

_sync:
	ld a, #11
	jp __syscall
