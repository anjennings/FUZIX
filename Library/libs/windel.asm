;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module windel
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _free
	.globl _delwin
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
;curses/windel.c:28: void delwin(WINDOW *win)
;	genLabel
;	genFunction
;	---------------------------------
; Function delwin
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 6 bytes.
_delwin::
	call	___sdcc_enter_ix
	push	af
	push	af
	push	af
;curses/windel.c:32: if (!(win->_flags & _SUBWIN)) {	/* subwindow uses 'parent's' lines */
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
	ld	de, #0x000c
	add	hl, de
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;curses/windel.c:33: for (i = 0; i <= win->_maxy && win->_line[i]; i++)
;	genPlus
;	AOP_STK for _delwin_sloc0_1_0
;fetchPairLong
;fetchLitPair
	ld	hl, #0x001c
	add	hl, bc
	ex	(sp), hl
;curses/windel.c:32: if (!(win->_flags & _SUBWIN)) {	/* subwindow uses 'parent's' lines */
;	genAnd
	bit	0, e
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00131$.
	jr	NZ,00103$
; peephole 164 changed absolute to relative conditional jump.
; peephole 82 removed jp by using inverse jump logic
; peephole 158 removed unused label 00132$.
;curses/windel.c:33: for (i = 0; i <= win->_maxy && win->_line[i]; i++)
;	genAssign
;	AOP_STK for _delwin_sloc1_1_0
	ld	-2 (ix), c
	ld	-1 (ix), b
;	genAssign
;fetchPairLong
;fetchLitPair
	ld	de, #0x0000
;	genLabel
00106$:
;	genPointerGet
;	AOP_STK for _delwin_sloc1_1_0
;fetchPairLong
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	genCmpGt
; peephole 9 loaded a from a directly instead of going through l.
; peephole 0 removed redundant load from a into a.
	sub	a, e
	ld	a, h
	sbc	a, d
	jp	PO, 00133$
	xor	a, #0x80
00133$:
	jp	M, 00103$
;	genPointerGet
;	AOP_STK for _delwin_sloc0_1_0
;	AOP_STK for _delwin_sloc2_1_0
;fetchPairLong
	pop	hl
	push	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-4 (ix), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-3 (ix), a
;	genLeftShift
;fetchPairLong
	ld	l, e
	ld	h, d
	add	hl, hl
;	genPlus
;	AOP_STK for _delwin_sloc2_1_0
	ld	a, -4 (ix)
	add	a, l
	ld	l, a
	ld	a, -3 (ix)
	adc	a, h
	ld	h, a
;	genPointerGet
;fetchPairLong
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	genIfx
	ld	l,a
	or	a,h
; peephole 99 removed load by reordering or arguments.
	jr	Z,00103$
; peephole 163 changed absolute to relative conditional jump.
;curses/windel.c:34: free(win->_line[i]);
;	genAssign
;	(registers are the same)
;	genCast
;	(registers are the same)
;	genIpush
	push	bc
	push	de
	push	hl
;	genCall
	call	_free
	pop	af
	pop	de
	pop	bc
;curses/windel.c:33: for (i = 0; i <= win->_maxy && win->_line[i]; i++)
;	genPlus
	inc	de
;	genGoto
	jr	00106$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00103$:
;curses/windel.c:36: free(win->_minchng);
;	genAssign
;fetchPairLong
	ld	l, c
	ld	h, b
;	genPointerGet
;fetchPairLong
	ld	de, #0x001e
	add	hl, de
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;	genCast
;	(registers are the same)
;	genIpush
	push	bc
	push	de
;	genCall
	call	_free
	pop	af
;curses/windel.c:37: free(win->_maxchng);
;	genAssign
;	(registers are the same)
;	genPointerGet
;fetchPairLong
; peephole 32 popped hl directly instead of going through bc.
	pop	hl
	ld	de, #0x0020
	add	hl, de
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genCast
;	(registers are the same)
;	genIpush
	push	bc
;	genCall
	call	_free
	pop	af
;curses/windel.c:38: free(win->_line);
;	genPointerGet
;	AOP_STK for _delwin_sloc0_1_0
;fetchPairLong
	pop	hl
	push	hl
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genCast
;	(registers are the same)
;	genIpush
	push	bc
;	genCall
	call	_free
	pop	af
;curses/windel.c:39: free(win);
;	genCast
;	AOP_STK for 
;fetchPairLong
	ld	c, 4 (ix)
	ld	b, 5 (ix)
;	genIpush
	push	bc
;	genCall
	call	_free
;	genLabel
; peephole 158 removed unused label 00108$.
;curses/windel.c:40: }				/* delwin */
;	genEndFunction
; peephole 133 removed redundant pop af.
	ld	sp,ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
