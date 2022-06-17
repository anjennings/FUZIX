;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module winsertln
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _winsertln
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
;curses/winsertln.c:9: int winsertln(WINDOW *win)
;	genLabel
;	genFunction
;	---------------------------------
; Function winsertln
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 18 bytes.
_winsertln::
	call	___sdcc_enter_ix
	ld	hl, #-18
	add	hl, sp
	ld	sp, hl
;curses/winsertln.c:13: blank = ' ' | (win->_attrs & ATR_MSK);
;	genAssign
;	AOP_STK for 
;	AOP_STK for _winsertln_sloc0_1_0
	ld	a, 4 (ix)
	ld	-16 (ix), a
	ld	a, 5 (ix)
	ld	-15 (ix), a
;	genAssign
;	AOP_STK for _winsertln_sloc0_1_0
;fetchPairLong
	pop	bc
	pop	hl
	push	hl
	push	bc
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
;	AOP_STK for _winsertln_blank_65536_142
; peephole 9 loaded a from #0x00 directly instead of going through c.
	ld	a, #0x00
	or	a, #0x20
	ld	-4 (ix), a
	ld	-3 (ix), b
;curses/winsertln.c:14: temp = win->_line[win->_regbottom];
;	genPlus
;	AOP_STK for _winsertln_sloc0_1_0
;	AOP_STK for _winsertln_sloc1_1_0
	ld	a, -16 (ix)
	add	a, #0x1c
	ld	-12 (ix), a
	ld	a, -15 (ix)
	adc	a, #0x00
	ld	-11 (ix), a
;	genPointerGet
;	AOP_STK for _winsertln_sloc1_1_0
;fetchPairLong
	ld	l, -12 (ix)
	ld	h, -11 (ix)
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genAssign
;	AOP_STK for _winsertln_sloc0_1_0
;fetchPairLong
	pop	de
	pop	hl
	push	hl
	push	de
;	genPointerGet
;fetchPairLong
	ld	de, #0x0024
	add	hl, de
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
	add	hl, bc
