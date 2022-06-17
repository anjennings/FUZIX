;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module wclrtobot
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _wclrtobot
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
;curses/wclrtobot.c:9: int wclrtobot(WINDOW *win)
;	genLabel
;	genFunction
;	---------------------------------
; Function wclrtobot
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 31 bytes.
_wclrtobot::
	call	___sdcc_enter_ix
	ld	hl, #-31
	add	hl, sp
	ld	sp, hl
;curses/wclrtobot.c:13: blank = ' ' | (win->_attrs & ATR_MSK);
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
	ld	de, #0x000e
	add	hl, de
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;	genAnd
;	genOr
;	AOP_STK for _wclrtobot_blank_65536_142
; peephole 9 loaded a from #0x00 directly instead of going through e.
	ld	a, #0x00
	or	a, #0x20
	ld	-10 (ix), a
	ld	-9 (ix), d
;curses/wclrtobot.c:14: startx = win->_curx;
;	genAssign
;fetchPairLong
	ld	l, c
	ld	h, b
;	genPointerGet
;	AOP_STK for _wclrtobot_startx_65536_142
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
;curses/wclrtobot.c:15: for (y = win->_cury; y <= win->_regbottom; y++) {
;	genPointerGet
;	AOP_STK for _wclrtobot_sloc0_1_0
;	_moveFrom_tpair_()
	ld	a, (bc)
	ld	-27 (ix), a
	inc	bc
;	_moveFrom_tpair_()
	ld	a, (bc)
	ld	-26 (ix), a
	dec	bc
;	genPlus
;	AOP_STK for _wclrtobot_sloc1_1_0
;fetchPairLong
;fetchLitPair
	ld	hl, #0x001c
	add	hl, bc
	ld	-29 (ix), l
	ld	-28 (ix), h
;	genAssign
;	AOP_STK for _wclrtobot_sloc2_1_0
	inc	sp
	inc	sp
	push	bc
;	genAssign
;	AOP_STK for _wclrtobot_sloc3_1_0
	ld	-12 (ix), c
	ld	-11 (ix), b
;	genAssign
;	AOP_STK for _wclrtobot_sloc4_1_0
	ld	-14 (ix), c
	ld	-13 (ix), b
;	genAssign
;	AOP_STK for _wclrtobot_sloc5_1_0
	ld	-16 (ix), c
	ld	-15 (ix), b
;	genLabel
00118$:
;	genPointerGet
;	AOP_STK for _wclrtobot_sloc5_1_0
;fetchPairLong
	ld	l, -16 (ix)
	ld	h, -15 (ix)
	ld	de, #0x0024
	add	hl, de
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genCmpGt
;	AOP_STK for _wclrtobot_sloc0_1_0
	ld	a, c
	sub	a, -27 (ix)
	ld	a, b
	sbc	a, -26 (ix)
	jp	PO, 00169$
	xor	a, #0x80
00169$:
	jp	M, 00113$
;curses/wclrtobot.c:16: minx = _NO_CHANGE;
;	genAssign
;	AOP_STK for _wclrtobot_minx_65536_142
	ld	-2 (ix), #0xff
	ld	-1 (ix), #0xff
;curses/wclrtobot.c:17: end = &win->_line[y][win->_maxx];
;	genPointerGet
;	AOP_STK for _wclrtobot_sloc1_1_0
;fetchPairLong
	ld	l, -29 (ix)
	ld	h, -28 (ix)
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genLeftShift
;	AOP_STK for _wclrtobot_sloc0_1_0
;	AOP_STK for _wclrtobot_sloc6_1_0
	ld	a, -27 (ix)
	ld	-18 (ix), a
	ld	a, -26 (ix)
	ld	-17 (ix), a
	sla	-18 (ix)
	rl	-17 (ix)
;	genPlus
;	AOP_STK for _wclrtobot_sloc6_1_0
;fetchPairLong
	ld	l, -18 (ix)
	ld	h, -17 (ix)
	add	hl, bc
;	genPointerGet
;fetchPairLong
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genPointerGet
;	AOP_STK for _wclrtobot_sloc2_1_0
;fetchPairLong
	pop	hl
	push	hl
	ld	de, #0x0006
	add	hl, de
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	h, (hl)
;	genLeftShift
;fetchPairLong
	ld	l, e
	add	hl, hl
;	genPlus
	add	hl, bc
;	genAssign
;	AOP_STK for _wclrtobot_end_65536_142
	ld	-6 (ix), l
	ld	-5 (ix), h
;curses/wclrtobot.c:18: for (ptr = &win->_line[y][startx]; ptr <= end; ptr++) {
;	genLeftShift
;	AOP_STK for _wclrtobot_startx_65536_142
;fetchPairLong
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	add	hl, hl
;	genPlus
;	AOP_STK for _wclrtobot_maxx_65536_142
	add	hl, bc
	ld	-8 (ix), l
	ld	-7 (ix), h
;	genAssign
;	AOP_STK for _wclrtobot_sloc6_1_0
;fetchPairLong
	ld	c, -18 (ix)
	ld	b, -17 (ix)
;	genLabel
00115$:
;curses/wclrtobot.c:21: if (minx == _NO_CHANGE) minx = ptr - win->_line[y];
;	genCmpEq
;	AOP_STK for _wclrtobot_minx_65536_142
;	AOP_STK for _wclrtobot_sloc7_1_0
	ld	a, -2 (ix)
	inc	a
	jr	NZ,00172$
; peephole 164 changed absolute to relative conditional jump.
	ld	a, -1 (ix)
	inc	a
; peephole 164 changed absolute to relative conditional jump.
; peephole 162 changed absolute to relative unconditional jump.
	jr	NZ, 00172$
	ld	a, #0x01
	.db	#0x20
; peephole 169xnz used jr NZ opcode to jump over 1-byte instruction.
00172$:
	xor	a, a
00173$:
	ld	-19 (ix), a
;curses/wclrtobot.c:18: for (ptr = &win->_line[y][startx]; ptr <= end; ptr++) {
;	genCmpGt
;	AOP_STK for _wclrtobot_maxx_65536_142
;	AOP_STK for _wclrtobot_end_65536_142
	ld	a, -6 (ix)
	sub	a, -8 (ix)
	ld	a, -5 (ix)
	sbc	a, -7 (ix)
	jr	C,00105$
; peephole 165 changed absolute to relative conditional jump.
;curses/wclrtobot.c:19: if (*ptr != blank) {
;	genPointerGet
;	AOP_STK for _wclrtobot_maxx_65536_142
;fetchPairLong
	ld	l, -8 (ix)
	ld	h, -7 (ix)
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;	genCmpEq
;	AOP_STK for _wclrtobot_blank_65536_142
	ld	a, -10 (ix)
	sub	a, e
	jr	NZ,00174$
; peephole 164 changed absolute to relative conditional jump.
	ld	a, -9 (ix)
	sub	a, d
	jr	Z,00116$
; peephole 163 changed absolute to relative conditional jump.
; peephole 81 removed jp by using inverse jump logic
00174$:
;curses/wclrtobot.c:20: maxx = ptr;
;	genAssign
;	AOP_STK for _wclrtobot_maxx_65536_142
;	AOP_STK for _wclrtobot_sloc8_1_0
	ld	a, -8 (ix)
	ld	-21 (ix), a
	ld	a, -7 (ix)
	ld	-20 (ix), a
;curses/wclrtobot.c:21: if (minx == _NO_CHANGE) minx = ptr - win->_line[y];
;	genIfx
;	AOP_STK for _wclrtobot_sloc7_1_0
	ld	a, -19 (ix)
	or	a, a
	jr	Z,00102$
; peephole 163 changed absolute to relative conditional jump.
;	genPointerGet
;	AOP_STK for _wclrtobot_sloc1_1_0
;fetchPairLong
	ld	l, -29 (ix)
	ld	h, -28 (ix)
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
;fetchPairLong
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;	genMinus
;	AOP_STK for _wclrtobot_maxx_65536_142
	ld	a, -8 (ix)
	sub	a, e
	ld	e, a
	ld	a, -7 (ix)
	sbc	a, d
	ld	d, a
;	genRightShift
;	AOP_STK for _wclrtobot_minx_65536_142
	ld	-2 (ix), e
	ld	-1 (ix), d
	sra	-1 (ix)
	rr	-2 (ix)
;	genLabel
00102$:
;curses/wclrtobot.c:22: *ptr = blank;
;	genAssign (pointer)
;	AOP_STK for _wclrtobot_maxx_65536_142
;	AOP_STK for _wclrtobot_blank_65536_142
;	isBitvar = 0
;fetchPairLong
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	ld	a, -10 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -9 (ix)
	ld	(hl), a
;	genLabel
00116$:
;curses/wclrtobot.c:18: for (ptr = &win->_line[y][startx]; ptr <= end; ptr++) {
;	genPlus
;	AOP_STK for _wclrtobot_maxx_65536_142
	ld	a, -8 (ix)
	add	a, #0x02
	ld	-8 (ix), a
	jp	NC,00115$
; peephole 84 jumped to 00115$ directly instead of via 00175$.
	inc	-7 (ix)
; peephole 158 removed unused label 00175$.
;	genGoto
	jp	00115$
;	genLabel
00105$:
;curses/wclrtobot.c:25: if (minx != _NO_CHANGE) {
;	genIfx
;	AOP_STK for _wclrtobot_sloc7_1_0
	ld	a, -19 (ix)
	or	a, a
	jp	NZ, 00112$
;curses/wclrtobot.c:26: if ((win->_minchng[y] > minx) || (win->_minchng[y] == _NO_CHANGE))
;	genPointerGet
;	AOP_STK for _wclrtobot_sloc3_1_0
;fetchPairLong
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	de, #0x001e
	add	hl, de
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genPlus
;	AOP_STK for _wclrtobot_sloc6_1_0
;	AOP_STK for _wclrtobot_sloc9_1_0
	ld	a, -18 (ix)
	add	a, c
	ld	-23 (ix), a
	ld	a, -17 (ix)
	adc	a, b
	ld	-22 (ix), a
;	genPointerGet
;	AOP_STK for _wclrtobot_sloc9_1_0
;	AOP_STK for _wclrtobot_sloc10_1_0
;fetchPairLong
	ld	l, -23 (ix)
	ld	h, -22 (ix)
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-25 (ix), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-24 (ix), a
;	genCmpGt
;	AOP_STK for _wclrtobot_sloc10_1_0
;	AOP_STK for _wclrtobot_minx_65536_142
	ld	a, -2 (ix)
	sub	a, -25 (ix)
	ld	a, -1 (ix)
	sbc	a, -24 (ix)
	jp	PO, 00176$
	xor	a, #0x80
00176$:
	jp	M, 00106$
;	genCmpEq
;	AOP_STK for _wclrtobot_sloc10_1_0
	ld	a, -25 (ix)
	inc	a
	jr	NZ,00107$
; peephole 164 changed absolute to relative conditional jump.
; peephole 84 jumped to 00107$ directly instead of via 00177$.
	ld	a, -24 (ix)
	inc	a
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00177$.
	jr	NZ,00107$
; peephole 164 changed absolute to relative conditional jump.
; peephole 82 removed jp by using inverse jump logic
; peephole 158 removed unused label 00178$.
;	genLabel
00106$:
;curses/wclrtobot.c:27: win->_minchng[y] = minx;
;	genAssign (pointer)
;	AOP_STK for _wclrtobot_sloc9_1_0
;	AOP_STK for _wclrtobot_minx_65536_142
;	isBitvar = 0
;fetchPairLong
	ld	l, -23 (ix)
	ld	h, -22 (ix)
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	ld	(hl), a
;	genLabel
00107$:
;curses/wclrtobot.c:28: if (win->_maxchng[y] < maxx - win->_line[y])
;	genPointerGet
;	AOP_STK for _wclrtobot_sloc4_1_0
;fetchPairLong
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	ld	de, #0x0020
	add	hl, de
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genPlus
;	AOP_STK for _wclrtobot_sloc6_1_0
;fetchPairLong
	push	hl
	ld	l, -18 (ix)
	ld	h, -17 (ix)
	push	hl
	pop	iy
	pop	hl
;fetchPairLong
	add	iy, bc
;	genPointerGet
	ld	e, 0 (iy)
	ld	d, 1 (iy)
;	genPointerGet
;	AOP_STK for _wclrtobot_sloc1_1_0
;fetchPairLong
	ld	l, -29 (ix)
	ld	h, -28 (ix)
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genPlus
;	AOP_STK for _wclrtobot_sloc6_1_0
;fetchPairLong
	ld	l, -18 (ix)
	ld	h, -17 (ix)
	add	hl, bc
;	genPointerGet
;fetchPairLong
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genMinus
;	AOP_STK for _wclrtobot_sloc8_1_0
	ld	a, -21 (ix)
	sub	a, c
	ld	c, a
	ld	a, -20 (ix)
	sbc	a, b
	ld	b, a
;	genRightShift
;fetchPairLong
	sra	b
	rr	c
;	genCmpLt
	ld	a, e
	sub	a, c
	ld	a, d
	sbc	a, b
	jp	PO, 00179$
	xor	a, #0x80
00179$:
	jp	P, 00112$
;curses/wclrtobot.c:29: win->_maxchng[y] = maxx - win->_line[y];
;	genAssign (pointer)
;	isBitvar = 0
	ld	0 (iy), c
	ld	1 (iy), b
;	genLabel
00112$:
;curses/wclrtobot.c:31: startx = 0;
;	genAssign
;	AOP_STK for _wclrtobot_startx_65536_142
	ld	-4 (ix), #0x00
	ld	-3 (ix), #0x00
;curses/wclrtobot.c:15: for (y = win->_cury; y <= win->_regbottom; y++) {
;	genPlus
;	AOP_STK for _wclrtobot_sloc0_1_0
	inc	-27 (ix)
	jp	NZ,00118$
; peephole 84 jumped to 00118$ directly instead of via 00180$.
	inc	-26 (ix)
; peephole 158 removed unused label 00180$.
;	genGoto
	jp	00118$
;	genLabel
00113$:
;curses/wclrtobot.c:33: return(OK);
;	genRet
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0000
;	genLabel
; peephole 158 removed unused label 00120$.
;curses/wclrtobot.c:34: }
;	genEndFunction
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
