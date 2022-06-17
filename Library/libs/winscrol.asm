;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module winscrol
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _scroll
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_scroll_blank_65536_142:
	.ds 2
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
;curses/winscrol.c:27: void scroll(WINDOW *win)
;	genLabel
;	genFunction
;	---------------------------------
; Function scroll
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 22 bytes.
_scroll::
	call	___sdcc_enter_ix
	ld	hl, #-22
	add	hl, sp
	ld	sp, hl
;curses/winscrol.c:34: blank = ' ' | (win->_attrs & ATR_MSK);
;	genAssign
;	AOP_STK for 
;	AOP_STK for _scroll_sloc0_1_0
	ld	a, 4 (ix)
	ld	-22 (ix), a
	ld	a, 5 (ix)
	ld	-21 (ix), a
;	genAssign
;	AOP_STK for _scroll_sloc0_1_0
;fetchPairLong
	pop	hl
	push	hl
;	genPointerGet
;fetchPairLong
	ld	de, #0x000e
	add	hl, de
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genAnd
;	genOr
; peephole 9 loaded a from #0x00 directly instead of going through c.
	ld	a, #0x00
	or	a, #0x20
;fetchLitPair
	ld	iy, #_scroll_blank_65536_142
	ld	0 (iy), a
;fetchLitPair
	ld	1 (iy), b
