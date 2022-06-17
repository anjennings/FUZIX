;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module overlay
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _overlay
	.globl _overwrite
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
;curses/overlay.c:26: void overlay(WINDOW *win1, WINDOW *win2)
;	genLabel
;	genFunction
;	---------------------------------
; Function overlay
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 25 bytes.
_overlay::
	call	___sdcc_enter_ix
	ld	hl, #-25
	add	hl, sp
	ld	sp, hl
;curses/overlay.c:38: last_col = min(win1->_maxx, win2->_maxx);
;	genAssign
;	AOP_STK for 
;	AOP_STK for _overlay_sloc0_1_0
	ld	a, 4 (ix)
	ld	-12 (ix), a
	ld	a, 5 (ix)
	ld	-11 (ix), a
;	genAssign
;	AOP_STK for _overlay_sloc0_1_0
;fetchPairLong
	ld	l, -12 (ix)
	ld	h, -11 (ix)
;	genPointerGet
;	AOP_STK for _overlay_sloc1_1_0
;fetchPairLong
	ld	de, #0x0006
	add	hl, de
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-14 (ix), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-13 (ix), a
;	genAssign
;	AOP_STK for 
;fetchPairLong
	ld	e, 6 (ix)
	ld	d, 7 (ix)
;	genAssign
;fetchPairLong
	ld	l, e
	ld	h, d
;	genPointerGet
;fetchPairLong
	ld	bc, #0x0006
	add	hl, bc
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genCmpLt
;	AOP_STK for _overlay_sloc1_1_0
	ld	a, -14 (ix)
	sub	a, c
	ld	a, -13 (ix)
	sbc	a, b
	jp	PO, 00190$
	xor	a, #0x80
00190$:
	jp	P, 00124$
;	genAssign
;	AOP_STK for _overlay_sloc1_1_0
;fetchPairLong
	ld	c, -14 (ix)
	ld	b, -13 (ix)
;	genGoto
;	genLabel
;	genAssign
;	(registers are the same)
;	genLabel
; peephole 85 eliminated jump.
00124$:
; peephole 158 removed unused label 00125$.
;	genAssign
;	AOP_STK for _overlay_last_col_65536_142
	ld	-8 (ix), c
	ld	-7 (ix), b
;curses/overlay.c:39: last_line = min(win1->_maxy, win2->_maxy);
;	genAssign
;	AOP_STK for _overlay_sloc0_1_0
;fetchPairLong
	ld	l, -12 (ix)
	ld	h, -11 (ix)
;	genPointerGet
;fetchPairLong
	ld	bc, #0x0004
	add	hl, bc
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genAssign
;fetchPairLong
	push	de
	pop	iy
;	genPointerGet
	ld	l, 4 (iy)
	ld	h, 5 (iy)
;	genCmpLt
	ld	a, c
	sub	a, l
	ld	a, b
	sbc	a, h
	jp	PO, 00191$
	xor	a, #0x80
00191$:
	jp	P, 00126$
;	genAssign
;	(registers are the same)
;	genGoto
	jr	00127$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00126$:
;	genAssign
;fetchPairLong
	ld	c, l
	ld	b, h
;	genLabel
00127$:
;	genAssign
;	AOP_STK for _overlay_last_line_65536_142
	ld	-6 (ix), c
	ld	-5 (ix), b
;curses/overlay.c:40: attrs = win2->_attrs & ATR_MSK;
;	genAssign
;fetchPairLong
	ld	l, e
	ld	h, d
;	genPointerGet
;fetchPairLong
	ld	bc, #0x000e
	add	hl, bc
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genAnd
;	AOP_STK for _overlay_attrs_65536_142
	ld	-2 (ix), #0x00
	ld	-1 (ix), b
;curses/overlay.c:41: minchng = win2->_minchng;
;	genAssign
;fetchPairLong
	push	de
	pop	iy
;	genPointerGet
;	AOP_STK for _overlay_sloc1_1_0
	ld	a, 30 (iy)
	ld	-14 (ix), a
	ld	a, 31 (iy)
	ld	-13 (ix), a