;	genPointerGet
;fetchPairLong
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;curses/winsertln.c:15: for (y = win->_regbottom; y > win->_cury; y--) {
;	genAssign
;	(registers are the same)
;	genAssign
;	AOP_STK for _winsertln_y_65536_142
	ld	-2 (ix), e
	ld	-1 (ix), d
;	genPlus
;	AOP_STK for _winsertln_sloc0_1_0
;	AOP_STK for _winsertln_sloc2_1_0
	ld	a, -16 (ix)
	add	a, #0x1e
	ld	-14 (ix), a
	ld	a, -15 (ix)
	adc	a, #0x00
	ld	-13 (ix), a
;	genPlus
;	AOP_STK for _winsertln_sloc0_1_0
;	AOP_STK for _winsertln_sloc3_1_0
	ld	a, -16 (ix)
	add	a, #0x20
	ld	-18 (ix), a
	ld	a, -15 (ix)
	adc	a, #0x00
	ld	-17 (ix), a
;	genPlus
;	AOP_STK for _winsertln_sloc0_1_0
;	AOP_STK for _winsertln_sloc4_1_0
	ld	a, -16 (ix)
	add	a, #0x06
	ld	-10 (ix), a
	ld	a, -15 (ix)
	adc	a, #0x00
	ld	-9 (ix), a
;	genLabel
00104$:
;	genPointerGet
;	AOP_STK for _winsertln_sloc0_1_0
;fetchPairLong
	ld	l, -16 (ix)
	ld	h, -15 (ix)
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;curses/winsertln.c:14: temp = win->_line[win->_regbottom];
;	genPointerGet
;	AOP_STK for _winsertln_sloc1_1_0
;fetchPairLong
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
;curses/winsertln.c:15: for (y = win->_regbottom; y > win->_cury; y--) {
;	genCmpGt
;	AOP_STK for _winsertln_y_65536_142
	ld	a, e
	sub	a, -2 (ix)
	ld	a, d
	sbc	a, -1 (ix)
	jp	PO, 00132$
	xor	a, #0x80
00132$:
	jp	P, 00101$
;curses/winsertln.c:16: win->_line[y] = win->_line[y - 1];
;	genLeftShift
;	AOP_STK for _winsertln_y_65536_142
;fetchPairLong
	ld	e, -2 (ix)
	ld	d, -1 (ix)
	sla	e
	rl	d
;	genPlus
;fetchPairLong
	push	hl
	pop	iy
;fetchPairLong
	add	iy, de
;	genMinus
;	AOP_STK for _winsertln_y_65536_142
;	AOP_STK for _winsertln_sloc5_1_0
	ld	a, -2 (ix)
	add	a, #0xff
	ld	-6 (ix), a
	ld	a, -1 (ix)
	adc	a, #0xff
	ld	-5 (ix), a
;	genLeftShift
;	AOP_STK for _winsertln_sloc5_1_0
;	AOP_STK for _winsertln_sloc6_1_0
	ld	a, -6 (ix)
	ld	-8 (ix), a
	ld	a, -5 (ix)
	ld	-7 (ix), a
	sla	-8 (ix)
	rl	-7 (ix)
;	genPlus
;	AOP_STK for _winsertln_sloc6_1_0
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
;	genAssign (pointer)
;	isBitvar = 0
; peephole 13 loaded a into 0 (iy) directly instead of going through l.
	ld	0 (iy), a
	ld	1 (iy), h
;curses/winsertln.c:17: win->_minchng[y] = 0;
;	genPointerGet
;	AOP_STK for _winsertln_sloc2_1_0
;fetchPairLong
	ld	l, -14 (ix)
	ld	h, -13 (ix)
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
;curses/winsertln.c:18: win->_maxchng[y] = win->_maxx;
;	genPointerGet
;	AOP_STK for _winsertln_sloc3_1_0
;fetchPairLong
	pop	hl
	push	hl
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
;	genPlus
	add	hl, de
	push	hl
	pop	iy
;	genPointerGet
;	AOP_STK for _winsertln_sloc4_1_0
;fetchPairLong
	ld	l, -10 (ix)
	ld	h, -9 (ix)
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;	genAssign (pointer)
;	isBitvar = 0
	ld	0 (iy), e
	ld	1 (iy), d
;curses/winsertln.c:15: for (y = win->_regbottom; y > win->_cury; y--) {
;	genAssign
;	AOP_STK for _winsertln_sloc5_1_0
;fetchPairLong
	ld	e, -6 (ix)
	ld	d, -5 (ix)
;	genAssign
;	AOP_STK for _winsertln_y_65536_142
	ld	-2 (ix), e
	ld	-1 (ix), d
;	genGoto
	jp	00104$
;	genLabel
00101$:
;curses/winsertln.c:20: win->_line[win->_cury] = temp;
;	genLeftShift
;fetchPairLong
	sla	e
	rl	d
;	genPlus
	add	hl, de
;	genAssign (pointer)
;	isBitvar = 0
;fetchPairLong
	ld	(hl), c
	inc	hl
	ld	(hl), b
;curses/winsertln.c:21: for (end = &temp[win->_maxx]; temp <= end; temp++) *temp = blank;
;	genAssign
;	AOP_STK for _winsertln_sloc4_1_0
;	AOP_STK for _winsertln_sloc6_1_0
	ld	a, -10 (ix)
	ld	-8 (ix), a
	ld	a, -9 (ix)
	ld	-7 (ix), a
;	genPointerGet
;	AOP_STK for _winsertln_sloc4_1_0
;fetchPairLong
	ld	l, -10 (ix)
	ld	h, -9 (ix)
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
	ex	de, hl
;	genAssign
;	(registers are the same)
;	genAssign
;	(registers are the same)
;	genLabel
00107$:
;	genCmpGt
	ld	a, e
	sub	a, c
	ld	a, d
	sbc	a, b
	jr	C,00102$
; peephole 165 changed absolute to relative conditional jump.
;	genAssign (pointer)
;	AOP_STK for _winsertln_blank_65536_142
;	isBitvar = 0
;fetchPairLong
	ld	l, c
	ld	h, b
	ld	a, -4 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -3 (ix)
	ld	(hl), a
;	genPlus
	inc	bc
	inc	bc
;	genGoto
	jr	00107$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00102$:
;curses/winsertln.c:22: win->_minchng[win->_cury] = 0;
;	genPointerGet
;	AOP_STK for _winsertln_sloc2_1_0
;fetchPairLong
	ld	l, -14 (ix)
	ld	h, -13 (ix)
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genPointerGet
;	AOP_STK for _winsertln_sloc0_1_0
;fetchPairLong
	ld	l, -16 (ix)
	ld	h, -15 (ix)
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
;	isBitvar = 0
;fetchPairLong
	xor	a, a
; peephole 128b cached zero in a.
	ld	(hl), a
	inc	hl
	ld	(hl), a
;curses/winsertln.c:23: win->_maxchng[win->_cury] = win->_maxx;
;	genPointerGet
;	AOP_STK for _winsertln_sloc3_1_0
;fetchPairLong
	pop	hl
	push	hl
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genPointerGet
;	AOP_STK for _winsertln_sloc0_1_0
;fetchPairLong
	ld	l, -16 (ix)
	ld	h, -15 (ix)
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
	ex	de, hl
;	genPointerGet
;	AOP_STK for _winsertln_sloc6_1_0
;fetchPairLong
	ld	l, -8 (ix)
	ld	h, -7 (ix)
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
;curses/winsertln.c:24: return(OK);
;	genRet
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0000
;	genLabel
; peephole 158 removed unused label 00109$.
;curses/winsertln.c:25: }
;	genEndFunction
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
