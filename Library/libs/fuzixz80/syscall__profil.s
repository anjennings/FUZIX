	.area _CODE

	.globl __syscall
	.globl __profil

__profil:
	ld a, #56
	jp __syscall
