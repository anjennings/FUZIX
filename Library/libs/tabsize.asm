;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module tabsize
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _wtabsize
	.globl _tabsize
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
;curses/tabsize.c:26: int wtabsize(WINDOW *win, int ts)
;	genLabel
;	genFunction
;	---------------------------------
; Function wtabsize
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_wtabsize::
;curses/tabsize.c:30: origval = win->_tabsize;
;	genAssign
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 2, size 2
;fetchPairLong
	pop	de
	pop	bc
	push	bc
	push	de
;	genPlus
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0010
	add	hl, bc
;	genPointerGet
	push	hl
;fetchPairLong
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
	pop	hl
;curses/tabsize.c:31: win->_tabsize = ts;
;	genAssign (pointer)
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 4, size 2
;	isBitvar = 0
;fetchPairLong
	ld	iy, #4
	add	iy, sp
	ld	a, 0 (iy)
	ld	(hl), a
	inc	hl
	ld	a, 1 (iy)
	ld	(hl), a
;curses/tabsize.c:32: return(origval);
;	genRet
;fetchPairLong
	ld	l, c
	ld	h, b
;	genLabel
; peephole 158 removed unused label 00101$.
;curses/tabsize.c:33: }				/* wtabsize */
;	genEndFunction
	ret
;curses/tabsize.c:40: int tabsize(int ts)
;	genLabel
;	genFunction
;	---------------------------------
; Function tabsize
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_tabsize::
;curses/tabsize.c:44: origval = stdscr->_tabsize;
;	genAssign
;fetchPairLong
	ld	hl, (_stdscr)
;	genPlus
;fetchPairLong
;fetchLitPair
	ld	bc, #0x0010
	add	hl, bc
;	genPointerGet
	push	hl
;fetchPairLong
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
	pop	hl
;curses/tabsize.c:45: stdscr->_tabsize = ts;
;	genAssign (pointer)
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 2, size 2
;	isBitvar = 0
;fetchPairLong
	ld	iy, #2
	add	iy, sp
	ld	a, 0 (iy)
	ld	(hl), a
	inc	hl
	ld	a, 1 (iy)
	ld	(hl), a
;curses/tabsize.c:46: return(origval);
;	genRet
;fetchPairLong
	ld	l, c
	ld	h, b
;	genLabel
; peephole 158 removed unused label 00101$.
;curses/tabsize.c:47: }				/* tabsize */
;	genEndFunction
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
