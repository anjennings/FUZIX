;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module wbox
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _wbox
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
;curses/wbox.c:13: int wbox(WINDOW *win, int ymin, int xmin, int ymax, int xmax, unsigned int v, unsigned int h)
;	genLabel
;	genFunction
;	---------------------------------
; Function wbox
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 32 bytes.
_wbox::
	call	___sdcc_enter_ix
	ld	hl, #-32
	add	hl, sp
	ld	sp, hl
;curses/wbox.c:18: if (ymax == 0) ymax = win->_maxy;
;	genAssign
;	AOP_STK for 
;fetchPairLong
	ld	c, 4 (ix)
	ld	b, 5 (ix)
;	genAssign
;fetchPairLong
	push	bc
	pop	iy
;	genPointerGet
;	AOP_STK for _wbox_sloc0_1_0
	ld	a, 4 (iy)
	ld	-24 (ix), a
	ld	a, 5 (iy)
	ld	-23 (ix), a
;	genIfx
;	AOP_STK for 
	ld	a, 11 (ix)
	or	a, 10 (ix)
	jr	NZ,00102$
; peephole 164 changed absolute to relative conditional jump.
;	genAssign
;	AOP_STK for _wbox_sloc0_1_0
;	AOP_STK for 
	ld	a, -24 (ix)
	ld	10 (ix), a
	ld	a, -23 (ix)
	ld	11 (ix), a
;	genLabel
00102$:
;curses/wbox.c:19: if (xmax == 0) xmax = win->_maxx;
;	genPlus
;	AOP_STK for _wbox_sloc1_1_0
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0006
	add	hl, bc
	ld	-18 (ix), l
	ld	-17 (ix), h
;	genIfx
;	AOP_STK for 
	ld	a, 13 (ix)
	or	a, 12 (ix)
	jr	NZ,00104$
; peephole 164 changed absolute to relative conditional jump.
;	genPointerGet
;	AOP_STK for _wbox_sloc1_1_0
;	AOP_STK for 
;fetchPairLong
	ld	l, -18 (ix)
	ld	h, -17 (ix)
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	12 (ix), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	13 (ix), a
;	genLabel
00104$:
;curses/wbox.c:21: if (ymin >= win->_maxy || ymax > win->_maxy ||
;	genAssign
;	AOP_STK for _wbox_sloc2_1_0
	ld	-28 (ix), c
	ld	-27 (ix), b
;	genCmpLt
;	AOP_STK for 
;	AOP_STK for _wbox_sloc0_1_0
	ld	a, 6 (ix)
	sub	a, -24 (ix)
	ld	a, 7 (ix)
	sbc	a, -23 (ix)
	jp	PO, 00229$
	xor	a, #0x80
00229$:
	jp	P, 00105$
;	genCmpGt
;	AOP_STK for 
;	AOP_STK for _wbox_sloc0_1_0
	ld	a, -24 (ix)
	sub	a, 10 (ix)
	ld	a, -23 (ix)
	sbc	a, 11 (ix)
	jp	PO, 00230$
	xor	a, #0x80
00230$:
	jp	M, 00105$
;curses/wbox.c:22: xmin >= win->_maxx || xmax > win->_maxx ||
;	genPointerGet
;	AOP_STK for _wbox_sloc1_1_0
;fetchPairLong
	ld	l, -18 (ix)
	ld	h, -17 (ix)
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;	genCmpLt
;	AOP_STK for 
	ld	a, 8 (ix)
	sub	a, e
	ld	a, 9 (ix)
	sbc	a, d
	jp	PO, 00231$
	xor	a, #0x80
00231$:
	jp	P, 00105$
;	genCmpGt
;	AOP_STK for 
	ld	a, e
	sub	a, 12 (ix)
	ld	a, d
	sbc	a, 13 (ix)
	jp	PO, 00232$
	xor	a, #0x80
00232$:
	jp	M, 00105$
;curses/wbox.c:23: ymin >= ymax || xmin >= xmax)
;	genCmpLt
;	AOP_STK for 
;	AOP_STK for 
	ld	a, 6 (ix)
	sub	a, 10 (ix)
	ld	a, 7 (ix)
	sbc	a, 11 (ix)
	jp	PO, 00233$
	xor	a, #0x80
00233$:
	jp	P, 00105$
