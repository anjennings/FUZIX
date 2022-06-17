;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module wdeleteln
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _wdeleteln
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
;curses/wdeleteln.c:10: int wdeleteln(WINDOW *win)
;	genLabel
;	genFunction
;	---------------------------------
; Function wdeleteln
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 18 bytes.
_wdeleteln::
	call	___sdcc_enter_ix
	ld	hl, #-18
	add	hl, sp
	ld	sp, hl
;curses/wdeleteln.c:14: blank = ' ' | (win->_attrs & ATR_MSK);
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
;	AOP_STK for _wdeleteln_blank_65536_142
; peephole 9 loaded a from #0x00 directly instead of going through e.
	ld	a, #0x00
	or	a, #0x20
	ld	-6 (ix), a
	ld	-5 (ix), d
;curses/wdeleteln.c:16: temp = win->_line[win->_cury];
;	genPlus
;	AOP_STK for _wdeleteln_sloc0_1_0
;fetchPairLong
;fetchLitPair
	ld	hl, #0x001c
	add	hl, bc
	ex	(sp), hl
;	genPointerGet
;	AOP_STK for _wdeleteln_sloc0_1_0
;	AOP_STK for _wdeleteln_sloc1_1_0
;fetchPairLong
	pop	hl
	push	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-12 (ix), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-11 (ix), a
;	genPointerGet
;fetchPairLong
	ld	l, c
	ld	h, b
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;	genLeftShift
;fetchPairLong
	ld	l, e
	ld	h, d
	add	hl, hl
;	genPlus
;	AOP_STK for _wdeleteln_sloc1_1_0
	ld	a, -12 (ix)
	add	a, l
	ld	l, a
	ld	a, -11 (ix)
	adc	a, h
	ld	h, a
