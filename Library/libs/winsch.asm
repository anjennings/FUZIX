;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module winsch
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _waddch
	.globl _winsch
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
;curses/winsch.c:8: int winsch(WINDOW *win, char c)
;	genLabel
;	genFunction
;	---------------------------------
; Function winsch
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 14 bytes.
_winsch::
	call	___sdcc_enter_ix
	ld	hl, #-14
	add	hl, sp
	ld	sp, hl
;curses/winsch.c:13: int x = win->_curx;
;	genAssign
;	AOP_STK for 
;	AOP_STK for _winsch_sloc0_1_0
	ld	a, 4 (ix)
	ld	-10 (ix), a
	ld	a, 5 (ix)
	ld	-9 (ix), a
;	genAssign
;	AOP_STK for _winsch_sloc0_1_0
;fetchPairLong
	ld	l, -10 (ix)
	ld	h, -9 (ix)
;	genPointerGet
;	AOP_STK for _winsch_x_65536_142
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
;curses/winsch.c:14: int y = win->_cury;
;	genPointerGet
;	AOP_STK for _winsch_sloc0_1_0
;	AOP_STK for _winsch_y_65536_142
;fetchPairLong
	ld	l, -10 (ix)
	ld	h, -9 (ix)
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-6 (ix), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-5 (ix), a
;curses/winsch.c:15: int maxx = win->_maxx;
;	genAssign
;	AOP_STK for _winsch_sloc0_1_0
;fetchPairLong
	ld	l, -10 (ix)
	ld	h, -9 (ix)
;	genPointerGet
;	AOP_STK for _winsch_maxx_65536_142
;fetchPairLong
	ld	de, #0x0006
	add	hl, de
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-8 (ix), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-7 (ix), a
;curses/winsch.c:17: if ((c < ' ') && (c == '\n' || c == '\r' || c == '\t' || c == '\b'))
;	genCmpLt
;	AOP_STK for 
	ld	a, 6 (ix)
	sub	a, #0x20
	ld	a, #0x00
	rla
	ld	c, a
;curses/winsch.c:18: return(waddch(win, c));
;	genCast
;	AOP_STK for 
;	AOP_STK for _winsch_sloc1_1_0
	ld	a, 6 (ix)
	ld	-12 (ix), a
	ld	-11 (ix), #0x00
;curses/winsch.c:17: if ((c < ' ') && (c == '\n' || c == '\r' || c == '\t' || c == '\b'))
;	genIfx
	ld	a, c
	or	a, a
	jr	Z,00102$
; peephole 163 changed absolute to relative conditional jump.
;	genCmpEq
;	AOP_STK for 
	ld	a, 6 (ix)
	sub	a, #0x0a
	jr	Z,00101$
; peephole 163 changed absolute to relative conditional jump.
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00158$.
;	genCmpEq
;	AOP_STK for 
	ld	a, 6 (ix)
	sub	a, #0x0d
	jr	Z,00101$
; peephole 163 changed absolute to relative conditional jump.
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00159$.
;	genCmpEq
;	AOP_STK for 
	ld	a, 6 (ix)
	sub	a, #0x09
	jr	Z,00101$
; peephole 163 changed absolute to relative conditional jump.
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00160$.
;	genCmpEq
;	AOP_STK for 
	ld	a, 6 (ix)
	sub	a, #0x08
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00161$.
	jr	NZ,00102$
; peephole 164 changed absolute to relative conditional jump.
; peephole 82 removed jp by using inverse jump logic
; peephole 158 removed unused label 00162$.
;	genLabel
00101$:
;curses/winsch.c:18: return(waddch(win, c));
;	genIpush
;	AOP_STK for _winsch_sloc1_1_0
;fetchPairLong
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
;	genIpush
;	AOP_STK for _winsch_sloc0_1_0
;fetchPairLong
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	push	hl
;	genCall
	call	_waddch
	pop	af
	pop	af
;	genRet
;fetchPairLong
	jp	00115$
;	genLabel
00102$:
;curses/winsch.c:19: end = &win->_line[y][x];
;	genAssign
;	AOP_STK for _winsch_sloc0_1_0
;fetchPairLong
	ld	l, -10 (ix)
	ld	h, -9 (ix)
;	genPointerGet
;fetchPairLong
	ld	de, #0x001c
	add	hl, de
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;	genLeftShift
;	AOP_STK for _winsch_y_65536_142
;	AOP_STK for _winsch_sloc2_1_0
	ld	a, -6 (ix)
	ld	-14 (ix), a
	ld	a, -5 (ix)
	ld	-13 (ix), a
	sla	-14 (ix)
	rl	-13 (ix)
;	genPlus
;	AOP_STK for _winsch_sloc2_1_0
;fetchPairLong
	pop	hl
	push	hl
	add	hl, de