;curses/winscrol.c:35: if ((!win->_scroll)		/* check if window scrolls */
;	genAssign
;	AOP_STK for _scroll_sloc0_1_0
;fetchPairLong
	pop	hl
	push	hl
;	genPointerGet
;fetchPairLong
	ld	de, #0x0016
	add	hl, de
;	_moveFrom_tpair_()
;	_moveFrom_tpair_()
;	genIfx
; peephole 9 loaded a from (hl) directly instead of going through b.
	ld	a, (hl)
	inc	hl
; peephole 99a removed load by reordering or arguments.
	or	a, (hl)
	jp	Z,00115$
; peephole 84 jumped to 00115$ directly instead of via 00101$.
;curses/winscrol.c:36: ||(win->_cury < win->_regtop)	/* and cursor in region */
;	genPointerGet
;	AOP_STK for _scroll_sloc0_1_0
;fetchPairLong
	pop	hl
	push	hl
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;	genPlus
;	AOP_STK for _scroll_sloc0_1_0
;	AOP_STK for _scroll_sloc1_1_0
	ld	a, -22 (ix)
	add	a, #0x22
	ld	-6 (ix), a
	ld	a, -21 (ix)
	adc	a, #0x00
	ld	-5 (ix), a
;	genPointerGet
;	AOP_STK for _scroll_sloc1_1_0
;fetchPairLong
	ld	l, -6 (ix)
	ld	h, -5 (ix)
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genCmpLt
	ld	a, e
	sub	a, c
	ld	a, d
	sbc	a, b
	jp	PO, 00153$
	xor	a, #0x80
00153$:
	jp	M,00115$
; peephole 84 jumped to 00115$ directly instead of via 00101$.
;curses/winscrol.c:37: ||(win->_cury > win->_regbottom)
;	genPlus
;	AOP_STK for _scroll_sloc0_1_0
;	AOP_STK for _scroll_sloc2_1_0
	ld	a, -22 (ix)
	add	a, #0x24
	ld	-8 (ix), a
	ld	a, -21 (ix)
	adc	a, #0x00
	ld	-7 (ix), a
;	genPointerGet
;	AOP_STK for _scroll_sloc2_1_0
;fetchPairLong
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	genCmpGt
; peephole 9 loaded a from a directly instead of going through l.
; peephole 0 removed redundant load from a into a.
	sub	a, e
	ld	a, h
	sbc	a, d
	jp	PO, 00154$
	xor	a, #0x80
00154$:
	jp	P, 00102$
;	genLabel
; peephole 158 removed unused label 00101$.
;curses/winscrol.c:39: return;
;	genRet
	jp	00115$
;	genLabel
00102$:
;curses/winscrol.c:41: temp = win->_line[win->_regtop];
;	genPlus
;	AOP_STK for _scroll_sloc0_1_0
;	AOP_STK for _scroll_sloc3_1_0
	ld	a, -22 (ix)
	add	a, #0x1c
	ld	-10 (ix), a
	ld	a, -21 (ix)
	adc	a, #0x00
	ld	-9 (ix), a
;	genPointerGet
;	AOP_STK for _scroll_sloc3_1_0
;fetchPairLong
	ld	l, -10 (ix)
	ld	h, -9 (ix)
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;	genLeftShift
;fetchPairLong
	ld	l, c
	ld	h, b
	add	hl, hl
;	genPlus
	add	hl, de
;	genPointerGet
;	AOP_STK for _scroll_temp_65536_142
;fetchPairLong
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-4 (ix), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-3 (ix), a
;curses/winscrol.c:42: for (i = win->_regtop; i < win->_regbottom; i++) {
;	genAssign
;	(registers are the same)
;	genAssign
;	AOP_STK for _scroll_i_65536_142
	ld	-2 (ix), c
	ld	-1 (ix), b
;	genPlus
;	AOP_STK for _scroll_sloc0_1_0
;	AOP_STK for _scroll_sloc4_1_0
	ld	a, -22 (ix)
	add	a, #0x1e
	ld	-12 (ix), a
	ld	a, -21 (ix)
	adc	a, #0x00
	ld	-11 (ix), a
;	genPlus
;	AOP_STK for _scroll_sloc0_1_0
;	AOP_STK for _scroll_sloc5_1_0
	ld	a, -22 (ix)
	add	a, #0x20
	ld	-14 (ix), a
	ld	a, -21 (ix)
	adc	a, #0x00
	ld	-13 (ix), a
;	genPlus
;	AOP_STK for _scroll_sloc0_1_0
;	AOP_STK for _scroll_sloc6_1_0
	ld	a, -22 (ix)
	add	a, #0x06
	ld	-16 (ix), a
	ld	a, -21 (ix)
	adc	a, #0x00
	ld	-15 (ix), a
;	genLabel
00110$:
;	genPointerGet
;	AOP_STK for _scroll_sloc2_1_0
;fetchPairLong
	ld	l, -8 (ix)
	ld	h, -7 (ix)
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genCmpLt
;	AOP_STK for _scroll_i_65536_142
	ld	a, -2 (ix)
	sub	a, c
	ld	a, -1 (ix)
	sbc	a, b
	jp	PO, 00155$
	xor	a, #0x80
00155$:
	jp	P, 00122$
;curses/winscrol.c:43: win->_line[i] = win->_line[i + 1];	/* re-arrange line pointers */
;	genPointerGet
;	AOP_STK for _scroll_sloc3_1_0
;	AOP_STK for _scroll_sloc7_1_0
;fetchPairLong
	ld	l, -10 (ix)
	ld	h, -9 (ix)
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-18 (ix), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-17 (ix), a
;	genLeftShift
;	AOP_STK for _scroll_i_65536_142
;	AOP_STK for _scroll_sloc8_1_0
	ld	a, -2 (ix)
	ld	-20 (ix), a
	ld	a, -1 (ix)
	ld	-19 (ix), a
	sla	-20 (ix)
	rl	-19 (ix)
;	genPlus
;	AOP_STK for _scroll_sloc7_1_0
;	AOP_STK for _scroll_sloc8_1_0
;fetchPairLong
	push	hl
	ld	l, -18 (ix)
	ld	h, -17 (ix)
	push	hl
	pop	iy
	pop	hl
;fetchPairLong
	ld	e, -20 (ix)
	ld	d, -19 (ix)
	add	iy, de
;	genPlus
;	AOP_STK for _scroll_i_65536_142
;fetchPairLong
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	inc	bc
;	genLeftShift
;fetchPairLong
	ld	l, c
	ld	h, b
	add	hl, hl
;	genPlus
;	AOP_STK for _scroll_sloc7_1_0
;fetchPairLong
	ld	e, -18 (ix)
	ld	d, -17 (ix)
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
;curses/winscrol.c:44: win->_minchng[i] = 0;
;	genPointerGet
;	AOP_STK for _scroll_sloc4_1_0
;fetchPairLong
	ld	l, -12 (ix)
	ld	h, -11 (ix)
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;	genPlus
;	AOP_STK for _scroll_sloc8_1_0
;fetchPairLong
	ld	l, -20 (ix)
	ld	h, -19 (ix)
	add	hl, de
;	genAssign (pointer)
;	isBitvar = 0
;fetchPairLong
	xor	a, a
; peephole 128b cached zero in a.
	ld	(hl), a
	inc	hl
	ld	(hl), a
;curses/winscrol.c:45: win->_maxchng[i] = win->_maxx;
;	genPointerGet
;	AOP_STK for _scroll_sloc5_1_0
;fetchPairLong
	ld	l, -14 (ix)
	ld	h, -13 (ix)
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;	genPlus
;	AOP_STK for _scroll_sloc8_1_0
;fetchPairLong
	push	hl
	ld	l, -20 (ix)
	ld	h, -19 (ix)
	push	hl
	pop	iy
	pop	hl
;fetchPairLong
	add	iy, de
;	genPointerGet
;	AOP_STK for _scroll_sloc6_1_0
;fetchPairLong
	ld	l, -16 (ix)
	ld	h, -15 (ix)
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;	genAssign (pointer)
;	isBitvar = 0
	ld	0 (iy), e
	ld	1 (iy), d
;curses/winscrol.c:42: for (i = win->_regtop; i < win->_regbottom; i++) {
;	genAssign
;	(registers are the same)
;	genAssign
;	AOP_STK for _scroll_i_65536_142
	ld	-2 (ix), c
	ld	-1 (ix), b
;	genGoto
	jp	00110$
;curses/winscrol.c:47: for (ptr = temp; ptr - temp <= win->_maxx; ptr++)
;	genLabel
00122$:
;	genAssign
;	AOP_STK for _scroll_sloc6_1_0
;fetchPairLong
	ld	c, -16 (ix)
	ld	b, -15 (ix)
;	genAssign
;	AOP_STK for _scroll_temp_65536_142
;fetchPairLong
	ld	e, -4 (ix)
	ld	d, -3 (ix)
;	genLabel
00113$:
;	genMinus
;	AOP_STK for _scroll_temp_65536_142
	ld	a, e
	sub	a, -4 (ix)
	ld	l, a
	ld	a, d
	sbc	a, -3 (ix)
	ld	h, a
;	genRightShift
;	AOP_STK for _scroll_sloc8_1_0
	ld	-20 (ix), l
	ld	-19 (ix), h
	sra	-19 (ix)
	rr	-20 (ix)
;	genPointerGet
;fetchPairLong
	ld	l, c
	ld	h, b
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	genCmpGt
;	AOP_STK for _scroll_sloc8_1_0
; peephole 9 loaded a from a directly instead of going through l.
; peephole 0 removed redundant load from a into a.
	sub	a, -20 (ix)
	ld	a, h
	sbc	a, -19 (ix)
	jp	PO, 00158$
	xor	a, #0x80
00158$:
	jp	M, 00106$
;curses/winscrol.c:48: *ptr = blank;		/* make a blank line */
;	genAssign (pointer)
;	isBitvar = 0
;fetchPairLong
	ld	l, e
	ld	h, d
;fetchLitPair
	ld	iy, #_scroll_blank_65536_142
	ld	a, 0 (iy)
	ld	(hl), a
	inc	hl
;fetchLitPair
	ld	a, 1 (iy)
	ld	(hl), a
;curses/winscrol.c:47: for (ptr = temp; ptr - temp <= win->_maxx; ptr++)
;	genPlus
	inc	de
	inc	de
;	genGoto
	jr	00113$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00106$:
;curses/winscrol.c:49: win->_line[win->_regbottom] = temp;
;	genPointerGet
;	AOP_STK for _scroll_sloc3_1_0
;fetchPairLong
	ld	l, -10 (ix)
	ld	h, -9 (ix)
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;	genPointerGet
;	AOP_STK for _scroll_sloc2_1_0
;fetchPairLong
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
;	genLeftShift
	add	hl, hl
;fetchPairLong
;	genPlus
	add	hl, de
;	genAssign (pointer)
;	AOP_STK for _scroll_temp_65536_142
;	isBitvar = 0
;fetchPairLong
	ld	a, -4 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -3 (ix)
	ld	(hl), a
;curses/winscrol.c:50: if (win->_cury > win->_regtop)/* if not on top line */
;	genPointerGet
;	AOP_STK for _scroll_sloc0_1_0
;fetchPairLong
	pop	hl
	push	hl
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;	genPointerGet
;	AOP_STK for _scroll_sloc1_1_0
;fetchPairLong
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	genCmpGt
; peephole 9 loaded a from a directly instead of going through l.
; peephole 0 removed redundant load from a into a.
	sub	a, e
	ld	a, h
	sbc	a, d
	jp	PO, 00159$
	xor	a, #0x80
00159$:
	jp	P, 00108$
;curses/winscrol.c:51: win->_cury--;		/* cursor scrolls too */
;	genMinus
	dec	de
;	genAssign (pointer)
;	AOP_STK for _scroll_sloc0_1_0
;	isBitvar = 0
;fetchPairLong
	pop	hl
	push	hl
	ld	(hl), e
	inc	hl
	ld	(hl), d
;	genLabel
00108$:
;curses/winscrol.c:52: win->_minchng[win->_regbottom] = 0;
;	genPointerGet
;	AOP_STK for _scroll_sloc4_1_0
;fetchPairLong
	ld	l, -12 (ix)
	ld	h, -11 (ix)
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;	genPointerGet
;	AOP_STK for _scroll_sloc2_1_0
;fetchPairLong
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
;	genLeftShift
	add	hl, hl
;fetchPairLong
;	genPlus
	add	hl, de
;	genAssign (pointer)
;	isBitvar = 0
;fetchPairLong
	xor	a, a
; peephole 128b cached zero in a.
	ld	(hl), a
	inc	hl
	ld	(hl), a
;curses/winscrol.c:53: win->_maxchng[win->_regbottom] = win->_maxx;
;	genPointerGet
;	AOP_STK for _scroll_sloc5_1_0
;fetchPairLong
	ld	l, -14 (ix)
	ld	h, -13 (ix)
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;	genPointerGet
;	AOP_STK for _scroll_sloc2_1_0
;fetchPairLong
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
;	genLeftShift
	add	hl, hl
;fetchPairLong
;	genPlus
	add	hl, de
	ex	de, hl
;	genPointerGet
;fetchPairLong
	ld	l, c
	ld	h, b
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
;	genLabel
00115$:
;curses/winscrol.c:54: }				/* scroll */
;	genEndFunction
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