;curses/overlay.c:42: maxchng = win2->_maxchng;
;	genAssign
;fetchPairLong
	push	de
	pop	iy
;	genPointerGet
;	AOP_STK for _overlay_sloc2_1_0
	ld	a, 32 (iy)
	ld	-16 (ix), a
	ld	a, 33 (iy)
	ld	-15 (ix), a
;curses/overlay.c:44: for (line = 0; line <= last_line; line++) {
;	genAssign
;	AOP_STK for _overlay_sloc0_1_0
;	(registers are the same)
;	genAssign
;	AOP_STK for _overlay_sloc3_1_0
	ld	-18 (ix), e
	ld	-17 (ix), d
;	genAssign
;	AOP_STK for _overlay_line_65536_142
	ld	-4 (ix), #0x00
	ld	-3 (ix), #0x00
;	genLabel
00120$:
;	genCmpGt
;	AOP_STK for _overlay_line_65536_142
;	AOP_STK for _overlay_last_line_65536_142
	ld	a, -6 (ix)
	sub	a, -4 (ix)
	ld	a, -5 (ix)
	sbc	a, -3 (ix)
	jp	PO, 00192$
	xor	a, #0x80
00192$:
	jp	M, 00122$
;curses/overlay.c:45: register short fc, lc = 0;
;	genAssign
;	AOP_STK for _overlay_lc_196608_144
	ld	-10 (ix), #0x00
	ld	-9 (ix), #0x00
;curses/overlay.c:46: w1ptr = win1->_line[line];
;	genPointerGet
;	AOP_STK for _overlay_sloc0_1_0
;fetchPairLong
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	de, #0x001c
	add	hl, de
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	h, (hl)
;	genLeftShift
;	AOP_STK for _overlay_line_65536_142
;fetchPairLong
	ld	c, -4 (ix)
	ld	b, -3 (ix)
	sla	c
	rl	b
;	genPlus
;fetchPairLong
	ld	l, e
	add	hl, bc
;	genPointerGet
;	AOP_STK for _overlay_sloc4_1_0
;fetchPairLong
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-20 (ix), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-19 (ix), a
;curses/overlay.c:47: w2ptr = win2->_line[line];
;	genPointerGet
;	AOP_STK for _overlay_sloc3_1_0
;fetchPairLong
	ld	l, -18 (ix)
	ld	h, -17 (ix)
	ld	de, #0x001c
	add	hl, de
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	h, (hl)
;	genPlus
;fetchPairLong
	ld	l, e
	add	hl, bc
;	genPointerGet
;	AOP_STK for _overlay_sloc5_1_0
;fetchPairLong
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-22 (ix), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-21 (ix), a
;curses/overlay.c:48: fc = _NO_CHANGE;
;	genAssign
;	AOP_STK for _overlay_sloc6_1_0
	ld	-24 (ix), #0xff
	ld	-23 (ix), #0xff
;curses/overlay.c:49: for (col = 0; col <= last_col; col++) {
;	genAssign
;fetchPairLong
;fetchLitPair
	ld	de, #0x0000
;	genLabel
00117$:
;curses/overlay.c:52: if (fc == _NO_CHANGE) fc = col;
;	genCmpEq
;	AOP_STK for _overlay_sloc6_1_0
;	AOP_STK for _overlay_sloc7_1_0
	ld	a, -24 (ix)
	inc	a
	jr	NZ,00195$
; peephole 164 changed absolute to relative conditional jump.
	ld	a, -23 (ix)
	inc	a
; peephole 164 changed absolute to relative conditional jump.
; peephole 162 changed absolute to relative unconditional jump.
	jr	NZ, 00195$
	ld	a, #0x01
	.db	#0x20
; peephole 169xnz used jr NZ opcode to jump over 1-byte instruction.
00195$:
	xor	a, a
00196$:
	ld	-25 (ix), a
;curses/overlay.c:49: for (col = 0; col <= last_col; col++) {
;	genCmpGt
;	AOP_STK for _overlay_last_col_65536_142
	ld	a, -8 (ix)
	sub	a, e
	ld	a, -7 (ix)
	sbc	a, d
	jp	PO, 00197$
	xor	a, #0x80
00197$:
	jp	M, 00105$
;curses/overlay.c:50: if ((*w1ptr & CHR_MSK) != ' ') {
;	genPointerGet
;	AOP_STK for _overlay_sloc4_1_0
;fetchPairLong
	ld	l, -20 (ix)
	ld	h, -19 (ix)
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genAnd
	ld	b, #0x00
;	genCmpEq
	ld	a, c
	sub	a, #0x20
	or	a, b
	jr	Z,00104$
; peephole 163 changed absolute to relative conditional jump.
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00198$.
;curses/overlay.c:51: *w2ptr = (*w1ptr & CHR_MSK) | attrs;
;	genOr
;	AOP_STK for _overlay_attrs_65536_142
	ld	a, c
	or	a, -2 (ix)
	ld	c, a
	ld	a, b
	or	a, -1 (ix)
	ld	b, a
;	genAssign (pointer)
;	AOP_STK for _overlay_sloc5_1_0
;	isBitvar = 0
;fetchPairLong
	ld	l, -22 (ix)
	ld	h, -21 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
;curses/overlay.c:52: if (fc == _NO_CHANGE) fc = col;
;	genIfx
;	AOP_STK for _overlay_sloc7_1_0
	ld	a, -25 (ix)
	or	a, a
	jr	Z,00102$
; peephole 163 changed absolute to relative conditional jump.
;	genAssign
;	AOP_STK for _overlay_sloc6_1_0
	ld	-24 (ix), e
	ld	-23 (ix), d
;	genLabel
00102$:
;curses/overlay.c:53: lc = col;
;	genAssign
;	AOP_STK for _overlay_lc_196608_144
	ld	-10 (ix), e
	ld	-9 (ix), d
;	genLabel
00104$:
;curses/overlay.c:55: w1ptr++;
;	genPlus
;	AOP_STK for _overlay_sloc4_1_0
	ld	a, -20 (ix)
	add	a, #0x02
	ld	-20 (ix), a
	jr	NC,00199$
; peephole 166 changed absolute to relative conditional jump.
	inc	-19 (ix)
00199$:
;curses/overlay.c:56: w2ptr++;
;	genPlus
;	AOP_STK for _overlay_sloc5_1_0
	ld	a, -22 (ix)
	add	a, #0x02
	ld	-22 (ix), a
	jr	NC,00200$
; peephole 166 changed absolute to relative conditional jump.
	inc	-21 (ix)
00200$:
;curses/overlay.c:49: for (col = 0; col <= last_col; col++) {
;	genPlus
	inc	de
;	genGoto
	jr	00117$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00105$:
;curses/overlay.c:59: if (*minchng == _NO_CHANGE) {
;	genPointerGet
;	AOP_STK for _overlay_sloc1_1_0
;	AOP_STK for _overlay_sloc5_1_0
;fetchPairLong
	ld	l, -14 (ix)
	ld	h, -13 (ix)
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-22 (ix), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-21 (ix), a
;	genCmpEq
;	AOP_STK for _overlay_sloc5_1_0
	ld	a, -22 (ix)
	inc	a
	jr	NZ,00113$
; peephole 164 changed absolute to relative conditional jump.
; peephole 84 jumped to 00113$ directly instead of via 00201$.
	ld	a, -21 (ix)
	inc	a
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00201$.
	jr	NZ,00113$
; peephole 164 changed absolute to relative conditional jump.
; peephole 82 removed jp by using inverse jump logic
; peephole 158 removed unused label 00202$.
;curses/overlay.c:60: *minchng = fc;
;	genAssign (pointer)
;	AOP_STK for _overlay_sloc1_1_0
;	AOP_STK for _overlay_sloc6_1_0
;	isBitvar = 0
;fetchPairLong
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	ld	a, -24 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -23 (ix)
	ld	(hl), a
;curses/overlay.c:61: *maxchng = lc;
;	genAssign (pointer)
;	AOP_STK for _overlay_sloc2_1_0
;	AOP_STK for _overlay_lc_196608_144
;	isBitvar = 0
;fetchPairLong
	ld	l, -16 (ix)
	ld	h, -15 (ix)
	ld	a, -10 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -9 (ix)
	ld	(hl), a
;	genGoto
	jr	00114$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00113$:
;curses/overlay.c:62: } else if (fc != _NO_CHANGE) {
;	genIfx
;	AOP_STK for _overlay_sloc7_1_0
	ld	a, -25 (ix)
	or	a, a
	jr	NZ,00114$
; peephole 164 changed absolute to relative conditional jump.
;curses/overlay.c:63: if (fc < *minchng) *minchng = fc;
;	genCmpLt
;	AOP_STK for _overlay_sloc6_1_0
;	AOP_STK for _overlay_sloc5_1_0
	ld	a, -24 (ix)
	sub	a, -22 (ix)
	ld	a, -23 (ix)
	sbc	a, -21 (ix)
	jp	PO, 00203$
	xor	a, #0x80
00203$:
	jp	P, 00107$
;	genAssign (pointer)
;	AOP_STK for _overlay_sloc1_1_0
;	AOP_STK for _overlay_sloc6_1_0
;	isBitvar = 0
;fetchPairLong
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	ld	a, -24 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -23 (ix)
	ld	(hl), a
;	genLabel
00107$:
;curses/overlay.c:64: if (lc > *maxchng) *maxchng = lc;
;	genPointerGet
;	AOP_STK for _overlay_sloc2_1_0
;fetchPairLong
	ld	l, -16 (ix)
	ld	h, -15 (ix)
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genCmpGt
;	AOP_STK for _overlay_lc_196608_144
	ld	a, c
	sub	a, -10 (ix)
	ld	a, b
	sbc	a, -9 (ix)
	jp	PO, 00204$
	xor	a, #0x80
00204$:
	jp	P, 00114$
;	genAssign (pointer)
;	AOP_STK for _overlay_sloc2_1_0
;	AOP_STK for _overlay_lc_196608_144
;	isBitvar = 0
;fetchPairLong
	ld	l, -16 (ix)
	ld	h, -15 (ix)
	ld	a, -10 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -9 (ix)
	ld	(hl), a
;	genLabel
00114$:
;curses/overlay.c:66: minchng++;
;	genPlus
;	AOP_STK for _overlay_sloc1_1_0
	ld	a, -14 (ix)
	add	a, #0x02
	ld	-14 (ix), a
	jr	NC,00205$
; peephole 166 changed absolute to relative conditional jump.
	inc	-13 (ix)
00205$:
;curses/overlay.c:67: maxchng++;
;	genPlus
;	AOP_STK for _overlay_sloc2_1_0
	ld	a, -16 (ix)
	add	a, #0x02
	ld	-16 (ix), a
	jr	NC,00206$
; peephole 166 changed absolute to relative conditional jump.
	inc	-15 (ix)
00206$:
;curses/overlay.c:44: for (line = 0; line <= last_line; line++) {
;	genPlus
;	AOP_STK for _overlay_line_65536_142
	inc	-4 (ix)
	jp	NZ,00120$
; peephole 84 jumped to 00120$ directly instead of via 00207$.
	inc	-3 (ix)
; peephole 158 removed unused label 00207$.
;	genGoto
	jp	00120$
;	genLabel
00122$:
;curses/overlay.c:69: }				/* overlay */
;	genEndFunction
	ld	sp, ix
	pop	ix
	ret
;curses/overlay.c:76: void overwrite(WINDOW *win1, WINDOW *win2)
;	genLabel
;	genFunction
;	---------------------------------
; Function overwrite
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 27 bytes.
_overwrite::
	call	___sdcc_enter_ix
	ld	hl, #-27
	add	hl, sp
	ld	sp, hl
;curses/overlay.c:88: last_col = min(win1->_maxx, win2->_maxx);
;	genAssign
;	AOP_STK for 
;	AOP_STK for _overwrite_sloc0_1_0
	ld	a, 4 (ix)
	ld	-10 (ix), a
	ld	a, 5 (ix)
	ld	-9 (ix), a
;	genAssign
;	AOP_STK for _overwrite_sloc0_1_0
;fetchPairLong
	ld	l, -10 (ix)
	ld	h, -9 (ix)
;	genPointerGet
;	AOP_STK for _overwrite_sloc1_1_0
;fetchPairLong
	ld	de, #0x0006
	add	hl, de
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-12 (ix), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-11 (ix), a
;	genAssign
;	AOP_STK for 
;fetchPairLong
	ld	e, 6 (ix)
	ld	d, 7 (ix)
;	genAssign
;fetchPairLong
	ld	l, e
	ld	h, d
;	genPointerGet
;fetchPairLong
	ld	bc, #0x0006
	add	hl, bc
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genCmpLt
;	AOP_STK for _overwrite_sloc1_1_0
	ld	a, -12 (ix)
	sub	a, c
	ld	a, -11 (ix)
	sbc	a, b
	jp	PO, 00190$
	xor	a, #0x80
00190$:
	jp	P, 00124$
;	genAssign
;	AOP_STK for _overwrite_sloc1_1_0
;fetchPairLong
	ld	c, -12 (ix)
	ld	b, -11 (ix)
;	genGoto
;	genLabel
;	genAssign
;	(registers are the same)
;	genLabel
; peephole 85 eliminated jump.
00124$:
; peephole 158 removed unused label 00125$.
;	genAssign
;	AOP_STK for _overwrite_last_col_65536_151
	ld	-8 (ix), c
	ld	-7 (ix), b
;curses/overlay.c:89: last_line = min(win1->_maxy, win2->_maxy);
;	genAssign
;	AOP_STK for _overwrite_sloc0_1_0
;fetchPairLong
	ld	l, -10 (ix)
	ld	h, -9 (ix)
;	genPointerGet
;fetchPairLong
	ld	bc, #0x0004
	add	hl, bc
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genAssign
;fetchPairLong
	push	de
	pop	iy
;	genPointerGet
	ld	l, 4 (iy)
	ld	h, 5 (iy)
;	genCmpLt
	ld	a, c
	sub	a, l
	ld	a, b
	sbc	a, h
	jp	PO, 00191$
	xor	a, #0x80
00191$:
	jp	P, 00126$
;	genAssign
;	(registers are the same)
;	genGoto
	jr	00127$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00126$:
;	genAssign
;fetchPairLong
	ld	c, l
	ld	b, h
;	genLabel
00127$:
;	genAssign
;	AOP_STK for _overwrite_last_line_65536_151
	ld	-6 (ix), c
	ld	-5 (ix), b
;curses/overlay.c:90: attrs = win2->_attrs & ATR_MSK;
;	genAssign
;fetchPairLong
	ld	l, e
	ld	h, d
;	genPointerGet
;fetchPairLong
	ld	bc, #0x000e
	add	hl, bc
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genAnd
;	AOP_STK for _overwrite_attrs_65536_151
	ld	-2 (ix), #0x00
	ld	-1 (ix), b
;curses/overlay.c:91: minchng = win2->_minchng;
;	genAssign
;fetchPairLong
	push	de
	pop	iy
;	genPointerGet
;	AOP_STK for _overwrite_sloc1_1_0
	ld	a, 30 (iy)
	ld	-12 (ix), a
	ld	a, 31 (iy)
	ld	-11 (ix), a
;curses/overlay.c:92: maxchng = win2->_maxchng;
;	genAssign
;fetchPairLong
	push	de
	pop	iy
;	genPointerGet
;	AOP_STK for _overwrite_sloc2_1_0
	ld	a, 32 (iy)
	ld	-14 (ix), a
	ld	a, 33 (iy)
	ld	-13 (ix), a
;curses/overlay.c:94: for (line = 0; line <= last_line; line++) {
;	genAssign
;	AOP_STK for _overwrite_sloc0_1_0
;	(registers are the same)
;	genAssign
;	AOP_STK for _overwrite_sloc3_1_0
	ld	-16 (ix), e
	ld	-15 (ix), d
;	genAssign
;	AOP_STK for _overwrite_line_65536_151
	ld	-4 (ix), #0x00
	ld	-3 (ix), #0x00
;	genLabel
00120$:
;	genCmpGt
;	AOP_STK for _overwrite_line_65536_151
;	AOP_STK for _overwrite_last_line_65536_151
	ld	a, -6 (ix)
	sub	a, -4 (ix)
	ld	a, -5 (ix)
	sbc	a, -3 (ix)
	jp	PO, 00192$
	xor	a, #0x80
00192$:
	jp	M, 00122$
;curses/overlay.c:95: register short fc, lc = 0;
;	genAssign
;	AOP_STK for _overwrite_lc_196608_153
	ld	-18 (ix), #0x00
	ld	-17 (ix), #0x00
;curses/overlay.c:97: w1ptr = win1->_line[line];
;	genPointerGet
;	AOP_STK for _overwrite_sloc0_1_0
;fetchPairLong
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	ld	de, #0x001c
	add	hl, de
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	h, (hl)
;	genLeftShift
;	AOP_STK for _overwrite_line_65536_151
;fetchPairLong
	ld	c, -4 (ix)
	ld	b, -3 (ix)
	sla	c
	rl	b
;	genPlus
;fetchPairLong
	ld	l, e
	add	hl, bc
;	genPointerGet
;	AOP_STK for _overwrite_sloc4_1_0
;fetchPairLong
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-20 (ix), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-19 (ix), a
;curses/overlay.c:98: w2ptr = win2->_line[line];
;	genPointerGet
;	AOP_STK for _overwrite_sloc3_1_0
;fetchPairLong
	ld	l, -16 (ix)
	ld	h, -15 (ix)
	ld	de, #0x001c
	add	hl, de
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	h, (hl)
;	genPlus
;fetchPairLong
	ld	l, e
	add	hl, bc
;	genPointerGet
;	AOP_STK for _overwrite_sloc5_1_0
;fetchPairLong
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-22 (ix), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-21 (ix), a
;curses/overlay.c:99: fc = _NO_CHANGE;
;	genAssign
;	AOP_STK for _overwrite_sloc6_1_0
	ld	-24 (ix), #0xff
	ld	-23 (ix), #0xff
;curses/overlay.c:101: for (col = 0; col <= last_col; col++) {
;	genAssign
;fetchPairLong
;fetchLitPair
	ld	de, #0x0000
;	genLabel
00117$:
;curses/overlay.c:105: if (fc == _NO_CHANGE) fc = col;
;	genCmpEq
;	AOP_STK for _overwrite_sloc6_1_0
;	AOP_STK for _overwrite_sloc7_1_0
	ld	a, -24 (ix)
	inc	a
	jr	NZ,00195$
; peephole 164 changed absolute to relative conditional jump.
	ld	a, -23 (ix)
	inc	a
; peephole 164 changed absolute to relative conditional jump.
; peephole 162 changed absolute to relative unconditional jump.
	jr	NZ, 00195$
	ld	a, #0x01
	.db	#0x20
; peephole 169xnz used jr NZ opcode to jump over 1-byte instruction.
00195$:
	xor	a, a
00196$:
	ld	-25 (ix), a
;curses/overlay.c:101: for (col = 0; col <= last_col; col++) {
;	genCmpGt
;	AOP_STK for _overwrite_last_col_65536_151
	ld	a, -8 (ix)
	sub	a, e
	ld	a, -7 (ix)
	sbc	a, d
	jp	PO, 00197$
	xor	a, #0x80
00197$:
	jp	M, 00105$
;curses/overlay.c:102: if ((*w1ptr & CHR_MSK) != (*w2ptr & CHR_MSK)) {
;	genPointerGet
;	AOP_STK for _overwrite_sloc4_1_0
;fetchPairLong
	ld	l, -20 (ix)
	ld	h, -19 (ix)
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genAnd
	ld	b, #0x00
;	genPointerGet
;	AOP_STK for _overwrite_sloc5_1_0
;fetchPairLong
	ld	l, -22 (ix)
	ld	h, -21 (ix)
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	genAnd
;	AOP_STK for _overwrite_sloc8_1_0
; peephole 13 loaded a into -27 (ix) directly instead of going through l.
	ld	-27 (ix), a
	ld	-26 (ix), #0x00
;	genCmpEq
;	AOP_STK for _overwrite_sloc8_1_0
	ld	a, c
	sub	a, -27 (ix)
	jr	NZ,00198$
; peephole 164 changed absolute to relative conditional jump.
	ld	a, b
	sub	a, -26 (ix)
	jr	Z,00104$
; peephole 163 changed absolute to relative conditional jump.
; peephole 81 removed jp by using inverse jump logic
00198$:
;curses/overlay.c:103: *w2ptr = (*w1ptr & CHR_MSK) | attrs;
;	genOr
;	AOP_STK for _overwrite_attrs_65536_151
	ld	a, c
	or	a, -2 (ix)
	ld	c, a
	ld	a, b
	or	a, -1 (ix)
	ld	b, a
;	genAssign (pointer)
;	AOP_STK for _overwrite_sloc5_1_0
;	isBitvar = 0
;fetchPairLong
	ld	l, -22 (ix)
	ld	h, -21 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
;curses/overlay.c:105: if (fc == _NO_CHANGE) fc = col;
;	genIfx
;	AOP_STK for _overwrite_sloc7_1_0
	ld	a, -25 (ix)
	or	a, a
	jr	Z,00102$
; peephole 163 changed absolute to relative conditional jump.
;	genAssign
;	AOP_STK for _overwrite_sloc6_1_0
	ld	-24 (ix), e
	ld	-23 (ix), d
;	genLabel
00102$:
;curses/overlay.c:106: lc = col;
;	genAssign
;	AOP_STK for _overwrite_lc_196608_153
	ld	-18 (ix), e
	ld	-17 (ix), d
;	genLabel
00104$:
;curses/overlay.c:108: w1ptr++;
;	genPlus
;	AOP_STK for _overwrite_sloc4_1_0
	ld	a, -20 (ix)
	add	a, #0x02
	ld	-20 (ix), a
	jr	NC,00199$
; peephole 166 changed absolute to relative conditional jump.
	inc	-19 (ix)
00199$:
;curses/overlay.c:109: w2ptr++;
;	genPlus
;	AOP_STK for _overwrite_sloc5_1_0
	ld	a, -22 (ix)
	add	a, #0x02
	ld	-22 (ix), a
	jr	NC,00200$
; peephole 166 changed absolute to relative conditional jump.
	inc	-21 (ix)
00200$:
;curses/overlay.c:101: for (col = 0; col <= last_col; col++) {
;	genPlus
	inc	de
;	genGoto
	jp	00117$
;	genLabel
00105$:
;curses/overlay.c:112: if (*minchng == _NO_CHANGE) {
;	genPointerGet
;	AOP_STK for _overwrite_sloc1_1_0
;	AOP_STK for _overwrite_sloc8_1_0
;fetchPairLong
	ld	l, -12 (ix)
	ld	h, -11 (ix)
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-27 (ix), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-26 (ix), a
;	genCmpEq
;	AOP_STK for _overwrite_sloc8_1_0
	ld	a, -27 (ix)
	inc	a
	jr	NZ,00113$
; peephole 164 changed absolute to relative conditional jump.
; peephole 84 jumped to 00113$ directly instead of via 00201$.
	ld	a, -26 (ix)
	inc	a
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00201$.
	jr	NZ,00113$
; peephole 164 changed absolute to relative conditional jump.
; peephole 82 removed jp by using inverse jump logic
; peephole 158 removed unused label 00202$.
;curses/overlay.c:113: *minchng = fc;
;	genAssign (pointer)
;	AOP_STK for _overwrite_sloc1_1_0
;	AOP_STK for _overwrite_sloc6_1_0
;	isBitvar = 0
;fetchPairLong
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	a, -24 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -23 (ix)
	ld	(hl), a
;curses/overlay.c:114: *maxchng = lc;
;	genAssign (pointer)
;	AOP_STK for _overwrite_sloc2_1_0
;	AOP_STK for _overwrite_lc_196608_153
;	isBitvar = 0
;fetchPairLong
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	ld	a, -18 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -17 (ix)
	ld	(hl), a
;	genGoto
	jr	00114$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00113$:
;curses/overlay.c:115: } else if (fc != _NO_CHANGE) {
;	genIfx
;	AOP_STK for _overwrite_sloc7_1_0
	ld	a, -25 (ix)
	or	a, a
	jr	NZ,00114$
; peephole 164 changed absolute to relative conditional jump.
;curses/overlay.c:116: if (fc < *minchng) *minchng = fc;
;	genCmpLt
;	AOP_STK for _overwrite_sloc6_1_0
;	AOP_STK for _overwrite_sloc8_1_0
	ld	a, -24 (ix)
	sub	a, -27 (ix)
	ld	a, -23 (ix)
	sbc	a, -26 (ix)
	jp	PO, 00203$
	xor	a, #0x80
00203$:
	jp	P, 00107$
;	genAssign (pointer)
;	AOP_STK for _overwrite_sloc1_1_0
;	AOP_STK for _overwrite_sloc6_1_0
;	isBitvar = 0
;fetchPairLong
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	a, -24 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -23 (ix)
	ld	(hl), a
;	genLabel
00107$:
;curses/overlay.c:117: if (lc > *maxchng) *maxchng = lc;
;	genPointerGet
;	AOP_STK for _overwrite_sloc2_1_0
;fetchPairLong
	ld	l, -14 (ix)
	ld	h, -13 (ix)
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genCmpGt
;	AOP_STK for _overwrite_lc_196608_153
	ld	a, c
	sub	a, -18 (ix)
	ld	a, b
	sbc	a, -17 (ix)
	jp	PO, 00204$
	xor	a, #0x80
00204$:
	jp	P, 00114$
;	genAssign (pointer)
;	AOP_STK for _overwrite_sloc2_1_0
;	AOP_STK for _overwrite_lc_196608_153
;	isBitvar = 0
;fetchPairLong
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	ld	a, -18 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -17 (ix)
	ld	(hl), a
;	genLabel
00114$:
;curses/overlay.c:119: minchng++;
;	genPlus
;	AOP_STK for _overwrite_sloc1_1_0
	ld	a, -12 (ix)
	add	a, #0x02
	ld	-12 (ix), a
	jr	NC,00205$
; peephole 166 changed absolute to relative conditional jump.
	inc	-11 (ix)
00205$:
;curses/overlay.c:120: maxchng++;
;	genPlus
;	AOP_STK for _overwrite_sloc2_1_0
	ld	a, -14 (ix)
	add	a, #0x02
	ld	-14 (ix), a
	jr	NC,00206$
; peephole 166 changed absolute to relative conditional jump.
	inc	-13 (ix)
00206$:
;curses/overlay.c:94: for (line = 0; line <= last_line; line++) {
;	genPlus
;	AOP_STK for _overwrite_line_65536_151
	inc	-4 (ix)
	jp	NZ,00120$
; peephole 84 jumped to 00120$ directly instead of via 00207$.
	inc	-3 (ix)
; peephole 158 removed unused label 00207$.
;	genGoto
	jp	00120$
;	genLabel
00122$:
;curses/overlay.c:122: }
;	genEndFunction
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
