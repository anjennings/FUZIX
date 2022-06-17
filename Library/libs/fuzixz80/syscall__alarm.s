	.area _CODE

	.globl __syscall
	.globl __alarm

__alarm:
	ld a, #38
	jp __syscall