;	genPointerGet
;fetchPairLong
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;	genLeftShift
;	AOP_STK for _winsch_x_65536_142
;fetchPairLong
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	add	hl, hl
;	genPlus
	add	hl, de
;	genAssign
;	AOP_STK for _winsch_end_65536_142
	ld	-2 (ix), l
	ld	-1 (ix), h
;curses/winsch.c:20: temp1 = &win->_line[y][maxx];
;	genLeftShift
;	AOP_STK for _winsch_maxx_65536_142
;fetchPairLong
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	add	hl, hl
;	genPlus
	add	hl, de
	ex	de, hl
;	genAssign
;	(registers are the same)
;curses/winsch.c:21: temp2 = temp1 - 1;
;	genMinus
;fetchPairLong
	ld	l, e
	ld	h, d
	dec	hl
	dec	hl
;curses/winsch.c:22: if (c < ' ')			/* if CTRL-char make space for 2 */
;	genIfx
	ld	a, c
	or	a, a
	jr	Z,00123$
; peephole 163 changed absolute to relative conditional jump.
;curses/winsch.c:23: temp2--;
;	genMinus
	dec	hl
	dec	hl
;curses/winsch.c:24: while (temp1 > end) *temp1-- = *temp2--;
;	genLabel
00123$:
;	genAssign
;fetchPairLong
	push	hl
	pop	iy
;	genAssign
;	(registers are the same)
;	genLabel
00109$:
;	genCmpGt
;	AOP_STK for _winsch_end_65536_142
	ld	a, -2 (ix)
	sub	a, e
	ld	a, -1 (ix)
	sbc	a, d
	jr	NC,00111$
; peephole 166 changed absolute to relative conditional jump.
;	genPointerGet
	ld	c, 0 (iy)
	ld	b, 1 (iy)
;	genMinus
	dec	iy
	dec	iy
;	genAssign (pointer)
;	isBitvar = 0
;fetchPairLong
	ld	l, e
	ld	h, d
	ld	(hl), c
	inc	hl
	ld	(hl), b
;	genMinus
	dec	de
	dec	de
;	genGoto
	jr	00109$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00111$:
;curses/winsch.c:25: win->_maxchng[y] = maxx;
;	genAssign
;	AOP_STK for _winsch_sloc0_1_0
;fetchPairLong
	ld	l, -10 (ix)
	ld	h, -9 (ix)
;	genPointerGet
;fetchPairLong
	ld	de, #0x0020
	add	hl, de
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genPlus
;	AOP_STK for _winsch_sloc2_1_0
;fetchPairLong
	pop	hl
	push	hl
	add	hl, bc
;	genAssign (pointer)
;	AOP_STK for _winsch_maxx_65536_142
;	isBitvar = 0
;fetchPairLong
	ld	a, -8 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -7 (ix)
	ld	(hl), a
;curses/winsch.c:26: if ((win->_minchng[y] == _NO_CHANGE) || (win->_minchng[y] > x))
;	genAssign
;	AOP_STK for _winsch_sloc0_1_0
;fetchPairLong
	ld	l, -10 (ix)
	ld	h, -9 (ix)
;	genPointerGet
;fetchPairLong
	ld	de, #0x001e
	add	hl, de
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genPlus
;	AOP_STK for _winsch_sloc2_1_0
;fetchPairLong
	pop	hl
	push	hl
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
	jr	NZ,00165$
; peephole 164 changed absolute to relative conditional jump.
	ld	a, b
	inc	a
	jr	Z,00112$
; peephole 163 changed absolute to relative conditional jump.
; peephole 81 removed jp by using inverse jump logic
00165$:
;	genCmpGt
;	AOP_STK for _winsch_x_65536_142
	ld	a, -4 (ix)
	sub	a, c
	ld	a, -3 (ix)
	sbc	a, b
	jp	PO, 00166$
	xor	a, #0x80
00166$:
	jp	P, 00113$
;	genLabel
00112$:
;curses/winsch.c:27: win->_minchng[y] = x;
;	genAssign (pointer)
;	AOP_STK for _winsch_x_65536_142
;	isBitvar = 0
;fetchPairLong
	ld	a, -4 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -3 (ix)
	ld	(hl), a
;	genLabel
00113$:
;curses/winsch.c:28: return(waddch(win, c));	/* fixes CTRL-chars too */
;	genIpush
;	AOP_STK for _winsch_sloc1_1_0
;fetchPairLong
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
;	genIpush
;	AOP_STK for _winsch_sloc0_1_0
;fetchPairLong
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	push	hl
;	genCall
	call	_waddch
	pop	af
	pop	af
;	genRet
;fetchPairLong
;	genLabel
00115$:
;curses/winsch.c:29: }				/* winsch */
;	genEndFunction
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
