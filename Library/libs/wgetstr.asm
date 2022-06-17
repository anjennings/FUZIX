;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module wgetstr
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _wgetch
	.globl _wgetstr
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;curses/wgetstr.c:11: int wgetstr(WINDOW *win, char *str)
;	genLabel
;	genFunction
;	---------------------------------
; Function wgetstr
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_wgetstr::
;curses/wgetstr.c:13: while ((*str = wgetch(win)) != ERR && *str != '\n') str++;
;	genAssign
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 4, size 2
;fetchPairLong
; peephole 63 used hl instead of iy.
	ld	hl, #4
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
;	genLabel
00102$:
;	genIpush
	push	bc
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 2, size 2
;fetchPairLong
; peephole 64 used hl instead of iy.
	ld	hl, #4
	add	hl, sp
; peephole 49 pushed bc instead of hl.
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
;	genCall
	call	_wgetch
	pop	af
	pop	bc
;	genCast
	ld	a, l
;	genAssign (pointer)
;	isBitvar = 0
	ld	(bc), a
;	genCmpEq
	sub	a, #0x0a
	jr	Z,00106$
; peephole 163 changed absolute to relative conditional jump.
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00120$.
;	genPlus
	inc	bc
;	genGoto
	jr	00102$
; peephole 162 changed absolute to relative unconditional jump.
;curses/wgetstr.c:16: return ERR;
;	genLabel
00106$:
;curses/wgetstr.c:18: *str = '\0';
;	genAssign (pointer)
;	isBitvar = 0
	xor	a, a
	ld	(bc), a
;curses/wgetstr.c:19: return OK;
;	genRet
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0000
;	genLabel
; peephole 158 removed unused label 00107$.
;curses/wgetstr.c:20: }
;	genEndFunction
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
