;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module waddstr
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _waddch
	.globl _waddstr
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
;curses/waddstr.c:10: int waddstr(WINDOW *win, char *str)
;	genLabel
;	genFunction
;	---------------------------------
; Function waddstr
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_waddstr::
;curses/waddstr.c:12: while (*str) {
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
00103$:
;	genPointerGet
	ld	a, (bc)
;	genIfx
	or	a, a
	jr	Z,00105$
; peephole 163 changed absolute to relative conditional jump.
;curses/waddstr.c:13: if (waddch(win, *str++) == ERR) return(ERR);
;	genAssign
;	(registers are the same)
;	genPlus
	inc	bc
;	genCast
	ld	e, a
	ld	d, #0x00
;	genIpush
	push	bc
	push	de
;	genIpush
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 2, size 2
;fetchPairLong
; peephole 64 used hl instead of iy.
	ld	hl, #6
	add	hl, sp
; peephole 49 pushed bc instead of hl.
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
;	genCall
	call	_waddch
	pop	af
	pop	af
	pop	bc
;	genCmpEq
	inc	l
	jr	NZ,00103$
; peephole 164 changed absolute to relative conditional jump.
; peephole 84 jumped to 00103$ directly instead of via 00123$.
	inc	h
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00123$.
	jr	NZ,00103$
; peephole 164 changed absolute to relative conditional jump.
; peephole 82 removed jp by using inverse jump logic
; peephole 158 removed unused label 00124$.
;	genRet
;fetchPairLong
;fetchLitPair
	ld	hl, #0xffff
	ret
; peephole 160 replaced jump by return.
;	genLabel
00105$:
;curses/waddstr.c:15: return(OK);
;	genRet
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0000
;	genLabel
; peephole 158 removed unused label 00106$.
;curses/waddstr.c:16: }
;	genEndFunction
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
