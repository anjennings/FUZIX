;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module waddch
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _scroll
	.globl _waddch
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
;curses/waddch.c:9: static short newline(WINDOW *win, int lin)
;	genLabel
;	genFunction
;	---------------------------------
; Function newline
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_newline:
	call	___sdcc_enter_ix
;curses/waddch.c:11: if (++lin > win->_regbottom) {
;	genPlus
;	AOP_STK for 
	inc	6 (ix)
	jr	NZ,00118$
; peephole 164 changed absolute to relative conditional jump.
	inc	7 (ix)
00118$:
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
	jp	PO, 00119$
	xor	a, #0x80
00119$:
	jp	P, 00105$
;curses/waddch.c:12: lin--;
;	genMinus
;	AOP_STK for 
;fetchPairLong
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	dec	hl
	ld	6 (ix), l
	ld	7 (ix), h
;curses/waddch.c:13: if (win->_scroll)
;	genAssign
;fetchPairLong
	ld	l, c
	ld	h, b
;	genPointerGet
;fetchPairLong
	ld	de, #0x0016
	add	hl, de
;	_moveFrom_tpair_()
;	_moveFrom_tpair_()
;	genIfx
	ld	a, (hl)
	inc	hl
; peephole 99a removed load by reordering or arguments.
	or	a, (hl)
	jr	Z,00102$
; peephole 163 changed absolute to relative conditional jump.
;curses/waddch.c:14: scroll(win);
;	genIpush
	push	bc
;	genCall
	call	_scroll
	pop	af
;	genGoto
	jr	00105$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00102$:
;curses/waddch.c:16: return(-1);
;	genRet
;fetchPairLong
;fetchLitPair
	ld	hl, #0xffff
	jr	00106$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00105$:
;curses/waddch.c:18: return(lin);
;	genRet
;	AOP_STK for 
;fetchPairLong
	ld	l, 6 (ix)
	ld	h, 7 (ix)
;	genLabel
00106$:
;curses/waddch.c:19: }				/* newline */
;	genEndFunction
	pop	ix
	ret
;curses/waddch.c:27: int waddch(WINDOW *win, int c)
;	genLabel
;	genFunction
;	---------------------------------
; Function waddch
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 18 bytes.
_waddch::
	call	___sdcc_enter_ix
	ld	hl, #-18
	add	hl, sp
	ld	sp, hl
;curses/waddch.c:29: int x = win->_curx;
;	genAssign
;	AOP_STK for 
;fetchPairLong
	ld	c, 4 (ix)
	ld	b, 5 (ix)
;	genAssign
;	AOP_STK for _waddch_sloc0_1_0
	ld	-14 (ix), c
	ld	-13 (ix), b
;	genPlus
;	AOP_STK for _waddch_sloc1_1_0
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0002
	add	hl, bc
	ld	-10 (ix), l
	ld	-9 (ix), h
;	genAssign
;	AOP_STK for _waddch_sloc1_1_0
;	AOP_STK for _waddch_sloc2_1_0
	ld	a, -10 (ix)
	ld	-18 (ix), a
	ld	a, -9 (ix)
	ld	-17 (ix), a
;	genPointerGet
;	AOP_STK for _waddch_sloc1_1_0
;fetchPairLong
	ld	l, -10 (ix)
	ld	h, -9 (ix)
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;curses/waddch.c:30: int y = win->_cury;
;	genPointerGet
;	AOP_STK for _waddch_y_65536_145
;	_moveFrom_tpair_()
	ld	a, (bc)
	ld	-2 (ix), a
	inc	bc
;	_moveFrom_tpair_()
	ld	a, (bc)
	ld	-1 (ix), a
	dec	bc
;curses/waddch.c:32: int ch = c;
;	genAssign
;	AOP_STK for 
;	AOP_STK for _waddch_sloc3_1_0
	ld	a, 6 (ix)
	ld	-16 (ix), a
	ld	a, 7 (ix)
	ld	-15 (ix), a
;curses/waddch.c:33: int ts = win->_tabsize;
;	genAssign
;fetchPairLong
	push	bc
	pop	iy
;	genPointerGet
;	AOP_STK for _waddch_ts_65536_145
	ld	a, 16 (iy)
	ld	-6 (ix), a
	ld	a, 17 (iy)
	ld	-5 (ix), a
