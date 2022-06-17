;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module wgetch
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _wrefresh
	.globl _wmove
	.globl _waddch
	.globl _fgetc
	.globl _wgetch
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
;curses/wgetch.c:5: int wgetch(WINDOW *win)
;	genLabel
;	genFunction
;	---------------------------------
; Function wgetch
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 4 bytes.
_wgetch::
	call	___sdcc_enter_ix
	push	af
	push	af
;curses/wgetch.c:9: if (_cursvar.echoit && !win->_scroll && (win->_flags & _FULLWIN)
;	genPointerGet
	ld	bc, (#(__cursvar + 0x000a) + 0)
;	genAssign
;	AOP_STK for 
;	AOP_STK for _wgetch_sloc0_1_0
	ld	a, 4 (ix)
	ld	-2 (ix), a
	ld	a, 5 (ix)
	ld	-1 (ix), a
;curses/wgetch.c:10: && win->_curx == win->_maxx - 1 && win->_cury == win->_maxy - 1)
;	genPlus
;	AOP_STK for _wgetch_sloc0_1_0
;	AOP_STK for _wgetch_sloc1_1_0
	ld	a, -2 (ix)
	add	a, #0x02
	ld	-4 (ix), a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	-3 (ix), a
;curses/wgetch.c:9: if (_cursvar.echoit && !win->_scroll && (win->_flags & _FULLWIN)
;	genIfx
	ld	a, b
	or	a, c
	jr	Z,00102$
; peephole 163 changed absolute to relative conditional jump.
;	genAssign
;	AOP_STK for _wgetch_sloc0_1_0
;fetchPairLong
	pop	bc
	pop	hl
	push	hl
	push	bc
;	genPointerGet
;fetchPairLong
	ld	de, #0x0016
	add	hl, de
;	_moveFrom_tpair_()
;	_moveFrom_tpair_()
;	genIfx
	ld	a, (hl)
	inc	hl
; peephole 99a removed load by reordering or arguments.
	or	a, (hl)
	jr	NZ,00102$
; peephole 164 changed absolute to relative conditional jump.
;	genAssign
;	AOP_STK for _wgetch_sloc0_1_0
;fetchPairLong
	pop	bc
	pop	hl
	push	hl
	push	bc
;	genPointerGet
;fetchPairLong
	ld	de, #0x000c
	add	hl, de
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
;	genAnd
	bit	2, c
	jr	Z,00102$
; peephole 163 changed absolute to relative conditional jump.
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00155$.
;curses/wgetch.c:10: && win->_curx == win->_maxx - 1 && win->_cury == win->_maxy - 1)
;	genPointerGet
;	AOP_STK for _wgetch_sloc1_1_0
;fetchPairLong
	pop	hl
	push	hl
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genAssign
;	AOP_STK for _wgetch_sloc0_1_0
;fetchPairLong
	pop	de
	pop	hl
	push	hl
	push	de
;	genPointerGet
;fetchPairLong
	ld	de, #0x0006
	add	hl, de
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;	genMinus
	dec	de
;	genCmpEq
	ld	a, c
	sub	a, e
	jr	NZ,00102$
; peephole 164 changed absolute to relative conditional jump.
; peephole 84 jumped to 00102$ directly instead of via 00156$.
	ld	a, b
	sub	a, d
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00156$.
	jr	NZ,00102$
; peephole 164 changed absolute to relative conditional jump.
; peephole 82 removed jp by using inverse jump logic
; peephole 158 removed unused label 00157$.
;	genPointerGet
;	AOP_STK for _wgetch_sloc0_1_0
;fetchPairLong
	ld	l, -2 (ix)
	ld	h, -1 (ix)
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genAssign
;	AOP_STK for _wgetch_sloc0_1_0
;fetchPairLong
	pop	de
	pop	hl
	push	hl
	push	de
;	genPointerGet
;fetchPairLong
	ld	de, #0x0004
	add	hl, de
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;	genMinus
	dec	de
;	genCmpEq
	ld	a, c
	sub	a, e
	jr	NZ,00102$
; peephole 164 changed absolute to relative conditional jump.
; peephole 84 jumped to 00102$ directly instead of via 00158$.
	ld	a, b
	sub	a, d
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00158$.
	jr	NZ,00102$
; peephole 164 changed absolute to relative conditional jump.
; peephole 82 removed jp by using inverse jump logic
; peephole 158 removed unused label 00159$.
;curses/wgetch.c:11: return ERR;
;	genRet
;fetchPairLong
;fetchLitPair
	ld	hl, #0xffff
	jp	00111$
;	genLabel
00102$:
;curses/wgetch.c:13: wrefresh(win);
;	genIpush
;	AOP_STK for 
;fetchPairLong
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
;	genCall
	call	_wrefresh
	pop	af
;curses/wgetch.c:14: clearerr(stdin);
;	genPointerGet
	ld	bc, (#(_stdin + 0x000c) + 0)
;	genAnd
	ld	a, b
	and	a, #0xfc
	ld	b, a
;	genAssign (pointer)
;	isBitvar = 0
	ld	((_stdin + 0x000c)), bc
;curses/wgetch.c:15: inp = getchar();
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #_stdin
	push	hl
;	genCall
	call	_fgetc
	pop	af
	ld	c, l
	ld	b, h
;	genAssign
;	(registers are the same)
;curses/wgetch.c:16: if (inp == EOF)
;	genCmpEq
	ld	a, c
	inc	a
	jr	NZ,00108$
; peephole 164 changed absolute to relative conditional jump.
; peephole 84 jumped to 00108$ directly instead of via 00160$.
	ld	a, b
	inc	a
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00160$.
	jr	NZ,00108$
; peephole 164 changed absolute to relative conditional jump.
; peephole 82 removed jp by using inverse jump logic
; peephole 158 removed unused label 00161$.
;curses/wgetch.c:17: return ERR;
;	genRet
;fetchPairLong
;fetchLitPair
	ld	hl, #0xffff
	jr	00111$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00108$:
;curses/wgetch.c:18: if (_cursvar.echoit) {
;	genPointerGet
	ld	de, (#(__cursvar + 0x000a) + 0)
;	genIfx
	ld	a, d
	or	a, e
	jr	Z,00110$
; peephole 163 changed absolute to relative conditional jump.
;curses/wgetch.c:19: mvwaddch(curscr, win->_cury + win->_begy,
;	genPointerGet
;	AOP_STK for _wgetch_sloc1_1_0
;fetchPairLong
	pop	hl
	push	hl
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;	genAssign
;	AOP_STK for _wgetch_sloc0_1_0
;fetchPairLong
	ld	l, -2 (ix)
	ld	h, -1 (ix)
;	genPointerGet
;fetchPairLong
	push	bc
	ld	bc, #0x000a
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
;	AOP_STK for _wgetch_sloc0_1_0
;fetchPairLong
	ld	l, -2 (ix)
	ld	h, -1 (ix)
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;	genAssign
;	AOP_STK for _wgetch_sloc0_1_0
;fetchPairLong
	ld	l, -2 (ix)
	ld	h, -1 (ix)
;	genPointerGet
;fetchPairLong
	push	bc
	ld	bc, #0x0008
	add	hl, bc
	pop	bc
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
;	genPlus
	add	hl, de
;	genIpush
	push	bc
	push	iy
;	genIpush
	push	hl
;	genIpush
;fetchPairLong
	ld	hl, (_curscr)
	push	hl
;	genCall
	call	_wmove
	pop	af
	pop	af
	pop	af
	pop	bc
;	genCmpEq
	inc	l
	jr	NZ,00162$
; peephole 164 changed absolute to relative conditional jump.
	inc	h
	jr	Z,00114$
; peephole 163 changed absolute to relative conditional jump.
; peephole 81 removed jp by using inverse jump logic
00162$:
;	genIpush
	push	bc
	push	bc
;	genIpush
;fetchPairLong
	ld	hl, (_curscr)
	push	hl
;	genCall
	call	_waddch
	pop	af
	pop	af
	pop	bc
;	genLabel
00114$:
;curses/wgetch.c:21: waddch(win, inp);
;	genIpush
	push	bc
	push	bc
;	genIpush
;	AOP_STK for _wgetch_sloc0_1_0
;fetchPairLong
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	push	hl
;	genCall
	call	_waddch
	pop	af
	pop	af
	pop	bc
;	genLabel
00110$:
;curses/wgetch.c:23: return inp;
;	genRet
;fetchPairLong
	ld	l, c
	ld	h, b
;	genLabel
00111$:
;curses/wgetch.c:24: }
;	genEndFunction
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
