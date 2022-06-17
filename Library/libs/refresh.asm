;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module refresh
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _doupdate
	.globl _wrefresh
	.globl _wnoutrefresh
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
;curses/refresh.c:7: void wrefresh(WINDOW *win)
;	genLabel
;	genFunction
;	---------------------------------
; Function wrefresh
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_wrefresh::
;curses/refresh.c:9: if (win == curscr)
;	genCmpEq
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 2, size 2
; peephole 62 used hl instead of iy.
	ld	hl, #2+0
	add	hl, sp
	ld	a, (hl)
;fetchLitPair
	ld	iy, #_curscr
	sub	a, 0 (iy)
	jr	NZ,00102$
; peephole 164 changed absolute to relative conditional jump.
; peephole 84 jumped to 00102$ directly instead of via 00111$.
; peephole 62 used hl instead of iy.
	ld	hl, #2+1
	add	hl, sp
	ld	a, (hl)
;fetchLitPair
	ld	iy, #_curscr
	sub	a, 1 (iy)
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00111$.
	jr	NZ,00102$
; peephole 164 changed absolute to relative conditional jump.
; peephole 82 removed jp by using inverse jump logic
; peephole 158 removed unused label 00112$.
;curses/refresh.c:10: curscr->_clear = TRUE;
;	genAssign
;fetchPairLong
	ld	hl, (_curscr)
;	genPlus
;fetchPairLong
;fetchLitPair
	ld	bc, #0x0012
	add	hl, bc
;	genAssign (pointer)
;	isBitvar = 0
;fetchPairLong
	ld	(hl), #0x01
	inc	hl
	ld	(hl), #0x00
;	genGoto
	jp	_doupdate
; peephole 83 jumped to _doupdate directly instead of via 00103$.
;	genLabel
00102$:
;curses/refresh.c:12: wnoutrefresh(win);
;	genIpush
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 2, size 2
;fetchPairLong
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
;	genCall
	call	_wnoutrefresh
	pop	af
;	genLabel
; peephole 158 removed unused label 00103$.
;curses/refresh.c:13: doupdate();
;	genCall
;	genLabel
; peephole 158 removed unused label 00104$.
;curses/refresh.c:14: }
;	genEndFunction
	jp  _doupdate
; peephole 135 replaced call at end of function by jump (tail call optimization).
;curses/refresh.c:22: void wnoutrefresh(register WINDOW *win)
;	genLabel
;	genFunction
;	---------------------------------
; Function wnoutrefresh
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 44 bytes.
_wnoutrefresh::
	call	___sdcc_enter_ix
	ld	hl, #-44
	add	hl, sp
	ld	sp, hl
