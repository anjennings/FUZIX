	.area _CODE

	.globl __syscall
	.globl _ioctl

_ioctl:
	ld a, #29
	jp __syscall