;curses/waddch.c:35: ch &= (A_ALTCHARSET | 0xff);
;	genAnd
;	AOP_STK for _waddch_sloc3_1_0
;	AOP_STK for _waddch_ch_65536_145
	ld	a, -16 (ix)
	ld	-4 (ix), a
	ld	a, -15 (ix)
	and	a, #0x20
	ld	-3 (ix), a
;curses/waddch.c:36: if (y > win->_maxy || x > win->_maxx || y < 0 || x < 0) return(ERR);
;	genAssign
;fetchPairLong
	push	bc
	pop	iy
;	genPointerGet
;	genCmpGt
;	AOP_STK for _waddch_y_65536_145
	ld	a, 4 (iy)
; peephole 14 loaded 4 (iy) into a directly instead of going through l.
	ld	h, 5 (iy)
	sub	a, -2 (ix)
	ld	a, h
	sbc	a, -1 (ix)
	jp	PO, 00269$
	xor	a, #0x80
00269$:
	jp	M, 00101$
;	genPlus
;	AOP_STK for _waddch_sloc3_1_0
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0006
	add	hl, bc
;	genPointerGet
;	AOP_STK for _waddch_sloc3_1_0
;fetchPairLong
	ld	-16 (ix), l
	ld	-15 (ix), h
; peephole 11 loaded lh from lh directly instead of going through -16 (ix) -15 (ix).
; peephole 0 removed redundant load from l into l.
; peephole 0 removed redundant load from h into h.
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	genCmpGt
; peephole 9 loaded a from a directly instead of going through l.
; peephole 0 removed redundant load from a into a.
	sub	a, e
	ld	a, h
	sbc	a, d
	jp	PO, 00270$
	xor	a, #0x80
00270$:
	jp	M, 00101$
;	genCmpLt
;	AOP_STK for _waddch_y_65536_145
	bit	7, -1 (ix)
	jr	NZ,00101$
; peephole 164 changed absolute to relative conditional jump.
;	genCmpLt
	bit	7, d
	jr	Z,00102$
; peephole 163 changed absolute to relative conditional jump.
;	genLabel
00101$:
;	genRet
;fetchPairLong
;fetchLitPair
	ld	hl, #0xffff
	jp	00147$
