	.area _CODE

	.globl __syscall
	.globl __nosys67

__nosys67:
	ld a, #67
	jp __syscall
