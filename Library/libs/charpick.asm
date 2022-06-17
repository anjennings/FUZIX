;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module charpick
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _wmove
	.globl _winch
	.globl _mvinch
	.globl _mvwinch
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
;curses/charpick.c:9: int winch(WINDOW *win)
;	genLabel
;	genFunction
;	---------------------------------
; Function winch
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 0 bytes.
_winch::
	call	___sdcc_enter_ix
;curses/charpick.c:11: return((win->_line[win->_cury][win->_curx]) & 0xff);
;	genAssign
;	AOP_STK for 
;fetchPairLong
	ld	e, 4 (ix)
	ld	d, 5 (ix)
;	genAssign
;fetchPairLong
	ld	l, e
	ld	h, d
;	genPointerGet
;fetchPairLong
	ld	bc, #0x001c
	add	hl, bc
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genPointerGet
;fetchPairLong
	ld	l, e
	ld	h, d
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
;	genLeftShift
	add	hl, hl
;fetchPairLong
;	genPlus
	add	hl, bc
;	genPointerGet
;fetchPairLong
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genAssign
;	(registers are the same)
;	genPointerGet
;fetchPairLong
; peephole 157 used ex to load de into hl.
	ex	de,hl
	inc	hl
	inc	hl
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
;	genPointerGet
;fetchPairLong
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genAnd
	ld	h, #0x00
;	genRet
;fetchPairLong
	ld	l, c
;	genLabel
; peephole 158 removed unused label 00101$.
;curses/charpick.c:12: }				/* winch */
;	genEndFunction
	pop	ix
	ret
;curses/charpick.c:19: int mvinch(int y, int x)
;	genLabel
;	genFunction
;	---------------------------------
; Function mvinch
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 0 bytes.
_mvinch::
	call	___sdcc_enter_ix
;curses/charpick.c:21: if (wmove(stdscr, y, x) == ERR) return(ERR);
;	genIpush
;	AOP_STK for 
;fetchPairLong
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	push	hl
;	genIpush
;	AOP_STK for 
;fetchPairLong
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
;	genIpush
;fetchPairLong
	ld	hl, (_stdscr)
	push	hl
;	genCall
	call	_wmove
	pop	af
	pop	af
	pop	af
;	genCmpEq
	inc	l
	jr	NZ,00102$
; peephole 164 changed absolute to relative conditional jump.
; peephole 84 jumped to 00102$ directly instead of via 00110$.
	inc	h
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00110$.
	jr	NZ,00102$
; peephole 164 changed absolute to relative conditional jump.
; peephole 82 removed jp by using inverse jump logic
; peephole 158 removed unused label 00111$.
;	genRet
;fetchPairLong
;fetchLitPair
	ld	hl, #0xffff
	jr	00103$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00102$:
;curses/charpick.c:22: return((stdscr->_line[stdscr->_cury][stdscr->_curx]) & 0xff);
;	genAssign
;fetchPairLong
	ld	iy, (_stdscr)
;	genAssign
;fetchPairLong
	push	iy
	pop	hl
;	genPointerGet
;fetchPairLong
	ld	de, #0x001c
	add	hl, de
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genPointerGet
	ld	l, 0 (iy)
	ld	h, 1 (iy)
;	genLeftShift
	add	hl, hl
;fetchPairLong
;	genPlus
	add	hl, bc
;	genPointerGet
;fetchPairLong
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genAssign
;fetchPairLong
;	genPointerGet
	ld	l, 2 (iy)
	ld	h, 3 (iy)
;	genLeftShift
	add	hl, hl
;fetchPairLong
;	genPlus
	add	hl, bc
;	genPointerGet
;fetchPairLong
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genAnd
	ld	h, #0x00
;	genRet
;fetchPairLong
	ld	l, c
;	genLabel
00103$:
;curses/charpick.c:23: }
;	genEndFunction
	pop	ix
	ret
;curses/charpick.c:30: int mvwinch(WINDOW *win, int y, int x)
;	genLabel
;	genFunction
;	---------------------------------
; Function mvwinch
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 0 bytes.
_mvwinch::
	call	___sdcc_enter_ix
;curses/charpick.c:32: if (wmove(win, y, x) == ERR) return(ERR);
;	genIpush
;	AOP_STK for 
;fetchPairLong
	ld	l, 8 (ix)
	ld	h, 9 (ix)
	push	hl
;	genIpush
;	AOP_STK for 
;fetchPairLong
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	push	hl
;	genIpush
;	AOP_STK for 
;fetchPairLong
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
;	genCall
	call	_wmove
	pop	af
	pop	af
	pop	af
;	genCmpEq
	inc	l
	jr	NZ,00102$
; peephole 164 changed absolute to relative conditional jump.
; peephole 84 jumped to 00102$ directly instead of via 00110$.
	inc	h
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00110$.
	jr	NZ,00102$
; peephole 164 changed absolute to relative conditional jump.
; peephole 82 removed jp by using inverse jump logic
; peephole 158 removed unused label 00111$.
;	genRet
;fetchPairLong
;fetchLitPair
	ld	hl, #0xffff
	jr	00103$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00102$:
;curses/charpick.c:33: return((win->_line[win->_cury][win->_curx]) & 0xff);
;	genAssign
;	AOP_STK for 
;fetchPairLong
	ld	e, 4 (ix)
	ld	d, 5 (ix)
;	genAssign
;fetchPairLong
	ld	l, e
	ld	h, d
;	genPointerGet
;fetchPairLong
	ld	bc, #0x001c
	add	hl, bc
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genPointerGet
;fetchPairLong
	ld	l, e
	ld	h, d
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
;	genLeftShift
	add	hl, hl
;fetchPairLong
;	genPlus
	add	hl, bc
;	genPointerGet
;fetchPairLong
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genAssign
;	(registers are the same)
;	genPointerGet
;fetchPairLong
; peephole 157 used ex to load de into hl.
	ex	de,hl
	inc	hl
	inc	hl
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
;	genPointerGet
;fetchPairLong
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genAnd
	ld	h, #0x00
;	genRet
;fetchPairLong
	ld	l, c
;	genLabel
00103$:
;curses/charpick.c:34: }
;	genEndFunction
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