;	genLabel
00102$:
;curses/waddch.c:37: switch (ch) {
;	genCmpEq
;	AOP_STK for _waddch_ch_65536_145
	ld	a, -4 (ix)
	sub	a, #0x08
	or	a, -3 (ix)
	jp	Z,00118$
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00271$.
;	genCmpEq
;	AOP_STK for _waddch_ch_65536_145
	ld	a, -4 (ix)
	sub	a, #0x09
	or	a, -3 (ix)
	jr	Z,00106$
; peephole 163 changed absolute to relative conditional jump.
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00272$.
;	genCmpEq
;	AOP_STK for _waddch_ch_65536_145
	ld	a, -4 (ix)
	sub	a, #0x0a
	or	a, -3 (ix)
	jp	Z,00112$
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00273$.
;	genCmpEq
;	AOP_STK for _waddch_ch_65536_145
	ld	a, -4 (ix)
	sub	a, #0x0d
	or	a, -3 (ix)
	jp	Z,00117$
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00274$.
;	genCmpEq
;	AOP_STK for _waddch_ch_65536_145
	ld	a, -4 (ix)
	sub	a, #0x7f
	or	a, -3 (ix)
	jp	Z,00121$
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00275$.
;	genGoto
	jp	00124$
;curses/waddch.c:38: case '\t':
;	genLabel
00106$:
;curses/waddch.c:39: for (newx = ((x / ts) + 1) * ts; x < newx; x++) {
;	genIpush
	push	de
;	AOP_STK for _waddch_ts_65536_145
;fetchPairLong
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	push	hl
;	genIpush
	push	de
;	genCall
	call	__divsint
	pop	af
	pop	af
	pop	de
;	genPlus
	inc	hl
;	genIpush
	push	de
;	AOP_STK for _waddch_ts_65536_145
;fetchPairLong
	ld	c, -6 (ix)
	ld	b, -5 (ix)
	push	bc
;	genIpush
	push	hl
;	genCall
	call	__mulint
	pop	af
	pop	af
	ld	c, l
	ld	b, h
	pop	de
;	genAssign
;	(registers are the same)
;	genAssign
;	(registers are the same)
;	genLabel
00145$:
;	genCmpLt
	ld	a, e
	sub	a, c
	ld	a, d
	sbc	a, b
	jp	PO, 00276$
	xor	a, #0x80
00276$:
	jp	P, 00111$
;curses/waddch.c:40: if (waddch(win, ' ') == ERR) return(ERR);
;	genIpush
	push	bc
	push	de
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0020
	push	hl
;	genIpush
;	AOP_STK for _waddch_sloc0_1_0
;fetchPairLong
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	push	hl
;	genCall
	call	_waddch
	pop	af
	pop	af
	pop	de
	pop	bc
;	genCmpEq
	inc	l
	jr	NZ,00108$
; peephole 164 changed absolute to relative conditional jump.
; peephole 84 jumped to 00108$ directly instead of via 00277$.
	inc	h
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00277$.
	jr	NZ,00108$
; peephole 164 changed absolute to relative conditional jump.
; peephole 82 removed jp by using inverse jump logic
; peephole 158 removed unused label 00278$.
;	genRet
;fetchPairLong
;fetchLitPair
	ld	hl, #0xffff
	jp	00147$
;	genLabel
00108$:
;curses/waddch.c:41: if (win->_curx == 0)	/* if tab to next line */
;	genPointerGet
;	AOP_STK for _waddch_sloc2_1_0
;fetchPairLong
	pop	hl
	push	hl
	inc	hl
	ld	a, (hl)
	dec	hl
	ld	l, (hl)
;	genIfx
	or	a, l
	jr	NZ,00146$
; peephole 164 changed absolute to relative conditional jump.
;curses/waddch.c:42: return(OK);	/* exit the loop */
;	genRet
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0000
	jp	00147$
;	genLabel
00146$:
;curses/waddch.c:39: for (newx = ((x / ts) + 1) * ts; x < newx; x++) {
;	genPlus
	inc	de
;	genGoto
	jr	00145$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00111$:
;curses/waddch.c:44: return(OK);
;	genRet
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0000
	jp	00147$
;curses/waddch.c:46: case '\n':
;	genLabel
00112$:
;curses/waddch.c:47: if (NONL) x = 0;
;	genIfx
;fetchLitPair
	ld	iy, #_NONL
	ld	a, 1 (iy)
;fetchLitPair
	or	a, 0 (iy)
	jr	Z,00114$
; peephole 163 changed absolute to relative conditional jump.
;	genAssign
;fetchPairLong
;fetchLitPair
	ld	de, #0x0000
;	genLabel
00114$:
;curses/waddch.c:48: if ((y = newline(win, y)) < 0) return (ERR);
;	genIpush
	push	bc
	push	de
;	AOP_STK for _waddch_y_65536_145
;fetchPairLong
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	push	hl
;	genIpush
	push	bc
;	genCall
	call	_newline
	pop	af
	pop	af
	pop	de
	pop	bc
;	genAssign
;	AOP_STK for _waddch_y_65536_145
	ld	-2 (ix), l
	ld	-1 (ix), h
;	genCmpLt
	bit	7, h
	jp	Z, 00143$
;	genRet
;fetchPairLong
;fetchLitPair
	ld	hl, #0xffff
	jp	00147$
;curses/waddch.c:51: case '\r':	x = 0;	break;
;	genLabel
00117$:
;	genAssign
;fetchPairLong
;fetchLitPair
	ld	de, #0x0000
;	genGoto
	jp	00143$
;curses/waddch.c:53: case '\b':
;	genLabel
00118$:
;curses/waddch.c:54: if (--x < 0)		/* no back over left margin */
;	genMinus
	dec	de
;	genCmpLt
	bit	7, d
	jp	Z, 00143$
;curses/waddch.c:55: x = 0;
;	genAssign
;fetchPairLong
;fetchLitPair
	ld	de, #0x0000
;curses/waddch.c:56: break;
;	genGoto
	jp	00143$
;curses/waddch.c:58: case 0x7f:
;	genLabel
00121$:
;curses/waddch.c:60: if (waddch(win, '^') == ERR) return(ERR);
;	genIpush
	push	bc
;fetchPairLong
;fetchLitPair
	ld	hl, #0x005e
	push	hl
;	genIpush
	push	bc
;	genCall
	call	_waddch
	pop	af
	pop	af
	pop	bc
;	genCmpEq
	inc	l
	jr	NZ,00123$
; peephole 164 changed absolute to relative conditional jump.
; peephole 84 jumped to 00123$ directly instead of via 00279$.
	inc	h
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00279$.
	jr	NZ,00123$
; peephole 164 changed absolute to relative conditional jump.
; peephole 82 removed jp by using inverse jump logic
; peephole 158 removed unused label 00280$.
;	genRet
;fetchPairLong
;fetchLitPair
	ld	hl, #0xffff
	jp	00147$
;	genLabel
00123$:
;curses/waddch.c:61: return(waddch(win, '?'));
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #0x003f
	push	hl
;	genIpush
	push	bc
;	genCall
	call	_waddch
	pop	af
	pop	af
;	genRet
;fetchPairLong
	jp	00147$
;curses/waddch.c:64: default:
;	genLabel
00124$:
;curses/waddch.c:65: if (ch < ' ') {		/* handle control chars */
;	genCmpLt
;	AOP_STK for _waddch_ch_65536_145
	ld	a, -4 (ix)
	sub	a, #0x20
	ld	a, -3 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00128$
; peephole 166 changed absolute to relative conditional jump.
;curses/waddch.c:66: if (waddch(win, '^') == ERR) return(ERR);
;	genIpush
	push	bc
;fetchPairLong
;fetchLitPair
	ld	hl, #0x005e
	push	hl
;	genIpush
	push	bc
;	genCall
	call	_waddch
	pop	af
	pop	af
	pop	bc
;	genCmpEq
	inc	l
	jr	NZ,00126$
; peephole 164 changed absolute to relative conditional jump.
; peephole 84 jumped to 00126$ directly instead of via 00281$.
	inc	h
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00281$.
	jr	NZ,00126$
; peephole 164 changed absolute to relative conditional jump.
; peephole 82 removed jp by using inverse jump logic
; peephole 158 removed unused label 00282$.
;	genRet
;fetchPairLong
;fetchLitPair
	ld	hl, #0xffff
	jp	00147$
;	genLabel
00126$:
;curses/waddch.c:67: return(waddch(win, c + '@'));
;	genPlus
;	AOP_STK for 
	ld	a, 6 (ix)
	add	a, #0x40
	ld	e, a
	ld	a, 7 (ix)
	adc	a, #0x00
	ld	d, a
;	genIpush
	push	de
;	genIpush
	push	bc
;	genCall
	call	_waddch
	pop	af
	pop	af
;	genRet
;fetchPairLong
	jp	00147$
;	genLabel
00128$:
;curses/waddch.c:69: ch |= (win->_attrs & ATR_MSK);
;	genAssign
;fetchPairLong
	push	bc
	pop	iy
;	genPointerGet
; peephole 7 removed dead load from 14 (iy) into l.
	ld	h, 15 (iy)
;	genAnd
	ld	l, #0x00
;	genOr
;	AOP_STK for _waddch_ch_65536_145
;	AOP_STK for _waddch_sloc2_1_0
	ld	a, -4 (ix)
	or	a, l
	ld	-18 (ix), a
	ld	a, -3 (ix)
	or	a, h
	ld	-17 (ix), a
;curses/waddch.c:70: if (win->_line[y][x] != ch) {	/* only if data change */
;	genPlus
;	AOP_STK for _waddch_sloc0_1_0
;fetchPairLong
;fetchLitPair
	ld	hl, #0x001c
	add	hl, bc
;	genPointerGet
;	AOP_STK for _waddch_sloc0_1_0
;fetchPairLong
	ld	-14 (ix), l
	ld	-13 (ix), h
; peephole 11 loaded lh from lh directly instead of going through -14 (ix) -13 (ix).
; peephole 0 removed redundant load from l into l.
; peephole 0 removed redundant load from h into h.
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
;	genLeftShift
;	AOP_STK for _waddch_y_65536_145
;	AOP_STK for _waddch_sloc4_1_0
	ld	a, -2 (ix)
	ld	-8 (ix), a
	ld	a, -1 (ix)
	ld	-7 (ix), a
	sla	-8 (ix)
	rl	-7 (ix)
;	genPlus
;	AOP_STK for _waddch_sloc4_1_0
	ld	a, l
	add	a, -8 (ix)
	ld	l, a
	ld	a, h
	adc	a, -7 (ix)
	ld	h, a
;	genPointerGet
;	AOP_STK for _waddch_sloc5_1_0
;fetchPairLong
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-12 (ix), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-11 (ix), a
;	genLeftShift
;fetchPairLong
	ld	l, e
	ld	h, d
	add	hl, hl
;	genPlus
;	AOP_STK for _waddch_sloc5_1_0
	ld	a, -12 (ix)
	add	a, l
	ld	l, a
	ld	a, -11 (ix)
	adc	a, h
	ld	h, a
;	genPointerGet
;	AOP_STK for _waddch_sloc5_1_0
;fetchPairLong
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-12 (ix), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-11 (ix), a
;	genCmpEq
;	AOP_STK for _waddch_sloc2_1_0
;	AOP_STK for _waddch_sloc5_1_0
	ld	a, -18 (ix)
	sub	a, -12 (ix)
	jr	NZ,00285$
; peephole 164 changed absolute to relative conditional jump.
	ld	a, -17 (ix)
	sub	a, -11 (ix)
	jp	Z,00138$
; peephole 81 removed jp by using inverse jump logic
00285$:
;curses/waddch.c:71: if (win->_minchng[y] == _NO_CHANGE)
;	genAssign
;fetchPairLong
	push	bc
	pop	iy
;	genPointerGet
	ld	l, 30 (iy)
	ld	h, 31 (iy)
;	genPlus
;	AOP_STK for _waddch_sloc4_1_0
;fetchPairLong
	push	hl
	pop	iy
	push	bc
;fetchPairLong
	ld	c, -8 (ix)
	ld	b, -7 (ix)
	add	iy, bc
	pop	bc
;	genPointerGet
;	AOP_STK for _waddch_sloc5_1_0
	ld	a, 0 (iy)
	ld	-12 (ix), a
	ld	a, 1 (iy)
	ld	-11 (ix), a
;curses/waddch.c:72: win->_minchng[y] = win->_maxchng[y] = x;
;	genPlus
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0020
	add	hl, bc
;curses/waddch.c:71: if (win->_minchng[y] == _NO_CHANGE)
;	genCmpEq
;	AOP_STK for _waddch_sloc5_1_0
	ld	a, -12 (ix)
	inc	a
	jr	NZ,00135$
; peephole 164 changed absolute to relative conditional jump.
; peephole 84 jumped to 00135$ directly instead of via 00286$.
	ld	a, -11 (ix)
	inc	a
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00286$.
	jr	NZ,00135$
; peephole 164 changed absolute to relative conditional jump.
; peephole 82 removed jp by using inverse jump logic
; peephole 158 removed unused label 00287$.
;curses/waddch.c:72: win->_minchng[y] = win->_maxchng[y] = x;
;	genPointerGet
;fetchPairLong
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	genPlus
;	AOP_STK for _waddch_sloc4_1_0
; peephole 9 loaded a from a directly instead of going through l.
; peephole 0 removed redundant load from a into a.
	add	a, -8 (ix)
	ld	l, a
	ld	a, h
	adc	a, -7 (ix)
	ld	h, a
;	genAssign (pointer)
;	isBitvar = 0
;fetchPairLong
	ld	(hl), e
	inc	hl
	ld	(hl), d
;	genAssign (pointer)
;	isBitvar = 0
	ld	0 (iy), e
	ld	1 (iy), d
;	genGoto
	jr	00138$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00135$:
;curses/waddch.c:73: else if (x < win->_minchng[y])
;	genCmpLt
;	AOP_STK for _waddch_sloc5_1_0
	ld	a, e
	sub	a, -12 (ix)
	ld	a, d
	sbc	a, -11 (ix)
	jp	PO, 00288$
	xor	a, #0x80
00288$:
	jp	P, 00132$
;curses/waddch.c:74: win->_minchng[y] = x;
;	genAssign (pointer)
;	isBitvar = 0
	ld	0 (iy), e
	ld	1 (iy), d
;	genGoto
	jr	00138$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00132$:
;curses/waddch.c:75: else if (x > win->_maxchng[y])
;	genPointerGet
;fetchPairLong
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
;	genPlus
;	AOP_STK for _waddch_sloc4_1_0
;fetchPairLong
	push	hl
	pop	iy
	push	bc
;fetchPairLong
	ld	c, -8 (ix)
	ld	b, -7 (ix)
	add	iy, bc
	pop	bc
;	genPointerGet
;	genCmpGt
	ld	a, 0 (iy)
; peephole 14 loaded 0 (iy) into a directly instead of going through l.
	ld	h, 1 (iy)
	sub	a, e
	ld	a, h
	sbc	a, d
	jp	PO, 00289$
	xor	a, #0x80
00289$:
	jp	P, 00138$
;curses/waddch.c:76: win->_maxchng[y] = x;
;	genAssign (pointer)
;	isBitvar = 0
	ld	0 (iy), e
	ld	1 (iy), d
;	genLabel
00138$:
;curses/waddch.c:78: *(*(win->_line + y)  + x++) = ch;
;	genPointerGet
;	AOP_STK for _waddch_sloc0_1_0
;fetchPairLong
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
;	genPlus
;	AOP_STK for _waddch_sloc4_1_0
	ld	a, -8 (ix)
	add	a, l
	ld	l, a
	ld	a, -7 (ix)
	adc	a, h
	ld	h, a
;	genPointerGet
;fetchPairLong
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
;	genAssign
;fetchPairLong
	push	de
	pop	iy
;	genPlus
	inc	de
;	genLeftShift
;fetchPairLong
	add	iy, iy
;	genPlus
;fetchPairLong
	push	bc
;fetchPairLong
	ld	c, l
	ld	b, h
	add	iy, bc
	pop	bc
;	genAssign (pointer)
;	AOP_STK for _waddch_sloc2_1_0
;	isBitvar = 0
	ld	a, -18 (ix)
	ld	0 (iy), a
	ld	a, -17 (ix)
	ld	1 (iy), a
;curses/waddch.c:79: if (x > win->_maxx) {	/* wrap around test */
;	genPointerGet
;	AOP_STK for _waddch_sloc3_1_0
;fetchPairLong
	ld	l, -16 (ix)
	ld	h, -15 (ix)
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	genCmpGt
; peephole 9 loaded a from a directly instead of going through l.
; peephole 0 removed redundant load from a into a.
	sub	a, e
	ld	a, h
	sbc	a, d
	jp	PO, 00290$
	xor	a, #0x80
00290$:
	jp	P, 00143$
;curses/waddch.c:80: x = 0;
;	genAssign
;fetchPairLong
;fetchLitPair
	ld	de, #0x0000
;curses/waddch.c:81: if ((y = newline(win, y)) < 0) return(ERR);
;	genIpush
	push	bc
	push	de
;	AOP_STK for _waddch_y_65536_145
;fetchPairLong
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	push	hl
;	genIpush
	push	bc
;	genCall
	call	_newline
	pop	af
	pop	af
	pop	de
	pop	bc
;	genAssign
;	AOP_STK for _waddch_y_65536_145
	ld	-2 (ix), l
	ld	-1 (ix), h
;	genCmpLt
	bit	7, h
	jr	Z,00143$
; peephole 163 changed absolute to relative conditional jump.
;	genRet
;fetchPairLong
;fetchLitPair
	ld	hl, #0xffff
	jr	00147$
; peephole 162 changed absolute to relative unconditional jump.
;curses/waddch.c:85: }				/* switch */
;	genLabel
00143$:
;curses/waddch.c:86: win->_curx = x;
;	genAssign (pointer)
;	AOP_STK for _waddch_sloc1_1_0
;	isBitvar = 0
;fetchPairLong
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
;curses/waddch.c:87: win->_cury = y;
;	genAssign (pointer)
;	AOP_STK for _waddch_y_65536_145
;	isBitvar = 0
;fetchPairLong
	ld	a, -2 (ix)
	ld	(bc), a
	inc	bc
	ld	a, -1 (ix)
	ld	(bc), a
;curses/waddch.c:89: return(OK);
;	genRet
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0000
;	genLabel
00147$:
;curses/waddch.c:90: }
;	genEndFunction
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
