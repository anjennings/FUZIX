;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module scrreg
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _wsetscrreg
	.globl _setscrreg
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
;curses/scrreg.c:26: int wsetscrreg(WINDOW *win, int top, int bottom)
;	genLabel
;	genFunction
;	---------------------------------
; Function wsetscrreg
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_wsetscrreg::
	call	___sdcc_enter_ix
;curses/scrreg.c:28: if ((0 <= top) &&
;	genCmpGt
;	AOP_STK for 
	bit	7, 7 (ix)
	jr	NZ,00102$
; peephole 164 changed absolute to relative conditional jump.
;curses/scrreg.c:29: (top <= win->_cury)
;	genAssign
;	AOP_STK for 
;fetchPairLong
	ld	c, 4 (ix)
	ld	b, 5 (ix)
;	genPointerGet
;fetchPairLong
	ld	l, c
	ld	h, b
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;	genCmpGt
;	AOP_STK for 
	ld	a, e
	sub	a, 6 (ix)
	ld	a, d
	sbc	a, 7 (ix)
	jp	PO, 00129$
	xor	a, #0x80
00129$:
	jp	M, 00102$
;curses/scrreg.c:31: (win->_cury <= bottom)
;	genCmpGt
;	AOP_STK for 
	ld	a, 8 (ix)
	sub	a, e
	ld	a, 9 (ix)
	sbc	a, d
	jp	PO, 00130$
	xor	a, #0x80
00130$:
	jp	M, 00102$
;curses/scrreg.c:33: (bottom <= win->_maxy)
;	genAssign
;fetchPairLong
	ld	l, c
	ld	h, b
;	genPointerGet
;fetchPairLong
	ld	de, #0x0004
	add	hl, de
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;	genCmpGt
;	AOP_STK for 
	ld	a, e
	sub	a, 8 (ix)
	ld	a, d
	sbc	a, 9 (ix)
	jp	PO, 00131$
	xor	a, #0x80
00131$:
	jp	M, 00102$
;curses/scrreg.c:35: win->_regtop = top;
;	genPlus
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0022
	add	hl, bc
;	genAssign (pointer)
;	AOP_STK for 
;	isBitvar = 0
;fetchPairLong
	ld	a, 6 (ix)
	ld	(hl), a
	inc	hl
	ld	a, 7 (ix)
	ld	(hl), a
;curses/scrreg.c:36: win->_regbottom = bottom;
;	genPlus
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0024
	add	hl, bc
;	genAssign (pointer)
;	AOP_STK for 
;	isBitvar = 0
;fetchPairLong
	ld	a, 8 (ix)
	ld	(hl), a
	inc	hl
	ld	a, 9 (ix)
	ld	(hl), a
;curses/scrreg.c:37: return(OK);
;	genRet
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0000
	jr	00107$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00102$:
;curses/scrreg.c:42: return(ERR);
;	genRet
;fetchPairLong
;fetchLitPair
	ld	hl, #0xffff
;	genLabel
00107$:
;curses/scrreg.c:43: }				/* wsetscrreg */
;	genEndFunction
	pop	ix
	ret
;curses/scrreg.c:50: int setscrreg(int top, int bottom)
;	genLabel
;	genFunction
;	---------------------------------
; Function setscrreg
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_setscrreg::
;curses/scrreg.c:52: return(wsetscrreg(stdscr, top, bottom));
;	genIpush
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 4, size 2
;fetchPairLong
; peephole 64 used hl instead of iy.
	ld	hl, #4
	add	hl, sp
; peephole 49 pushed bc instead of hl.
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
;	genIpush
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
;	genIpush
;fetchPairLong
	ld	hl, (_stdscr)
	push	hl
;	genCall
	call	_wsetscrreg
	pop	af
	pop	af
	pop	af
;	genRet
;fetchPairLong
;	genLabel
; peephole 158 removed unused label 00101$.
;curses/scrreg.c:53: }				/* setscrreg */
;	genEndFunction
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
