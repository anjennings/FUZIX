;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module move
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _wmove
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
;curses/move.c:4: int wmove(WINDOW *win, int y, int x)
;	genLabel
;	genFunction
;	---------------------------------
; Function wmove
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_wmove::
	call	___sdcc_enter_ix
;curses/move.c:6: if ((x < 0) || (x > win->_maxx) || (y < win->_regtop) || (y > win->_regbottom))
;	genCmpLt
;	AOP_STK for 
	bit	7, 9 (ix)
	jr	NZ,00101$
; peephole 164 changed absolute to relative conditional jump.
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
	ld	de, #0x0006
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
	jp	PO, 00123$
	xor	a, #0x80
00123$:
	jp	M, 00101$
;	genAssign
;fetchPairLong
	ld	l, c
	ld	h, b
;	genPointerGet
;fetchPairLong
	ld	de, #0x0022
	add	hl, de
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;	genCmpLt
;	AOP_STK for 
	ld	a, 6 (ix)
	sub	a, e
	ld	a, 7 (ix)
	sbc	a, d
	jp	PO, 00124$
	xor	a, #0x80
00124$:
	jp	M, 00101$
;	genAssign
;fetchPairLong
	ld	l, c
	ld	h, b
;	genPointerGet
;fetchPairLong
	ld	de, #0x0024
	add	hl, de
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
	jp	PO, 00125$
	xor	a, #0x80
00125$:
	jp	P, 00102$
;	genLabel
00101$:
;curses/move.c:7: return (ERR);
;	genRet
;fetchPairLong
;fetchLitPair
	ld	hl, #0xffff
	jr	00106$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00102$:
;curses/move.c:9: win->_curx = x;
;	genPlus
;fetchPairLong
	ld	e, c
	ld	d, b
	inc	de
	inc	de
;	genAssign (pointer)
;	AOP_STK for 
;	isBitvar = 0
;fetchPairLong
	ld	a, 8 (ix)
	ld	(de), a
	inc	de
	ld	a, 9 (ix)
	ld	(de), a
;curses/move.c:10: win->_cury = y;
;	genAssign (pointer)
;	AOP_STK for 
;	isBitvar = 0
;fetchPairLong
	ld	a, 6 (ix)
	ld	(bc), a
	inc	bc
	ld	a, 7 (ix)
	ld	(bc), a
;curses/move.c:11: return (OK);
;	genRet
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0000
;	genLabel
00106$:
;curses/move.c:12: }
;	genEndFunction
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
