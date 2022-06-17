;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module wclrtoeol
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _wclrtoeol
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
;curses/wclrtoeol.c:9: int wclrtoeol(WINDOW *win)
;	genLabel
;	genFunction
;	---------------------------------
; Function wclrtoeol
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 18 bytes.
_wclrtoeol::
	call	___sdcc_enter_ix
	ld	hl, #-18
	add	hl, sp
	ld	sp, hl
;curses/wclrtoeol.c:13: y = win->_cury;
;	genAssign
;	AOP_STK for 
;	AOP_STK for _wclrtoeol_sloc0_1_0
	ld	a, 4 (ix)
	ld	-16 (ix), a
	ld	a, 5 (ix)
	ld	-15 (ix), a
;	genPointerGet
;	AOP_STK for _wclrtoeol_sloc0_1_0
;fetchPairLong
	ld	l, -16 (ix)
	ld	h, -15 (ix)
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;curses/wclrtoeol.c:14: x = win->_curx;
;	genAssign
;	AOP_STK for _wclrtoeol_sloc0_1_0
;fetchPairLong
	pop	bc
	pop	hl
	push	hl
	push	bc
;	genPointerGet
;	AOP_STK for _wclrtoeol_x_65536_142
;fetchPairLong
	inc	hl
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-8 (ix), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-7 (ix), a
;curses/wclrtoeol.c:15: blank = ' ' | (win->_attrs & ATR_MSK);
;	genAssign
;	AOP_STK for _wclrtoeol_sloc0_1_0
;fetchPairLong
	pop	bc
	pop	hl
	push	hl
	push	bc
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
;	genOr
;	AOP_STK for _wclrtoeol_blank_65536_142
; peephole 9 loaded a from #0x00 directly instead of going through c.
	ld	a, #0x00
	or	a, #0x20
	ld	-10 (ix), a
	ld	-9 (ix), b
;curses/wclrtoeol.c:17: end = &win->_line[y][win->_maxx];
;	genPlus
;	AOP_STK for _wclrtoeol_sloc0_1_0
;	AOP_STK for _wclrtoeol_sloc1_1_0
	ld	a, -16 (ix)
	add	a, #0x1c
	ld	-12 (ix), a
	ld	a, -15 (ix)
	adc	a, #0x00
	ld	-11 (ix), a
;	genPointerGet
;	AOP_STK for _wclrtoeol_sloc1_1_0
;fetchPairLong
	ld	l, -12 (ix)
	ld	h, -11 (ix)
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genLeftShift
;	AOP_STK for _wclrtoeol_sloc2_1_0
	sla	e
	rl	d
;	genPlus
;	AOP_STK for _wclrtoeol_sloc2_1_0
;fetchPairLong
	ld	-14 (ix), e
	ld	-13 (ix), d
; peephole 11 loaded lh from ed directly instead of going through -14 (ix) -13 (ix).
; peephole 157 used ex to load de into hl.
	ex	de,hl
	add	hl, bc
;	genPointerGet
;fetchPairLong
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;	genAssign
;	AOP_STK for _wclrtoeol_sloc0_1_0
;fetchPairLong
	pop	bc
	pop	hl
	push	hl
	push	bc
;	genPointerGet
;fetchPairLong
	ld	bc, #0x0006
	add	hl, bc
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
	add	hl, de
;	genAssign
;	AOP_STK for _wclrtoeol_end_65536_142
	ld	-6 (ix), l
	ld	-5 (ix), h
;curses/wclrtoeol.c:18: minx = _NO_CHANGE;
;	genAssign
;fetchPairLong
;fetchLitPair
	ld	bc, #0xffff
;curses/wclrtoeol.c:19: maxx = &win->_line[y][x];
;	genLeftShift
;	AOP_STK for _wclrtoeol_x_65536_142
;fetchPairLong
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	add	hl, hl
;	genPlus
	add	hl, de
;	genAssign
;	AOP_STK for _wclrtoeol_maxx_65536_142
	ld	-2 (ix), l
	ld	-1 (ix), h
