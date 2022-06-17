;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module wdelch
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _wdelch
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
;curses/wdelch.c:9: int wdelch(WINDOW *win)
;	genLabel
;	genFunction
;	---------------------------------
; Function wdelch
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 10 bytes.
_wdelch::
	call	___sdcc_enter_ix
	ld	hl, #-10
	add	hl, sp
	ld	sp, hl
;curses/wdelch.c:14: int y = win->_cury;
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
;curses/wdelch.c:15: int x = win->_curx;
;	genAssign
;fetchPairLong
	ld	l, c
	ld	h, b
;	genPointerGet
;	AOP_STK for _wdelch_x_65536_142
;fetchPairLong
	inc	hl
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-4 (ix), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-3 (ix), a
;curses/wdelch.c:16: int maxx = win->_maxx;
;	genAssign
;fetchPairLong
	push	bc
	pop	iy
;	genPointerGet
;	AOP_STK for _wdelch_maxx_65536_142
	ld	a, 6 (iy)
	ld	-6 (ix), a
	ld	a, 7 (iy)
	ld	-5 (ix), a
;curses/wdelch.c:18: end = &win->_line[y][maxx];
;	genAssign
;fetchPairLong
	push	bc
	pop	iy
;	genPointerGet
	ld	l, 28 (iy)
	ld	h, 29 (iy)
;	genLeftShift
;	AOP_STK for _wdelch_sloc0_1_0
	sla	e
	rl	d
;	genPlus
;	AOP_STK for _wdelch_sloc0_1_0
;fetchPairLong
	ld	-8 (ix), e
	ld	-7 (ix), d
; peephole 11 loaded ed from ed directly instead of going through -8 (ix) -7 (ix).
; peephole 0 removed redundant load from e into e.
; peephole 0 removed redundant load from d into d.
	add	hl, de
;	genPointerGet
;fetchPairLong
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;	genLeftShift
;	AOP_STK for _wdelch_maxx_65536_142
;fetchPairLong
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	add	hl, hl
;	genPlus
	add	hl, de
;	genAssign
;	AOP_STK for _wdelch_end_65536_142
	ld	-2 (ix), l
	ld	-1 (ix), h
;curses/wdelch.c:19: temp1 = &win->_line[y][x];
;	genLeftShift
;	AOP_STK for _wdelch_x_65536_142
;fetchPairLong
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	add	hl, hl
;	genPlus
	add	hl, de
	ex	de, hl
;	genAssign
;	(registers are the same)
;curses/wdelch.c:20: temp2 = temp1 + 1;
;	genPlus
;fetchPairLong
	push	de
	pop	iy
	inc	iy
	inc	iy
;curses/wdelch.c:21: while (temp1 < end) *temp1++ = *temp2++;
;	genAssign
;	(registers are the same)
;	genLabel
00101$:
;	genCmpLt
;	AOP_STK for _wdelch_end_65536_142
	ld	a, e
	sub	a, -2 (ix)
	ld	a, d
	sbc	a, -1 (ix)
	jr	NC,00103$
; peephole 166 changed absolute to relative conditional jump.
;	genPointerGet
;	AOP_STK for _wdelch_sloc1_1_0
	ld	a, 0 (iy)
	ld	-10 (ix), a
	ld	a, 1 (iy)
	ld	-9 (ix), a
;	genPlus
	inc	iy
	inc	iy
;fetchPairLong
;	genAssign (pointer)
;	AOP_STK for _wdelch_sloc1_1_0
;	isBitvar = 0
;fetchPairLong
	ld	l, e
	ld	h, d
	ld	a, -10 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -9 (ix)
	ld	(hl), a
;	genPlus
	inc	de
	inc	de
;	genGoto
	jr	00101$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00103$:
;curses/wdelch.c:22: *temp1 = ' ' | (win->_attrs & ATR_MSK);
;	genAssign
;fetchPairLong
	push	bc
	pop	iy
;	genPointerGet
; peephole 7 removed dead load from 14 (iy) into l.
	ld	h, 15 (iy)
;	genAnd
;	genOr
;	AOP_STK for _wdelch_sloc1_1_0
; peephole 9 loaded a from #0x00 directly instead of going through l.
	ld	a, #0x00
	or	a, #0x20
	ld	-10 (ix), a
	ld	-9 (ix), h
;	genAssign (pointer)
;	AOP_STK for _wdelch_sloc1_1_0
;	isBitvar = 0
;fetchPairLong
	ld	a, -10 (ix)
	ld	(de), a
	inc	de
	ld	a, -9 (ix)
	ld	(de), a
;curses/wdelch.c:23: win->_maxchng[y] = maxx;
;	genAssign
;fetchPairLong
	ld	l, c
	ld	h, b
;	genPointerGet
;fetchPairLong
	ld	de, #0x0020
	add	hl, de
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;	genPlus
;	AOP_STK for _wdelch_sloc0_1_0
;fetchPairLong
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	add	hl, de
;	genAssign (pointer)
;	AOP_STK for _wdelch_maxx_65536_142
;	isBitvar = 0
;fetchPairLong
	ld	a, -6 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -5 (ix)
	ld	(hl), a
;curses/wdelch.c:24: if (win->_minchng[y] == _NO_CHANGE || win->_minchng[y] > x)
;	genAssign
;	(registers are the same)
;	genPointerGet
;fetchPairLong
	ld	l, c
	ld	h, b
	ld	de, #0x001e
	add	hl, de
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genPlus
;	AOP_STK for _wdelch_sloc0_1_0
;fetchPairLong
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	add	hl, bc
;	genPointerGet
	push	hl
;fetchPairLong
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
	pop	hl
;	genCmpEq
	ld	a, c
	inc	a
	jr	NZ,00127$
; peephole 164 changed absolute to relative conditional jump.
	ld	a, b
	inc	a
	jr	Z,00104$
; peephole 163 changed absolute to relative conditional jump.
; peephole 81 removed jp by using inverse jump logic
00127$:
;	genCmpGt
;	AOP_STK for _wdelch_x_65536_142
	ld	a, -4 (ix)
	sub	a, c
	ld	a, -3 (ix)
	sbc	a, b
	jp	PO, 00128$
	xor	a, #0x80
00128$:
	jp	P, 00105$
;	genLabel
00104$:
;curses/wdelch.c:25: win->_minchng[y] = x;
;	genAssign (pointer)
;	AOP_STK for _wdelch_x_65536_142
;	isBitvar = 0
;fetchPairLong
	ld	a, -4 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -3 (ix)
	ld	(hl), a
;	genLabel
00105$:
;curses/wdelch.c:26: return(OK);
;	genRet
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0000
;	genLabel
; peephole 158 removed unused label 00107$.
;curses/wdelch.c:27: }
;	genEndFunction
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
