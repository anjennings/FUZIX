;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module wintouch
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _touchwin
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
;curses/wintouch.c:26: void touchwin(WINDOW *win)
;	genLabel
;	genFunction
;	---------------------------------
; Function touchwin
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 6 bytes.
_touchwin::
	call	___sdcc_enter_ix
	push	af
	push	af
	push	af
;curses/wintouch.c:32: maxy = win->_maxy;
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
;	AOP_STK for _touchwin_maxy_65536_142
	ld	a, 4 (iy)
	ld	-2 (ix), a
	ld	a, 5 (iy)
	ld	-1 (ix), a
;curses/wintouch.c:33: maxx = win->_maxx;
;	genAssign
;fetchPairLong
	push	bc
	pop	iy
;	genPointerGet
;	AOP_STK for _touchwin_maxx_65536_142
	ld	a, 6 (iy)
	ld	-4 (ix), a
	ld	a, 7 (iy)
	ld	-3 (ix), a
;curses/wintouch.c:35: for (y = 0; y <= maxy; y++) {
;	genAssign
;	AOP_STK for _touchwin_sloc0_1_0
	inc	sp
	inc	sp
	push	bc
;	genAssign
;fetchPairLong
	push	bc
	pop	iy
;	genAssign
;fetchPairLong
;fetchLitPair
	ld	de, #0x0000
;	genLabel
00103$:
;	genCmpGt
;	AOP_STK for _touchwin_maxy_65536_142
	ld	a, -2 (ix)
	sub	a, e
	ld	a, -1 (ix)
	sbc	a, d
	jp	PO, 00118$
	xor	a, #0x80
00118$:
	jp	M, 00105$
;curses/wintouch.c:36: win->_minchng[y] = 0;
;	genPointerGet
;	AOP_STK for _touchwin_sloc0_1_0
;fetchPairLong
	pop	hl
	push	hl
	ld	bc, #0x001e
	add	hl, bc
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
;	genLeftShift
;fetchPairLong
	ld	c, e
	ld	b, d
	sla	c
	rl	b
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
;curses/wintouch.c:37: win->_maxchng[y] = maxx;
;	genPointerGet
	ld	l, 32 (iy)
	ld	h, 33 (iy)
;	genPlus
	add	hl, bc
;	genAssign (pointer)
;	AOP_STK for _touchwin_maxx_65536_142
;	isBitvar = 0
;fetchPairLong
	ld	a, -4 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -3 (ix)
	ld	(hl), a
;curses/wintouch.c:35: for (y = 0; y <= maxy; y++) {
;	genPlus
	inc	de
;	genGoto
	jr	00103$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00105$:
;curses/wintouch.c:39: }				/* touchwin */
;	genEndFunction
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