;curses/wclrtoeol.c:20: for (ptr = maxx; ptr <= end; ptr++) {
;	genAssign
;	AOP_STK for _wclrtoeol_maxx_65536_142
;	AOP_STK for _wclrtoeol_ptr_65536_142
	ld	a, -2 (ix)
	ld	-4 (ix), a
	ld	a, -1 (ix)
	ld	-3 (ix), a
;	genLabel
00114$:
;curses/wclrtoeol.c:23: if (minx == _NO_CHANGE) minx = ptr - win->_line[y];
;	genCmpEq
	ld	a, c
	inc	a
	jr	NZ,00156$
; peephole 164 changed absolute to relative conditional jump.
	ld	a, b
	inc	a
; peephole 164 changed absolute to relative conditional jump.
; peephole 162 changed absolute to relative unconditional jump.
	jr	NZ, 00156$
	ld	a, #0x01
	.db	#0x20
; peephole 169xnz used jr NZ opcode to jump over 1-byte instruction.
00156$:
	xor	a, a
00157$:
	ld	e, a
;curses/wclrtoeol.c:20: for (ptr = maxx; ptr <= end; ptr++) {
;	genCmpGt
;	AOP_STK for _wclrtoeol_ptr_65536_142
;	AOP_STK for _wclrtoeol_end_65536_142
	ld	a, -6 (ix)
	sub	a, -4 (ix)
	ld	a, -5 (ix)
	sbc	a, -3 (ix)
	jr	C,00105$
; peephole 165 changed absolute to relative conditional jump.
;curses/wclrtoeol.c:21: if (*ptr != blank) {
;	genPointerGet
;	AOP_STK for _wclrtoeol_ptr_65536_142
;	AOP_STK for _wclrtoeol_sloc3_1_0
;fetchPairLong
	ld	l, -4 (ix)
	ld	h, -3 (ix)
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-18 (ix), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-17 (ix), a
;	genCmpEq
;	AOP_STK for _wclrtoeol_blank_65536_142
;	AOP_STK for _wclrtoeol_sloc3_1_0
	ld	a, -10 (ix)
	sub	a, -18 (ix)
	jr	NZ,00158$
; peephole 164 changed absolute to relative conditional jump.
	ld	a, -9 (ix)
	sub	a, -17 (ix)
	jr	Z,00115$
; peephole 163 changed absolute to relative conditional jump.
; peephole 81 removed jp by using inverse jump logic
00158$:
;curses/wclrtoeol.c:22: maxx = ptr;
;	genAssign
;	AOP_STK for _wclrtoeol_ptr_65536_142
;	AOP_STK for _wclrtoeol_maxx_65536_142
	ld	a, -4 (ix)
	ld	-2 (ix), a
	ld	a, -3 (ix)
	ld	-1 (ix), a
;curses/wclrtoeol.c:23: if (minx == _NO_CHANGE) minx = ptr - win->_line[y];
;	genIfx
	ld	a, e
	or	a, a
	jr	Z,00102$
; peephole 163 changed absolute to relative conditional jump.
;	genPointerGet
;	AOP_STK for _wclrtoeol_sloc1_1_0
;fetchPairLong
	ld	l, -12 (ix)
	ld	h, -11 (ix)
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genPlus
;	AOP_STK for _wclrtoeol_sloc2_1_0
;fetchPairLong
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	add	hl, bc
;	genPointerGet
;fetchPairLong
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genMinus
;	AOP_STK for _wclrtoeol_ptr_65536_142
	ld	a, -4 (ix)
	sub	a, c
	ld	c, a
	ld	a, -3 (ix)
	sbc	a, b
	ld	b, a
;	genRightShift
;fetchPairLong
	sra	b
	rr	c
;	genLabel
00102$:
;curses/wclrtoeol.c:24: *ptr = blank;
;	genAssign (pointer)
;	AOP_STK for _wclrtoeol_ptr_65536_142
;	AOP_STK for _wclrtoeol_blank_65536_142
;	isBitvar = 0
;fetchPairLong
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	a, -10 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -9 (ix)
	ld	(hl), a
;	genLabel
00115$:
;curses/wclrtoeol.c:20: for (ptr = maxx; ptr <= end; ptr++) {
;	genPlus
;	AOP_STK for _wclrtoeol_ptr_65536_142
	ld	a, -4 (ix)
	add	a, #0x02
	ld	-4 (ix), a
	jp	NC,00114$
; peephole 84 jumped to 00114$ directly instead of via 00159$.
	inc	-3 (ix)
; peephole 158 removed unused label 00159$.
;	genGoto
	jp	00114$
;	genLabel
00105$:
;curses/wclrtoeol.c:28: if (minx != _NO_CHANGE) {
;	genIfx
	ld	a, e
	or	a, a
	jp	NZ, 00112$
;curses/wclrtoeol.c:29: if (win->_minchng[y] > minx || win->_minchng[y] == _NO_CHANGE)
;	genAssign
;	AOP_STK for _wclrtoeol_sloc0_1_0
;fetchPairLong
	pop	de
	pop	hl
	push	hl
	push	de
;	genPointerGet
;fetchPairLong
	ld	de, #0x001e
	add	hl, de
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;	genPlus
;	AOP_STK for _wclrtoeol_sloc2_1_0
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
;	genCmpGt
	ld	a, c
	sub	a, e
	ld	a, b
	sbc	a, d
	jp	PO, 00160$
	xor	a, #0x80
00160$:
	jp	M, 00106$
;	genCmpEq
	inc	e
	jr	NZ,00107$
; peephole 164 changed absolute to relative conditional jump.
; peephole 84 jumped to 00107$ directly instead of via 00161$.
	inc	d
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00161$.
	jr	NZ,00107$
; peephole 164 changed absolute to relative conditional jump.
; peephole 82 removed jp by using inverse jump logic
; peephole 158 removed unused label 00162$.
;	genLabel
00106$:
;curses/wclrtoeol.c:30: win->_minchng[y] = minx;
;	genAssign (pointer)
;	isBitvar = 0
;fetchPairLong
	ld	(hl), c
	inc	hl
	ld	(hl), b
;	genLabel
00107$:
;curses/wclrtoeol.c:31: if (win->_maxchng[y] < maxx - win->_line[y])
;	genAssign
;	AOP_STK for _wclrtoeol_sloc0_1_0
;fetchPairLong
	pop	bc
	pop	hl
	push	hl
	push	bc
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
;	AOP_STK for _wclrtoeol_sloc2_1_0
;fetchPairLong
	push	hl
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	push	hl
	pop	iy
	pop	hl
;fetchPairLong
	add	iy, bc
;	genPointerGet
	ld	c, 0 (iy)
	ld	b, 1 (iy)
;	genPointerGet
;	AOP_STK for _wclrtoeol_sloc1_1_0
;fetchPairLong
	ld	l, -12 (ix)
	ld	h, -11 (ix)
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;	genPlus
;	AOP_STK for _wclrtoeol_sloc2_1_0
;fetchPairLong
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	add	hl, de
;	genPointerGet
;fetchPairLong
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;	genMinus
;	AOP_STK for _wclrtoeol_maxx_65536_142
	ld	a, -2 (ix)
	sub	a, e
	ld	e, a
	ld	a, -1 (ix)
	sbc	a, d
	ld	d, a
;	genRightShift
;fetchPairLong
	sra	d
	rr	e
;	genCmpLt
	ld	a, c
	sub	a, e
	ld	a, b
	sbc	a, d
	jp	PO, 00163$
	xor	a, #0x80
00163$:
	jp	P, 00112$
;curses/wclrtoeol.c:32: win->_maxchng[y] = maxx - win->_line[y];
;	genAssign (pointer)
;	isBitvar = 0
	ld	0 (iy), e
	ld	1 (iy), d
;	genLabel
00112$:
;curses/wclrtoeol.c:34: return(OK);
;	genRet
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0000
;	genLabel
; peephole 158 removed unused label 00116$.
;curses/wclrtoeol.c:35: }
;	genEndFunction
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
