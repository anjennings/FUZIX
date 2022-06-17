	.area _CODE

	.globl __syscall
	.globl _acct

_acct:
	ld a, #63
	jp __syscall