;	genPointerGet
;	AOP_STK for _wdeleteln_temp_65536_142
;fetchPairLong
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-1 (ix), a
;curses/wdeleteln.c:17: for (y = win->_cury; y < win->_regbottom; y++) {
;	genAssign
;	(registers are the same)
;	genAssign
;	AOP_STK for _wdeleteln_y_65536_142
	ld	-4 (ix), e
	ld	-3 (ix), d
;	genPlus
;	AOP_STK for _wdeleteln_sloc1_1_0
;fetchPairLong
;fetchLitPair
	ld	hl, #0x001e
	add	hl, bc
	ld	-12 (ix), l
	ld	-11 (ix), h
;	genPlus
;	AOP_STK for _wdeleteln_sloc2_1_0
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0020
	add	hl, bc
	ld	-10 (ix), l
	ld	-9 (ix), h
;	genPlus
;	AOP_STK for _wdeleteln_sloc3_1_0
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0006
	add	hl, bc
	ld	-16 (ix), l
	ld	-15 (ix), h
;	genPlus
;	AOP_STK for _wdeleteln_sloc4_1_0
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0024
	add	hl, bc
	ld	-14 (ix), l
	ld	-13 (ix), h
;	genLabel
00104$:
;	genPointerGet
;	AOP_STK for _wdeleteln_sloc4_1_0
;fetchPairLong
	ld	l, -14 (ix)
	ld	h, -13 (ix)
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;curses/wdeleteln.c:18: win->_line[y] = win->_line[y + 1];
;	genLeftShift
;	AOP_STK for _wdeleteln_y_65536_142
;fetchPairLong
	ld	c, -4 (ix)
	ld	b, -3 (ix)
	sla	c
	rl	b
;curses/wdeleteln.c:17: for (y = win->_cury; y < win->_regbottom; y++) {
;	genCmpLt
;	AOP_STK for _wdeleteln_y_65536_142
	ld	a, -4 (ix)
	sub	a, e
	ld	a, -3 (ix)
	sbc	a, d
	jp	PO, 00134$
	xor	a, #0x80
00134$:
	jp	P, 00101$
;curses/wdeleteln.c:18: win->_line[y] = win->_line[y + 1];
;	genPointerGet
;	AOP_STK for _wdeleteln_sloc0_1_0
;fetchPairLong
	pop	hl
	push	hl
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;	genPlus
;fetchPairLong
	push	de
	pop	iy
;fetchPairLong
	add	iy, bc
;	genPlus
;	AOP_STK for _wdeleteln_y_65536_142
;	AOP_STK for _wdeleteln_sloc5_1_0
	ld	a, -4 (ix)
	add	a, #0x01
	ld	-8 (ix), a
	ld	a, -3 (ix)
	adc	a, #0x00
	ld	-7 (ix), a
;	genLeftShift
;	AOP_STK for _wdeleteln_sloc5_1_0
;fetchPairLong
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	add	hl, hl
;	genPlus
	add	hl, de
;	genPointerGet
;fetchPairLong
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;	genAssign (pointer)
;	isBitvar = 0
	ld	0 (iy), e
	ld	1 (iy), d
;curses/wdeleteln.c:19: win->_minchng[y] = 0;
;	genPointerGet
;	AOP_STK for _wdeleteln_sloc1_1_0
;fetchPairLong
	ld	l, -12 (ix)
	ld	h, -11 (ix)
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	h, (hl)
;	genPlus
;fetchPairLong
	ld	l, e
	add	hl, bc
;	genAssign (pointer)
;	isBitvar = 0
;fetchPairLong
	xor	a, a
; peephole 128b cached zero in a.
	ld	(hl), a
	inc	hl
	ld	(hl), a
;curses/wdeleteln.c:20: win->_maxchng[y] = win->_maxx;
;	genPointerGet
;	AOP_STK for _wdeleteln_sloc2_1_0
;fetchPairLong
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
;	genPlus
	add	hl, bc
	ex	de, hl
;	genPointerGet
;	AOP_STK for _wdeleteln_sloc3_1_0
;fetchPairLong
	ld	l, -16 (ix)
	ld	h, -15 (ix)
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genAssign (pointer)
;	isBitvar = 0
;fetchPairLong
	ld	a, c
	ld	(de), a
	inc	de
	ld	a, b
	ld	(de), a
;curses/wdeleteln.c:17: for (y = win->_cury; y < win->_regbottom; y++) {
;	genAssign
;	AOP_STK for _wdeleteln_sloc5_1_0
;fetchPairLong
	ld	c, -8 (ix)
	ld	b, -7 (ix)
;	genAssign
;	AOP_STK for _wdeleteln_y_65536_142
	ld	-4 (ix), c
	ld	-3 (ix), b
;	genGoto
	jp	00104$
;	genLabel
00101$:
;curses/wdeleteln.c:22: win->_minchng[y] = 0;
;	genPointerGet
;	AOP_STK for _wdeleteln_sloc1_1_0
;fetchPairLong
	ld	l, -12 (ix)
	ld	h, -11 (ix)
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	h, (hl)
;	genPlus
;fetchPairLong
	ld	l, e
	add	hl, bc
;	genAssign (pointer)
;	isBitvar = 0
;fetchPairLong
	xor	a, a
; peephole 128b cached zero in a.
	ld	(hl), a
	inc	hl
	ld	(hl), a
;curses/wdeleteln.c:23: win->_maxchng[y] = win->_maxx;
;	genPointerGet
;	AOP_STK for _wdeleteln_sloc2_1_0
;fetchPairLong
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
;	genPlus
	add	hl, bc
	ex	de, hl
;	genPointerGet
;	AOP_STK for _wdeleteln_sloc3_1_0
;fetchPairLong
	ld	l, -16 (ix)
	ld	h, -15 (ix)
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genAssign (pointer)
;	isBitvar = 0
;fetchPairLong
	ld	a, c
	ld	(de), a
	inc	de
	ld	a, b
	ld	(de), a
;curses/wdeleteln.c:24: win->_line[win->_regbottom] = temp;
;	genPointerGet
;	AOP_STK for _wdeleteln_sloc0_1_0
;fetchPairLong
	pop	hl
	push	hl
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genPointerGet
;	AOP_STK for _wdeleteln_sloc4_1_0
;fetchPairLong
	ld	l, -14 (ix)
	ld	h, -13 (ix)
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
;	genAssign (pointer)
;	AOP_STK for _wdeleteln_temp_65536_142
;	isBitvar = 0
;fetchPairLong
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	ld	(hl), a
;curses/wdeleteln.c:25: for (end = &(temp[win->_maxx]); temp <= end;) *temp++ = blank;
;	genPointerGet
;	AOP_STK for _wdeleteln_sloc3_1_0
;fetchPairLong
	ld	l, -16 (ix)
	ld	h, -15 (ix)
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	h, (hl)
;	genLeftShift
;fetchPairLong
	ld	l, c
	add	hl, hl
;	genPlus
;	AOP_STK for _wdeleteln_temp_65536_142
;fetchPairLong
	ld	e, -2 (ix)
	ld	d, -1 (ix)
	add	hl, de
;	genAssign
;fetchPairLong
	ld	c, l
	ld	b, h
;	genAssign
;	AOP_STK for _wdeleteln_temp_65536_142
;fetchPairLong
	ld	l, -2 (ix)
	ld	h, -1 (ix)
;	genLabel
00107$:
;	genCmpGt
	ld	a, c
	sub	a, l
	ld	a, b
	sbc	a, h
	jr	C,00102$
; peephole 165 changed absolute to relative conditional jump.
;	genAssign (pointer)
;	AOP_STK for _wdeleteln_blank_65536_142
;	isBitvar = 0
	ld	a, -6 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -5 (ix)
	ld	(hl), a
	dec	hl
;	genPlus
	inc	hl
	inc	hl
;	genGoto
	jr	00107$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00102$:
;curses/wdeleteln.c:26: return(OK);
;	genRet
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0000
;	genLabel
; peephole 158 removed unused label 00109$.
;curses/wdeleteln.c:27: }
;	genEndFunction
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