;	genCmpLt
;	AOP_STK for 
;	AOP_STK for 
	ld	a, 8 (ix)
	sub	a, 12 (ix)
	ld	a, 9 (ix)
	sbc	a, 13 (ix)
	jp	PO, 00234$
	xor	a, #0x80
00234$:
	jp	M, 00106$
;	genLabel
00105$:
;curses/wbox.c:24: return(ERR);
;	genRet
;fetchPairLong
;fetchLitPair
	ld	hl, #0xffff
	jp	00130$
;	genLabel
00106$:
;curses/wbox.c:26: vc = v;
;	genAssign
;	AOP_STK for 
;	AOP_STK for _wbox_vc_65536_142
	ld	a, 14 (ix)
	ld	-2 (ix), a
	ld	a, 15 (ix)
	ld	-1 (ix), a
;curses/wbox.c:27: hc = h;
;	genAssign
;	AOP_STK for 
;	AOP_STK for _wbox_hc_65536_142
	ld	a, 16 (ix)
	ld	-4 (ix), a
	ld	a, 17 (ix)
	ld	-3 (ix), a
;curses/wbox.c:28: ulc = urc = llc = lrc = vc;	/* default same as vertical */
;	genAssign
;	AOP_STK for _wbox_vc_65536_142
;	AOP_STK for _wbox_lrc_65536_142
	ld	a, -2 (ix)
	ld	-12 (ix), a
	ld	a, -1 (ix)
	ld	-11 (ix), a
;	genAssign
;	AOP_STK for _wbox_vc_65536_142
;	AOP_STK for _wbox_llc_65536_142
	ld	a, -2 (ix)
	ld	-10 (ix), a
	ld	a, -1 (ix)
	ld	-9 (ix), a
;	genAssign
;	AOP_STK for _wbox_vc_65536_142
;	AOP_STK for _wbox_urc_65536_142
	ld	a, -2 (ix)
	ld	-8 (ix), a
	ld	a, -1 (ix)
	ld	-7 (ix), a
;	genAssign
;	AOP_STK for _wbox_vc_65536_142
;	AOP_STK for _wbox_ulc_65536_142
	ld	a, -2 (ix)
	ld	-6 (ix), a
	ld	a, -1 (ix)
	ld	-5 (ix), a
