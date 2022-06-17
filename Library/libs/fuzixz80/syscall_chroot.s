	.area _CODE

	.globl __syscall
	.globl _chroot

_chroot:
	ld a, #46
	jp __syscall