;curses/refresh.c:35: nscr = _cursvar.tmpwin;
;	genPointerGet
	ld	bc, (#__cursvar + 0)
;curses/refresh.c:36: begy = win->_begy;
;	genAssign
;	AOP_STK for 
;fetchPairLong
	ld	e, 4 (ix)
	ld	d, 5 (ix)
;	genAssign
;fetchPairLong
	push	de
	pop	iy
;	genPointerGet
;	AOP_STK for _wnoutrefresh_begy_65536_144
	ld	a, 8 (iy)
	ld	-8 (ix), a
	ld	a, 9 (iy)
	ld	-7 (ix), a
;curses/refresh.c:37: begx = win->_begx;
;	genAssign
;fetchPairLong
	push	de
	pop	iy
;	genPointerGet
;	AOP_STK for _wnoutrefresh_begx_65536_144
	ld	a, 10 (iy)
	ld	-10 (ix), a
	ld	a, 11 (iy)
	ld	-9 (ix), a
;curses/refresh.c:39: for (i = 0, j = begy; i <= win->_maxy; i++, j++) {
;	genPlus
;	AOP_STK for _wnoutrefresh_sloc0_1_0
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0020
	add	hl, de
	ld	-26 (ix), l
	ld	-25 (ix), h
;	genAssign
;	AOP_STK for _wnoutrefresh_sloc1_1_0
	ld	-16 (ix), c
	ld	-15 (ix), b
;	genAssign
;	AOP_STK for _wnoutrefresh_sloc2_1_0
	ld	-34 (ix), e
	ld	-33 (ix), d
;	genAssign
;	AOP_STK for _wnoutrefresh_sloc3_1_0
	ld	-36 (ix), c
	ld	-35 (ix), b
;	genAssign
;	AOP_STK for _wnoutrefresh_sloc4_1_0
	ld	-38 (ix), c
	ld	-37 (ix), b
;	genPlus
;	AOP_STK for _wnoutrefresh_sloc5_1_0
;fetchPairLong
;fetchLitPair
	ld	hl, #0x001e
	add	hl, de
	ld	-40 (ix), l
	ld	-39 (ix), h
;	genAssign
;	AOP_STK for _wnoutrefresh_sloc0_1_0
;	AOP_STK for _wnoutrefresh_sloc6_1_0
	ld	a, -26 (ix)
	ld	-42 (ix), a
	ld	a, -25 (ix)
	ld	-41 (ix), a
;	genAssign
;	AOP_STK for _wnoutrefresh_sloc7_1_0
	inc	sp
	inc	sp
	push	de
;	genAssign
;	AOP_STK for _wnoutrefresh_i_65536_144
	ld	-12 (ix), #0x00
	ld	-11 (ix), #0x00
;	genAssign
;	AOP_STK for _wnoutrefresh_begy_65536_144
;	AOP_STK for _wnoutrefresh_j_65536_144
	ld	a, -8 (ix)
	ld	-14 (ix), a
	ld	a, -7 (ix)
	ld	-13 (ix), a
;	genLabel
00117$:
;	genPointerGet
;	AOP_STK for _wnoutrefresh_sloc7_1_0
;fetchPairLong
	pop	hl
	push	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	genCmpGt
;	AOP_STK for _wnoutrefresh_i_65536_144
; peephole 9 loaded a from a directly instead of going through l.
; peephole 0 removed redundant load from a into a.
	sub	a, -12 (ix)
	ld	a, h
	sbc	a, -11 (ix)
	jp	PO, 00168$
	xor	a, #0x80
00168$:
	jp	M, 00111$
;curses/refresh.c:40: if (win->_minchng[i] != _NO_CHANGE) {
;	genPointerGet
;	AOP_STK for _wnoutrefresh_sloc5_1_0
;fetchPairLong
	ld	l, -40 (ix)
	ld	h, -39 (ix)
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
;	genLeftShift
;	AOP_STK for _wnoutrefresh_i_65536_144
;	AOP_STK for _wnoutrefresh_sloc8_1_0
	ld	a, -12 (ix)
	ld	-18 (ix), a
	ld	a, -11 (ix)
	ld	-17 (ix), a
	sla	-18 (ix)
	rl	-17 (ix)
;	genPlus
;	AOP_STK for _wnoutrefresh_sloc8_1_0
	ld	a, -18 (ix)
	add	a, l
	ld	l, a
	ld	a, -17 (ix)
	adc	a, h
	ld	h, a
;	genPointerGet
;fetchPairLong
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	genCmpEq
	ld	l,a
; peephole 98 removed redundant load from l into a.
	inc	a
	jr	NZ,00171$
; peephole 164 changed absolute to relative conditional jump.
	ld	a, h
	inc	a
	jp	Z,00110$
; peephole 81 removed jp by using inverse jump logic
00171$:
;curses/refresh.c:41: first = win->_minchng[i];
;	genAssign
;	AOP_STK for _wnoutrefresh_sloc9_1_0
	ld	-20 (ix), l
	ld	-19 (ix), h
;curses/refresh.c:42: last = win->_maxchng[i];
;	genPointerGet
;	AOP_STK for _wnoutrefresh_sloc0_1_0
;fetchPairLong
	ld	l, -26 (ix)
	ld	h, -25 (ix)
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
;	genPlus
;	AOP_STK for _wnoutrefresh_sloc8_1_0
	ld	a, -18 (ix)
	add	a, l
	ld	l, a
	ld	a, -17 (ix)
	adc	a, h
	ld	h, a
;	genPointerGet
;	AOP_STK for _wnoutrefresh_sloc10_1_0
;fetchPairLong
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-22 (ix), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-21 (ix), a
;curses/refresh.c:43: dst = &(nscr->_line[j][begx + first]);
;	genPointerGet
;	AOP_STK for _wnoutrefresh_sloc1_1_0
;fetchPairLong
	ld	l, -16 (ix)
	ld	h, -15 (ix)
	push	bc
	ld	bc, #0x001c
	add	hl, bc
	pop	bc
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
;	genLeftShift
;	AOP_STK for _wnoutrefresh_j_65536_144
;	AOP_STK for _wnoutrefresh_sloc11_1_0
	ld	a, -14 (ix)
	ld	-24 (ix), a
	ld	a, -13 (ix)
	ld	-23 (ix), a
	sla	-24 (ix)
	rl	-23 (ix)
;	genPlus
;	AOP_STK for _wnoutrefresh_sloc11_1_0
	ld	a, l
	add	a, -24 (ix)
	ld	l, a
	ld	a, h
	adc	a, -23 (ix)
	ld	h, a
;	genPointerGet
;	AOP_STK for _wnoutrefresh_sloc12_1_0
;fetchPairLong
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-28 (ix), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-27 (ix), a
;	genPlus
;	AOP_STK for _wnoutrefresh_begx_65536_144
;	AOP_STK for _wnoutrefresh_sloc9_1_0
;	AOP_STK for _wnoutrefresh_sloc13_1_0
	ld	a, -10 (ix)
	add	a, -20 (ix)
	ld	-30 (ix), a
	ld	a, -9 (ix)
	adc	a, -19 (ix)
	ld	-29 (ix), a
;	genLeftShift
;	AOP_STK for _wnoutrefresh_sloc13_1_0
;fetchPairLong
	ld	l, -30 (ix)
	ld	h, -29 (ix)
	add	hl, hl
;	genPlus
;	AOP_STK for _wnoutrefresh_sloc12_1_0
;	AOP_STK for _wnoutrefresh_sloc14_1_0
	ld	a, -28 (ix)
	add	a, l
	ld	-32 (ix), a
	ld	a, -27 (ix)
	adc	a, h
	ld	-31 (ix), a
;curses/refresh.c:44: end = &(nscr->_line[j][begx + last]);
;	genPlus
;	AOP_STK for _wnoutrefresh_begx_65536_144
;	AOP_STK for _wnoutrefresh_sloc10_1_0
	ld	a, -10 (ix)
	add	a, -22 (ix)
	ld	-22 (ix), a
	ld	a, -9 (ix)
	adc	a, -21 (ix)
	ld	-21 (ix), a
;	genLeftShift
;	AOP_STK for _wnoutrefresh_sloc10_1_0
;fetchPairLong
	ld	l, -22 (ix)
	ld	h, -21 (ix)
	add	hl, hl
;	genPlus
;	AOP_STK for _wnoutrefresh_sloc12_1_0
	ld	a, -28 (ix)
	add	a, l
	ld	l, a
	ld	a, -27 (ix)
	adc	a, h
	ld	h, a
;	genAssign
;	AOP_STK for _wnoutrefresh_end_65536_144
	ld	-2 (ix), l
	ld	-1 (ix), h
;curses/refresh.c:45: src = &(win->_line[i][first]);
;	genPointerGet
;	AOP_STK for _wnoutrefresh_sloc2_1_0
;fetchPairLong
	ld	l, -34 (ix)
	ld	h, -33 (ix)
	push	bc
	ld	bc, #0x001c
	add	hl, bc
	pop	bc
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
;	genPlus
;	AOP_STK for _wnoutrefresh_sloc8_1_0
	ld	a, -18 (ix)
	add	a, l
	ld	l, a
	ld	a, -17 (ix)
	adc	a, h
	ld	h, a
;	genPointerGet
;	AOP_STK for _wnoutrefresh_sloc12_1_0
;fetchPairLong
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-28 (ix), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-27 (ix), a
;	genLeftShift
;	AOP_STK for _wnoutrefresh_sloc9_1_0
;fetchPairLong
	ld	l, -20 (ix)
	ld	h, -19 (ix)
	add	hl, hl
;	genPlus
;	AOP_STK for _wnoutrefresh_sloc12_1_0
;fetchPairLong
	push	hl
	ld	l, -28 (ix)
	ld	h, -27 (ix)
	push	hl
	pop	iy
	pop	hl
	push	bc
;fetchPairLong
	ld	c, l
	ld	b, h
	add	iy, bc
	pop	bc
;curses/refresh.c:47: while (dst <= end)	/* copy user line to temp window */
;	genLabel
00101$:
;	genCmpGt
;	AOP_STK for _wnoutrefresh_sloc14_1_0
;	AOP_STK for _wnoutrefresh_end_65536_144
	ld	a, -2 (ix)
	sub	a, -32 (ix)
	ld	a, -1 (ix)
	sbc	a, -31 (ix)
	jr	C,00103$
; peephole 165 changed absolute to relative conditional jump.
;curses/refresh.c:48: *dst++ = *src++;
;	genPointerGet
;	AOP_STK for _wnoutrefresh_sloc12_1_0
	ld	a, 0 (iy)
	ld	-28 (ix), a
	ld	a, 1 (iy)
	ld	-27 (ix), a
;	genPlus
	inc	iy
	inc	iy
;fetchPairLong
;	genAssign (pointer)
;	AOP_STK for _wnoutrefresh_sloc14_1_0
;	AOP_STK for _wnoutrefresh_sloc12_1_0
;	isBitvar = 0
;fetchPairLong
	ld	l, -32 (ix)
	ld	h, -31 (ix)
	ld	a, -28 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -27 (ix)
	ld	(hl), a
;	genPlus
;	AOP_STK for _wnoutrefresh_sloc14_1_0
	ld	a, -32 (ix)
	add	a, #0x02
	ld	-32 (ix), a
	jr	NC,00101$
; peephole 166 changed absolute to relative conditional jump.
; peephole 84 jumped to 00101$ directly instead of via 00174$.
	inc	-31 (ix)
; peephole 158 removed unused label 00174$.
;	genGoto
	jr	00101$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00103$:
;curses/refresh.c:50: first += begx;	/* nscr's min/max change positions */
;	genAssign
;	AOP_STK for _wnoutrefresh_sloc13_1_0
;	AOP_STK for _wnoutrefresh_first_65536_144
	ld	a, -30 (ix)
	ld	-4 (ix), a
	ld	a, -29 (ix)
	ld	-3 (ix), a
;curses/refresh.c:51: last += begx;
;	genAssign
;	AOP_STK for _wnoutrefresh_sloc10_1_0
;	AOP_STK for _wnoutrefresh_last_65536_144
	ld	a, -22 (ix)
	ld	-6 (ix), a
	ld	a, -21 (ix)
	ld	-5 (ix), a
;curses/refresh.c:53: if ((nscr->_minchng[j] == _NO_CHANGE) || (nscr->_minchng[j] > first))
;	genPointerGet
;	AOP_STK for _wnoutrefresh_sloc3_1_0
;fetchPairLong
	ld	l, -36 (ix)
	ld	h, -35 (ix)
	push	bc
	ld	bc, #0x001e
	add	hl, bc
	pop	bc
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
;	genPlus
;	AOP_STK for _wnoutrefresh_sloc11_1_0
;fetchPairLong
	push	hl
	pop	iy
	push	bc
;fetchPairLong
	ld	c, -24 (ix)
	ld	b, -23 (ix)
	add	iy, bc
	pop	bc
;	genPointerGet
	ld	l, 0 (iy)
	ld	h, 1 (iy)
;	genCmpEq
	ld	a, l
	inc	a
	jr	NZ,00175$
; peephole 164 changed absolute to relative conditional jump.
	ld	a, h
	inc	a
	jr	Z,00104$
; peephole 163 changed absolute to relative conditional jump.
; peephole 81 removed jp by using inverse jump logic
00175$:
;	genCmpGt
;	AOP_STK for _wnoutrefresh_first_65536_144
	ld	a, -4 (ix)
	sub	a, l
	ld	a, -3 (ix)
	sbc	a, h
	jp	PO, 00176$
	xor	a, #0x80
00176$:
	jp	P, 00105$
;	genLabel
00104$:
;curses/refresh.c:54: nscr->_minchng[j] = first;
;	genAssign (pointer)
;	AOP_STK for _wnoutrefresh_first_65536_144
;	isBitvar = 0
	ld	a, -4 (ix)
	ld	0 (iy), a
	ld	a, -3 (ix)
	ld	1 (iy), a
;	genLabel
00105$:
;curses/refresh.c:55: if (last > nscr->_maxchng[j]) nscr->_maxchng[j] = last;
;	genPointerGet
;	AOP_STK for _wnoutrefresh_sloc4_1_0
;fetchPairLong
	ld	l, -38 (ix)
	ld	h, -37 (ix)
	push	bc
	ld	bc, #0x0020
	add	hl, bc
	pop	bc
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
;	genPlus
;	AOP_STK for _wnoutrefresh_sloc11_1_0
;fetchPairLong
	push	hl
	pop	iy
	push	bc
;fetchPairLong
	ld	c, -24 (ix)
	ld	b, -23 (ix)
	add	iy, bc
	pop	bc
;	genPointerGet
;	genCmpGt
;	AOP_STK for _wnoutrefresh_last_65536_144
	ld	a, 0 (iy)
; peephole 14 loaded 0 (iy) into a directly instead of going through l.
	ld	h, 1 (iy)
	sub	a, -6 (ix)
	ld	a, h
	sbc	a, -5 (ix)
	jp	PO, 00177$
	xor	a, #0x80
00177$:
	jp	P, 00108$
;	genAssign (pointer)
;	AOP_STK for _wnoutrefresh_last_65536_144
;	isBitvar = 0
	ld	a, -6 (ix)
	ld	0 (iy), a
	ld	a, -5 (ix)
	ld	1 (iy), a
;	genLabel
00108$:
;curses/refresh.c:57: win->_minchng[i] = _NO_CHANGE;	/* updated now */
;	genPointerGet
;	AOP_STK for _wnoutrefresh_sloc5_1_0
;fetchPairLong
	ld	l, -40 (ix)
	ld	h, -39 (ix)
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	genPlus
;	AOP_STK for _wnoutrefresh_sloc8_1_0
; peephole 9 loaded a from a directly instead of going through l.
; peephole 0 removed redundant load from a into a.
	add	a, -18 (ix)
	ld	l, a
	ld	a, h
	adc	a, -17 (ix)
	ld	h, a
;	genAssign (pointer)
;	isBitvar = 0
;fetchPairLong
	ld	(hl), #0xff
	inc	hl
	ld	(hl), #0xff
;	genLabel
00110$:
;curses/refresh.c:59: win->_maxchng[i] = _NO_CHANGE;	/* updated now */
;	genPointerGet
;	AOP_STK for _wnoutrefresh_sloc6_1_0
;fetchPairLong
	ld	l, -42 (ix)
	ld	h, -41 (ix)
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
;	genPlus
;	AOP_STK for _wnoutrefresh_sloc8_1_0
	ld	a, -18 (ix)
	add	a, l
	ld	l, a
	ld	a, -17 (ix)
	adc	a, h
	ld	h, a
;	genAssign (pointer)
;	isBitvar = 0
;fetchPairLong
	ld	(hl), #0xff
	inc	hl
	ld	(hl), #0xff
;curses/refresh.c:39: for (i = 0, j = begy; i <= win->_maxy; i++, j++) {
;	genPlus
;	AOP_STK for _wnoutrefresh_i_65536_144
	inc	-12 (ix)
	jr	NZ,00178$
; peephole 164 changed absolute to relative conditional jump.
	inc	-11 (ix)
00178$:
;	genPlus
;	AOP_STK for _wnoutrefresh_j_65536_144
	inc	-14 (ix)
	jp	NZ,00117$
; peephole 84 jumped to 00117$ directly instead of via 00179$.
	inc	-13 (ix)
; peephole 158 removed unused label 00179$.
;	genGoto
	jp	00117$
;	genLabel
00111$:
;curses/refresh.c:62: if (win->_clear) {
;	genPlus
;fetchPairLong
;fetchLitPair
	ld	iy, #0x0012
;fetchPairLong
	add	iy, de
;	genPointerGet
	ld	l, 0 (iy)
	ld	a, 1 (iy)
;	genIfx
	or	a, l
	jr	Z,00113$
; peephole 163 changed absolute to relative conditional jump.
;curses/refresh.c:63: win->_clear = FALSE;
;	genAssign (pointer)
;	isBitvar = 0
	ld	0 (iy), #0x00
	ld	1 (iy), #0x00
;curses/refresh.c:64: nscr->_clear = TRUE;
;	genPlus
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0012
	add	hl, bc
;	genAssign (pointer)
;	isBitvar = 0
;fetchPairLong
	ld	(hl), #0x01
	inc	hl
	ld	(hl), #0x00
;	genLabel
00113$:
;curses/refresh.c:66: if (!win->_leave) {
;	genAssign
;fetchPairLong
	push	de
	pop	iy
;	genPointerGet
	ld	l, 20 (iy)
	ld	a, 21 (iy)
;	genIfx
	or	a, l
	jr	NZ,00119$
; peephole 164 changed absolute to relative conditional jump.
;curses/refresh.c:67: nscr->_cury = win->_cury + begy;
;	genPointerGet
;fetchPairLong
	ld	l, e
	ld	h, d
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	genPlus
;	AOP_STK for _wnoutrefresh_begy_65536_144
;	AOP_STK for _wnoutrefresh_sloc14_1_0
; peephole 9 loaded a from a directly instead of going through l.
; peephole 0 removed redundant load from a into a.
	add	a, -8 (ix)
	ld	-32 (ix), a
	ld	a, h
	adc	a, -7 (ix)
	ld	-31 (ix), a
;	genAssign (pointer)
;	AOP_STK for _wnoutrefresh_sloc14_1_0
;	isBitvar = 0
;fetchPairLong
	ld	l, c
	ld	h, b
	ld	a, -32 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -31 (ix)
	ld	(hl), a
;curses/refresh.c:68: nscr->_curx = win->_curx + begx;
;	genPlus
	inc	bc
	inc	bc
;	genAssign
;	(registers are the same)
;	genPointerGet
;fetchPairLong
; peephole 157 used ex to load de into hl.
	ex	de,hl
	inc	hl
	inc	hl
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;	genPlus
;	AOP_STK for _wnoutrefresh_begx_65536_144
	ld	a, e
	add	a, -10 (ix)
	ld	e, a
	ld	a, d
	adc	a, -9 (ix)
	ld	d, a
;	genAssign (pointer)
;	isBitvar = 0
;fetchPairLong
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
;	genLabel
00119$:
;curses/refresh.c:70: }				/* wnoutrefresh */
;	genEndFunction
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