;curses/wbox.c:30: if (v == 0 && h == 0) {
;	genIfx
;	AOP_STK for _wbox_vc_65536_142
	ld	a, -1 (ix)
	or	a, -2 (ix)
	jr	NZ,00113$
; peephole 164 changed absolute to relative conditional jump.
;	genIfx
;	AOP_STK for _wbox_hc_65536_142
	ld	a, -3 (ix)
	or	a, -4 (ix)
	jr	NZ,00113$
; peephole 164 changed absolute to relative conditional jump.
;curses/wbox.c:31: ulc = ACS_ULCORNER;
;	genAssign
;	AOP_STK for _wbox_ulc_65536_142
;fetchPairLong
	ld	hl, (_ACS_ULCORNER)
	ld	-6 (ix), l
	ld	-5 (ix), h
;curses/wbox.c:32: urc = ACS_URCORNER;
;	genAssign
;	AOP_STK for _wbox_urc_65536_142
;fetchPairLong
	ld	hl, (_ACS_URCORNER)
	ld	-8 (ix), l
	ld	-7 (ix), h
;curses/wbox.c:33: llc = ACS_LLCORNER;
;	genAssign
;	AOP_STK for _wbox_llc_65536_142
;fetchPairLong
	ld	hl, (_ACS_LLCORNER)
	ld	-10 (ix), l
	ld	-9 (ix), h
;curses/wbox.c:34: lrc = ACS_LRCORNER;
;	genAssign
;	AOP_STK for _wbox_lrc_65536_142
;fetchPairLong
	ld	hl, (_ACS_LRCORNER)
	ld	-12 (ix), l
	ld	-11 (ix), h
;curses/wbox.c:35: hc = ACS_HLINE;
;	genAssign
;	AOP_STK for _wbox_hc_65536_142
;fetchPairLong
	ld	hl, (_ACS_HLINE)
	ld	-4 (ix), l
	ld	-3 (ix), h
;curses/wbox.c:36: vc = ACS_VLINE;
;	genAssign
;	AOP_STK for _wbox_vc_65536_142
;fetchPairLong
	ld	hl, (_ACS_VLINE)
	ld	-2 (ix), l
	ld	-1 (ix), h
;	genLabel
00113$:
;curses/wbox.c:38: for (i = xmin + 1; i <= xmax - 1; i++) {
;	genPlus
;	AOP_STK for 
;	AOP_STK for _wbox_sloc1_1_0
	ld	a, 8 (ix)
	add	a, #0x01
	ld	-18 (ix), a
	ld	a, 9 (ix)
	adc	a, #0x00
	ld	-17 (ix), a
;	genPlus
;	AOP_STK for _wbox_sloc0_1_0
;fetchPairLong
;fetchLitPair
	ld	hl, #0x001c
	add	hl, bc
	ld	-24 (ix), l
	ld	-23 (ix), h
;	genLeftShift
;	AOP_STK for 
;	AOP_STK for _wbox_sloc3_1_0
	ld	a, 6 (ix)
	ld	-26 (ix), a
	ld	a, 7 (ix)
	ld	-25 (ix), a
	sla	-26 (ix)
	rl	-25 (ix)
;	genPlus
;	AOP_STK for _wbox_sloc4_1_0
;fetchPairLong
;fetchLitPair
	ld	hl, #0x000e
	add	hl, bc
	ld	-30 (ix), l
	ld	-29 (ix), h
;	genLeftShift
;	AOP_STK for 
;	AOP_STK for _wbox_sloc5_1_0
	ld	a, 10 (ix)
	ld	-20 (ix), a
	ld	a, 11 (ix)
	ld	-19 (ix), a
	sla	-20 (ix)
	rl	-19 (ix)
;	genMinus
;	AOP_STK for 
;	AOP_STK for _wbox_sloc6_1_0
	ld	a, 12 (ix)
	add	a, #0xff
	ld	-16 (ix), a
	ld	a, 13 (ix)
	adc	a, #0xff
	ld	-15 (ix), a
;	genLabel
00122$:
;	genCmpGt
;	AOP_STK for _wbox_sloc1_1_0
;	AOP_STK for _wbox_sloc6_1_0
	ld	a, -16 (ix)
	sub	a, -18 (ix)
	ld	a, -15 (ix)
	sbc	a, -17 (ix)
	jp	PO, 00239$
	xor	a, #0x80
00239$:
	jp	M, 00115$
;curses/wbox.c:39: *(*(win->_line + ymin) + i) = hc | win->_attrs;
;	genPointerGet
;	AOP_STK for _wbox_sloc0_1_0
;	AOP_STK for _wbox_sloc7_1_0
;fetchPairLong
	ld	l, -24 (ix)
	ld	h, -23 (ix)
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-14 (ix), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-13 (ix), a
;	genPlus
;	AOP_STK for _wbox_sloc7_1_0
;	AOP_STK for _wbox_sloc3_1_0
	ld	a, -14 (ix)
	add	a, -26 (ix)
	ld	-14 (ix), a
	ld	a, -13 (ix)
	adc	a, -25 (ix)
	ld	-13 (ix), a
;	genPointerGet
;	AOP_STK for _wbox_sloc7_1_0
;fetchPairLong
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
;	genLeftShift
;	AOP_STK for _wbox_sloc1_1_0
;fetchPairLong
	ld	c, -18 (ix)
	ld	b, -17 (ix)
	sla	c
	rl	b
;	genPlus
	add	hl, bc
	push	hl
	pop	iy
;	genPointerGet
;	AOP_STK for _wbox_sloc4_1_0
;fetchPairLong
	ld	l, -30 (ix)
	ld	h, -29 (ix)
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;	genCast
;	(registers are the same)
;	genOr
;	AOP_STK for _wbox_hc_65536_142
	ld	a, e
	or	a, -4 (ix)
	ld	e, a
	ld	a, d
	or	a, -3 (ix)
	ld	d, a
;	genAssign (pointer)
;	isBitvar = 0
	ld	0 (iy), e
	ld	1 (iy), d
;curses/wbox.c:40: *(*(win->_line + ymax) + i) = hc | win->_attrs;
;	genPointerGet
;	AOP_STK for _wbox_sloc0_1_0
;fetchPairLong
	ld	l, -24 (ix)
	ld	h, -23 (ix)
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;	genPlus
;	AOP_STK for _wbox_sloc5_1_0
;fetchPairLong
	ld	l, -20 (ix)
	ld	h, -19 (ix)
	add	hl, de
;	genPointerGet
;fetchPairLong
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
;	genPlus
	add	hl, bc
	ex	de, hl
;	genPointerGet
;	AOP_STK for _wbox_sloc4_1_0
;fetchPairLong
	ld	l, -30 (ix)
	ld	h, -29 (ix)
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genCast
;	(registers are the same)
;	genOr
;	AOP_STK for _wbox_hc_65536_142
	ld	a, c
	or	a, -4 (ix)
	ld	c, a
	ld	a, b
	or	a, -3 (ix)
	ld	b, a
;	genAssign (pointer)
;	isBitvar = 0
;fetchPairLong
	ld	a, c
	ld	(de), a
	inc	de
	ld	a, b
	ld	(de), a
;curses/wbox.c:38: for (i = xmin + 1; i <= xmax - 1; i++) {
;	genPlus
;	AOP_STK for _wbox_sloc1_1_0
	inc	-18 (ix)
	jp	NZ,00122$
; peephole 84 jumped to 00122$ directly instead of via 00242$.
	inc	-17 (ix)
; peephole 158 removed unused label 00242$.
;	genGoto
	jp	00122$
;	genLabel
00115$:
;curses/wbox.c:43: for (i = ymin + 1; i <= ymax - 1; i++) {
;	genPlus
;	AOP_STK for 
;	AOP_STK for _wbox_sloc7_1_0
	ld	a, 6 (ix)
	add	a, #0x01
	ld	-14 (ix), a
	ld	a, 7 (ix)
	adc	a, #0x00
	ld	-13 (ix), a
;	genLeftShift
;	AOP_STK for 
;	AOP_STK for _wbox_sloc6_1_0
	ld	a, 8 (ix)
	ld	-16 (ix), a
	ld	a, 9 (ix)
	ld	-15 (ix), a
	sla	-16 (ix)
	rl	-15 (ix)
;	genLeftShift
;	AOP_STK for 
;fetchPairLong
	ld	e, 12 (ix)
	ld	d, 13 (ix)
	sla	e
	rl	d
;	genMinus
;	AOP_STK for 
;	AOP_STK for _wbox_sloc1_1_0
	ld	a, 10 (ix)
	add	a, #0xff
	ld	-18 (ix), a
	ld	a, 11 (ix)
	adc	a, #0xff
	ld	-17 (ix), a
;	genLabel
00125$:
;curses/wbox.c:39: *(*(win->_line + ymin) + i) = hc | win->_attrs;
;	genPointerGet
;	AOP_STK for _wbox_sloc0_1_0
;	AOP_STK for _wbox_sloc8_1_0
;fetchPairLong
	ld	l, -24 (ix)
	ld	h, -23 (ix)
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-22 (ix), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-21 (ix), a
;	genPointerGet
;	AOP_STK for _wbox_sloc4_1_0
;fetchPairLong
	ld	l, -30 (ix)
	ld	h, -29 (ix)
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;curses/wbox.c:44: *(*(win->_line + i) + xmin) = vc | win->_attrs;
;	genCast
;	AOP_STK for _wbox_sloc9_1_0
	inc	sp
	inc	sp
	push	bc
;curses/wbox.c:43: for (i = ymin + 1; i <= ymax - 1; i++) {
;	genCmpGt
;	AOP_STK for _wbox_sloc7_1_0
;	AOP_STK for _wbox_sloc1_1_0
	ld	a, -18 (ix)
	sub	a, -14 (ix)
	ld	a, -17 (ix)
	sbc	a, -13 (ix)
	jp	PO, 00247$
	xor	a, #0x80
00247$:
	jp	M, 00116$
;curses/wbox.c:44: *(*(win->_line + i) + xmin) = vc | win->_attrs;
;	genLeftShift
;	AOP_STK for _wbox_sloc7_1_0
;fetchPairLong
	ld	c, -14 (ix)
	ld	b, -13 (ix)
	sla	c
	rl	b
;	genPlus
;	AOP_STK for _wbox_sloc8_1_0
;fetchPairLong
	ld	l, -22 (ix)
	ld	h, -21 (ix)
	add	hl, bc
;	genPointerGet
;fetchPairLong
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
;	genPlus
;	AOP_STK for _wbox_sloc6_1_0
;fetchPairLong
	push	hl
	pop	iy
	push	bc
;fetchPairLong
	ld	c, -16 (ix)
	ld	b, -15 (ix)
	add	iy, bc
	pop	bc
;	genOr
;	AOP_STK for _wbox_vc_65536_142
;	AOP_STK for _wbox_sloc9_1_0
	ld	a, -2 (ix)
	or	a, -32 (ix)
	ld	l, a
	ld	a, -1 (ix)
	or	a, -31 (ix)
	ld	h, a
;	genAssign (pointer)
;	isBitvar = 0
	ld	0 (iy), l
	ld	1 (iy), h
;curses/wbox.c:45: *(*(win->_line + i) + xmax) = vc | win->_attrs;
;	genPointerGet
;	AOP_STK for _wbox_sloc0_1_0
;fetchPairLong
	ld	l, -24 (ix)
	ld	h, -23 (ix)
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
;	genPlus
	add	hl, bc
;	genPointerGet
;fetchPairLong
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
;	genPlus
	add	hl, de
	push	hl
	pop	iy
;	genPointerGet
;	AOP_STK for _wbox_sloc4_1_0
;fetchPairLong
	ld	l, -30 (ix)
	ld	h, -29 (ix)
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genCast
;	(registers are the same)
;	genOr
;	AOP_STK for _wbox_vc_65536_142
	ld	a, c
	or	a, -2 (ix)
	ld	c, a
	ld	a, b
	or	a, -1 (ix)
	ld	b, a
;	genAssign (pointer)
;	isBitvar = 0
	ld	0 (iy), c
	ld	1 (iy), b
;curses/wbox.c:43: for (i = ymin + 1; i <= ymax - 1; i++) {
;	genPlus
;	AOP_STK for _wbox_sloc7_1_0
	inc	-14 (ix)
	jp	NZ,00125$
; peephole 84 jumped to 00125$ directly instead of via 00250$.
	inc	-13 (ix)
; peephole 158 removed unused label 00250$.
;	genGoto
	jp	00125$
;	genLabel
00116$:
;curses/wbox.c:47: *(*(win->_line + ymin) + xmin) = ulc | win->_attrs;
;	genPlus
;	AOP_STK for _wbox_sloc8_1_0
;	AOP_STK for _wbox_sloc3_1_0
	ld	a, -22 (ix)
	add	a, -26 (ix)
	ld	l, a
	ld	a, -21 (ix)
	adc	a, -25 (ix)
	ld	h, a
;	genPointerGet
;fetchPairLong
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genPlus
;	AOP_STK for _wbox_sloc6_1_0
;fetchPairLong
	ld	l, -16 (ix)
	ld	h, -15 (ix)
	add	hl, bc
;	genOr
;	AOP_STK for _wbox_ulc_65536_142
;	AOP_STK for _wbox_sloc9_1_0
	ld	a, -6 (ix)
	or	a, -32 (ix)
	ld	c, a
	ld	a, -5 (ix)
	or	a, -31 (ix)
	ld	b, a
;	genAssign (pointer)
;	isBitvar = 0
;fetchPairLong
	ld	(hl), c
	inc	hl
	ld	(hl), b
;curses/wbox.c:48: *(*(win->_line + ymin) + xmax) = urc | win->_attrs;
;	genPointerGet
;	AOP_STK for _wbox_sloc0_1_0
;fetchPairLong
	ld	l, -24 (ix)
	ld	h, -23 (ix)
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genPlus
;	AOP_STK for _wbox_sloc3_1_0
;fetchPairLong
	ld	l, -26 (ix)
	ld	h, -25 (ix)
	add	hl, bc
;	genPointerGet
;fetchPairLong
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
;	genPlus
	add	hl, de
	push	hl
	pop	iy
;	genPointerGet
;	AOP_STK for _wbox_sloc4_1_0
;fetchPairLong
	ld	l, -30 (ix)
	ld	h, -29 (ix)
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genCast
;	(registers are the same)
;	genOr
;	AOP_STK for _wbox_urc_65536_142
	ld	a, c
	or	a, -8 (ix)
	ld	c, a
	ld	a, b
	or	a, -7 (ix)
	ld	b, a
;	genAssign (pointer)
;	isBitvar = 0
	ld	0 (iy), c
	ld	1 (iy), b
;curses/wbox.c:49: *(*(win->_line + ymax) + xmin) = llc | win->_attrs;
;	genPointerGet
;	AOP_STK for _wbox_sloc0_1_0
;fetchPairLong
	ld	l, -24 (ix)
	ld	h, -23 (ix)
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genPlus
;	AOP_STK for _wbox_sloc5_1_0
;fetchPairLong
	ld	l, -20 (ix)
	ld	h, -19 (ix)
	add	hl, bc
;	genPointerGet
;fetchPairLong
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genPlus
;	AOP_STK for _wbox_sloc6_1_0
;fetchPairLong
	push	hl
	ld	l, -16 (ix)
	ld	h, -15 (ix)
	push	hl
	pop	iy
	pop	hl
;fetchPairLong
	add	iy, bc
;	genPointerGet
;	AOP_STK for _wbox_sloc4_1_0
;fetchPairLong
	ld	l, -30 (ix)
	ld	h, -29 (ix)
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genCast
;	(registers are the same)
;	genOr
;	AOP_STK for _wbox_llc_65536_142
	ld	a, c
	or	a, -10 (ix)
	ld	c, a
	ld	a, b
	or	a, -9 (ix)
	ld	b, a
;	genAssign (pointer)
;	isBitvar = 0
	ld	0 (iy), c
	ld	1 (iy), b
;curses/wbox.c:50: *(*(win->_line + ymax) + xmax) = lrc | win->_attrs;
;	genPointerGet
;	AOP_STK for _wbox_sloc0_1_0
;fetchPairLong
	ld	l, -24 (ix)
	ld	h, -23 (ix)
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genPlus
;	AOP_STK for _wbox_sloc5_1_0
;fetchPairLong
	ld	l, -20 (ix)
	ld	h, -19 (ix)
	add	hl, bc
;	genPointerGet
;fetchPairLong
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
;	genPlus
	add	hl, de
	ex	de, hl
;	genPointerGet
;	AOP_STK for _wbox_sloc4_1_0
;fetchPairLong
	ld	l, -30 (ix)
	ld	h, -29 (ix)
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genCast
;	(registers are the same)
;	genOr
;	AOP_STK for _wbox_lrc_65536_142
	ld	a, c
	or	a, -12 (ix)
	ld	c, a
	ld	a, b
	or	a, -11 (ix)
	ld	b, a
;	genAssign (pointer)
;	isBitvar = 0
;fetchPairLong
	ld	a, c
	ld	(de), a
	inc	de
	ld	a, b
	ld	(de), a
;curses/wbox.c:52: for (i = ymin; i <= ymax; i++) {
;	genAssign
;	AOP_STK for 
;fetchPairLong
	ld	c, 6 (ix)
	ld	b, 7 (ix)
;	genAssign
;	AOP_STK for _wbox_sloc2_1_0
;	AOP_STK for _wbox_sloc9_1_0
	ld	a, -28 (ix)
	ld	-32 (ix), a
	ld	a, -27 (ix)
	ld	-31 (ix), a
;	genPlus
;	AOP_STK for _wbox_sloc2_1_0
;	AOP_STK for _wbox_sloc8_1_0
	ld	a, -28 (ix)
	add	a, #0x20
	ld	-22 (ix), a
	ld	a, -27 (ix)
	adc	a, #0x00
	ld	-21 (ix), a
;	genLabel
00128$:
;	genCmpGt
;	AOP_STK for 
	ld	a, 10 (ix)
	sub	a, c
	ld	a, 11 (ix)
	sbc	a, b
	jp	PO, 00251$
	xor	a, #0x80
00251$:
	jp	M, 00120$
;curses/wbox.c:53: if (win->_minchng[i] == _NO_CHANGE) {
;	genPointerGet
;	AOP_STK for _wbox_sloc9_1_0
;fetchPairLong
	pop	hl
	push	hl
	ld	de, #0x001e
	add	hl, de
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;	genLeftShift
;	AOP_STK for _wbox_sloc7_1_0
	ld	-14 (ix), c
	ld	-13 (ix), b
	sla	-14 (ix)
	rl	-13 (ix)
;	genPlus
;	AOP_STK for _wbox_sloc7_1_0
;fetchPairLong
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	add	hl, de
;	genPointerGet
	push	hl
;fetchPairLong
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
	pop	hl
;	genCmpEq
	ld	a, e
	inc	a
	jr	NZ,00118$
; peephole 164 changed absolute to relative conditional jump.
; peephole 84 jumped to 00118$ directly instead of via 00254$.
	ld	a, d
	inc	a
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00254$.
	jr	NZ,00118$
; peephole 164 changed absolute to relative conditional jump.
; peephole 82 removed jp by using inverse jump logic
; peephole 158 removed unused label 00255$.
;curses/wbox.c:54: win->_minchng[i] = xmin;
;	genAssign (pointer)
;	AOP_STK for 
;	isBitvar = 0
;fetchPairLong
	ld	a, 8 (ix)
	ld	(hl), a
	inc	hl
	ld	a, 9 (ix)
	ld	(hl), a
;curses/wbox.c:55: win->_maxchng[i] = xmax;
;	genPointerGet
;	AOP_STK for _wbox_sloc8_1_0
;fetchPairLong
	ld	l, -22 (ix)
	ld	h, -21 (ix)
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;	genPlus
;	AOP_STK for _wbox_sloc7_1_0
;fetchPairLong
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	add	hl, de
;	genAssign (pointer)
;	AOP_STK for 
;	isBitvar = 0
;fetchPairLong
	ld	a, 12 (ix)
	ld	(hl), a
	inc	hl
	ld	a, 13 (ix)
	ld	(hl), a
;	genGoto
	jr	00129$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00118$:
;curses/wbox.c:57: win->_minchng[i] = min(win->_minchng[i], xmin);
;	genAssign
;	(registers are the same)
;	genCmpLt
;	AOP_STK for 
	ld	a, e
	sub	a, 8 (ix)
	ld	a, d
	sbc	a, 9 (ix)
	jp	PO, 00256$
	xor	a, #0x80
00256$:
	jp	P, 00132$
;	genAssign
;	(registers are the same)
;	genGoto
	jr	00133$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00132$:
;	genAssign
;	AOP_STK for 
;fetchPairLong
	ld	e, 8 (ix)
	ld	d, 9 (ix)
;	genLabel
00133$:
;	genAssign (pointer)
;	isBitvar = 0
;fetchPairLong
	ld	(hl), e
	inc	hl
	ld	(hl), d
;curses/wbox.c:58: win->_maxchng[i] = max(win->_maxchng[i], xmax);
;	genPointerGet
;	AOP_STK for _wbox_sloc8_1_0
;fetchPairLong
	ld	l, -22 (ix)
	ld	h, -21 (ix)
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;	genPlus
;	AOP_STK for _wbox_sloc7_1_0
	ld	a, -14 (ix)
	add	a, e
	ld	-14 (ix), a
	ld	a, -13 (ix)
	adc	a, d
	ld	-13 (ix), a
;	genPointerGet
;	AOP_STK for _wbox_sloc7_1_0
;fetchPairLong
	ld	l, -14 (ix)
	ld	h, -13 (ix)
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;	genCmpGt
;	AOP_STK for 
	ld	a, 12 (ix)
	sub	a, e
	ld	a, 13 (ix)
	sbc	a, d
	jp	PO, 00257$
	xor	a, #0x80
00257$:
	jp	P, 00134$
;	genAssign
;	(registers are the same)
;	genGoto
	jr	00135$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00134$:
;	genAssign
;	AOP_STK for 
;fetchPairLong
	ld	e, 12 (ix)
	ld	d, 13 (ix)
;	genLabel
00135$:
;	genAssign (pointer)
;	AOP_STK for _wbox_sloc7_1_0
;	isBitvar = 0
;fetchPairLong
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
;	genLabel
00129$:
;curses/wbox.c:52: for (i = ymin; i <= ymax; i++) {
;	genPlus
	inc	bc
;	genGoto
	jp	00128$
;	genLabel
00120$:
;curses/wbox.c:61: return(OK);
;	genRet
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0000
;	genLabel
00130$:
;curses/wbox.c:62: }
;	genEndFunction
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
