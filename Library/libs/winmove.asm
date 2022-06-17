;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module winmove
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _touchwin
	.globl _mvwin
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
;curses/winmove.c:26: int mvwin(WINDOW *win, int begy, int begx)
;	genLabel
;	genFunction
;	---------------------------------
; Function mvwin
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 2 bytes.
_mvwin::
	call	___sdcc_enter_ix
	push	af
;curses/winmove.c:28: if ((begy + win->_maxy) > (LINES - 1) || (begx + win->_maxx) > (COLS - 1))
;	genAssign
;	AOP_STK for 
;fetchPairLong
	ld	c, 4 (ix)
	ld	b, 5 (ix)
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
;	genPlus
;	AOP_STK for 
;	AOP_STK for _mvwin_sloc0_1_0
	ld	a, 6 (ix)
	add	a, e
	ld	-2 (ix), a
	ld	a, 7 (ix)
	adc	a, d
	ld	-1 (ix), a
;	genMinus
;fetchPairLong
	ld	de, (_LINES)
	dec	de
;	genCmpGt
;	AOP_STK for _mvwin_sloc0_1_0
	ld	a, e
	sub	a, -2 (ix)
	ld	a, d
	sbc	a, -1 (ix)
	jp	PO, 00111$
	xor	a, #0x80
00111$:
	jp	M, 00101$
;	genAssign
;fetchPairLong
	ld	l, c
	ld	h, b
;	genPointerGet
;fetchPairLong
	ld	de, #0x0006
	add	hl, de
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;	genPlus
;	AOP_STK for 
;	AOP_STK for _mvwin_sloc0_1_0
	ld	a, 8 (ix)
	add	a, e
	ld	-2 (ix), a
	ld	a, 9 (ix)
	adc	a, d
	ld	-1 (ix), a
;	genMinus
;fetchPairLong
	ld	de, (_COLS)
	dec	de
;	genCmpGt
;	AOP_STK for _mvwin_sloc0_1_0
	ld	a, e
	sub	a, -2 (ix)
	ld	a, d
	sbc	a, -1 (ix)
	jp	PO, 00112$
	xor	a, #0x80
00112$:
	jp	P, 00102$
;	genLabel
00101$:
;curses/winmove.c:29: return(ERR);
;	genRet
;fetchPairLong
;fetchLitPair
	ld	hl, #0xffff
	jr	00104$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00102$:
;curses/winmove.c:30: win->_begy = begy;
;	genPlus
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0008
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
;curses/winmove.c:31: win->_begx = begx;
;	genPlus
;fetchPairLong
;fetchLitPair
	ld	hl, #0x000a
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
;curses/winmove.c:32: touchwin(win);
;	genIpush
	push	bc
;	genCall
	call	_touchwin
	pop	af
;curses/winmove.c:33: return(OK);
;	genRet
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0000
;	genLabel
00104$:
;curses/winmove.c:34: }				/* mvwin */
;	genEndFunction
	pop	af
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
