;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module werase
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _werase
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
;curses/werase.c:9: void werase(WINDOW *win)
;	genLabel
;	genFunction
;	---------------------------------
; Function werase
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 20 bytes.
_werase::
	call	___sdcc_enter_ix
	ld	hl, #-20
	add	hl, sp
	ld	sp, hl
;curses/werase.c:13: blank = ' ' | (win->_attrs & ATR_MSK);
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
;	AOP_STK for _werase_blank_65536_142
; peephole 9 loaded a from #0x00 directly instead of going through e.
	ld	a, #0x00
	or	a, #0x20
	ld	-6 (ix), a
	ld	-5 (ix), d
;curses/werase.c:15: for (y = win->_regtop; y <= win->_regbottom; y++) {	/* clear all lines */
;	genPlus
;	AOP_STK for _werase_sloc0_1_0
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0022
	add	hl, bc
;	genPointerGet
;	AOP_STK for _werase_sloc0_1_0
;	AOP_STK for _werase_sloc1_1_0
;fetchPairLong
	ld	-14 (ix), l
	ld	-13 (ix), h
; peephole 11 loaded lh from lh directly instead of going through -14 (ix) -13 (ix).
; peephole 0 removed redundant load from l into l.
; peephole 0 removed redundant load from h into h.
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-16 (ix), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-15 (ix), a
;	genAssign
;	AOP_STK for _werase_sloc2_1_0
	ld	-12 (ix), c
	ld	-11 (ix), b
;	genPlus
;	AOP_STK for _werase_sloc3_1_0
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0006
	add	hl, bc
	ld	-18 (ix), l
	ld	-17 (ix), h
;	genAssign
;	AOP_STK for _werase_sloc4_1_0
	inc	sp
	inc	sp
	push	bc
;	genAssign
;	AOP_STK for _werase_sloc5_1_0
	ld	-8 (ix), c
	ld	-7 (ix), b
;	genAssign
;	AOP_STK for _werase_sloc6_1_0
	ld	-10 (ix), c
	ld	-9 (ix), b
;	genLabel
00106$:
;	genPointerGet
;	AOP_STK for _werase_sloc6_1_0
;fetchPairLong
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	ld	de, #0x0024
	add	hl, de
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;	genCmpGt
;	AOP_STK for _werase_sloc1_1_0
	ld	a, e
	sub	a, -16 (ix)
	ld	a, d
	sbc	a, -15 (ix)
	jp	PO, 00132$
	xor	a, #0x80
00132$:
	jp	M, 00104$
;curses/werase.c:16: start = win->_line[y];
;	genPointerGet
;	AOP_STK for _werase_sloc2_1_0
;fetchPairLong
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	de, #0x001c
	add	hl, de
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
;	genLeftShift
;	AOP_STK for _werase_sloc1_1_0
;fetchPairLong
	ld	e, -16 (ix)
	ld	d, -15 (ix)
	sla	e
	rl	d
;	genPlus
	add	hl, de
;	genPointerGet
;	AOP_STK for _werase_start_65536_142
;fetchPairLong
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-4 (ix), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-3 (ix), a
;curses/werase.c:17: end = &start[win->_maxx];
;	genPointerGet
;	AOP_STK for _werase_sloc3_1_0
;fetchPairLong
	ld	l, -18 (ix)
	ld	h, -17 (ix)
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
;	genLeftShift
	add	hl, hl
;fetchPairLong
;	genPlus
;	AOP_STK for _werase_start_65536_142
	ld	a, -4 (ix)
	add	a, l
	ld	l, a
	ld	a, -3 (ix)
	adc	a, h
	ld	h, a
;	genAssign
;	AOP_STK for _werase_end_65536_142
	ld	-2 (ix), l
	ld	-1 (ix), h
;curses/werase.c:18: while (start <= end)	/* clear all line */
;	genAssign
;	AOP_STK for _werase_start_65536_142
;fetchPairLong
	ld	l, -4 (ix)
	ld	h, -3 (ix)
;	genLabel
00101$:
;	genCmpGt
;	AOP_STK for _werase_end_65536_142
	ld	a, -2 (ix)
	sub	a, l
	ld	a, -1 (ix)
	sbc	a, h
	jr	C,00103$
; peephole 165 changed absolute to relative conditional jump.
;curses/werase.c:19: *start++ = blank;
;	genAssign (pointer)
;	AOP_STK for _werase_blank_65536_142
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
	jr	00101$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00103$:
;curses/werase.c:20: win->_minchng[y] = 0;
;	genPointerGet
;	AOP_STK for _werase_sloc4_1_0
;fetchPairLong
	pop	hl
	push	hl
	push	bc
	ld	bc, #0x001e
	add	hl, bc
	pop	bc
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
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
;curses/werase.c:21: win->_maxchng[y] = win->_maxx;
;	genPointerGet
;	AOP_STK for _werase_sloc5_1_0
;fetchPairLong
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	push	bc
	ld	bc, #0x0020
	add	hl, bc
	pop	bc
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
;	genPlus
	add	hl, de
	push	hl
	pop	iy
;	genPointerGet
;	AOP_STK for _werase_sloc3_1_0
;fetchPairLong
	ld	l, -18 (ix)
	ld	h, -17 (ix)
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;	genAssign (pointer)
;	isBitvar = 0
	ld	0 (iy), e
	ld	1 (iy), d
;curses/werase.c:15: for (y = win->_regtop; y <= win->_regbottom; y++) {	/* clear all lines */
;	genPlus
;	AOP_STK for _werase_sloc1_1_0
	inc	-16 (ix)
	jp	NZ,00106$
; peephole 84 jumped to 00106$ directly instead of via 00135$.
	inc	-15 (ix)
; peephole 158 removed unused label 00135$.
;	genGoto
	jp	00106$
;	genLabel
00104$:
;curses/werase.c:23: win->_cury = win->_regtop;	/* cursor home */
;	genPointerGet
;	AOP_STK for _werase_sloc0_1_0
;fetchPairLong
	ld	l, -14 (ix)
	ld	h, -13 (ix)
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;	genAssign (pointer)
;	isBitvar = 0
;fetchPairLong
	ld	l, c
	ld	h, b
	ld	(hl), e
	inc	hl
	ld	(hl), d
;curses/werase.c:24: win->_curx = 0;
;	genPlus
	inc	bc
	inc	bc
	ld	h, b
;	genAssign (pointer)
;	isBitvar = 0
;fetchPairLong
	ld	l, c
	xor	a, a
; peephole 128b cached zero in a.
	ld	(hl), a
	inc	hl
	ld	(hl), a
;	genLabel
; peephole 158 removed unused label 00108$.
;curses/werase.c:25: }
;	genEndFunction
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
