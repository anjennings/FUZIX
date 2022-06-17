;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module mvcursor
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _poscur
	.globl _mvcur
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
;curses/mvcursor.c:8: int mvcur(int oldx, int oldy, int newy, int newx)
;	genLabel
;	genFunction
;	---------------------------------
; Function mvcur
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_mvcur::
	call	___sdcc_enter_ix
;curses/mvcursor.c:10: if ((newy >= LINES) || (newx >= COLS) || (newy < 0) || (newx < 0))
;	genCmpLt
;	AOP_STK for 
;	Shift into pair
;fetchLitPair
	ld	hl, #_LINES
	ld	a, 8 (ix)
	sub	a, (hl)
	ld	a, 9 (ix)
	inc	hl
	sbc	a, (hl)
	jp	PO, 00123$
	xor	a, #0x80
00123$:
	jp	P, 00101$
;	genCmpLt
;	AOP_STK for 
;	Shift into pair
;fetchLitPair
	ld	hl, #_COLS
	ld	a, 10 (ix)
	sub	a, (hl)
	ld	a, 11 (ix)
	inc	hl
	sbc	a, (hl)
	jp	PO, 00124$
	xor	a, #0x80
00124$:
	jp	P, 00101$
;	genCmpLt
;	AOP_STK for 
	bit	7, 9 (ix)
	jr	NZ,00101$
; peephole 164 changed absolute to relative conditional jump.
;	genCmpLt
;	AOP_STK for 
	bit	7, 11 (ix)
	jr	Z,00102$
; peephole 163 changed absolute to relative conditional jump.
;	genLabel
00101$:
;curses/mvcursor.c:11: return(ERR);
;	genRet
;fetchPairLong
;fetchLitPair
	ld	hl, #0xffff
	jr	00106$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00102$:
;curses/mvcursor.c:12: poscur(newy, newx);
;	genIpush
;	AOP_STK for 
;fetchPairLong
	ld	l, 10 (ix)
	ld	h, 11 (ix)
	push	hl
;	genIpush
;	AOP_STK for 
;fetchPairLong
	ld	l, 8 (ix)
	ld	h, 9 (ix)
	push	hl
;	genCall
	call	_poscur
	pop	af
	pop	af
;curses/mvcursor.c:13: _cursvar.cursrow = newy;
;	genAssign (pointer)
;	AOP_STK for 
;	isBitvar = 0
;fetchPairLong
;fetchLitPair
	ld	hl, #(__cursvar + 0x0002)
	ld	a, 8 (ix)
	ld	(hl), a
	inc	hl
	ld	a, 9 (ix)
	ld	(hl), a
;curses/mvcursor.c:14: _cursvar.curscol = newx;
;	genAssign (pointer)
;	AOP_STK for 
;	isBitvar = 0
;fetchPairLong
;fetchLitPair
	ld	hl, #(__cursvar + 0x0004)
	ld	a, 10 (ix)
	ld	(hl), a
	inc	hl
	ld	a, 11 (ix)
	ld	(hl), a
;curses/mvcursor.c:15: return(OK);
;	genRet
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0000
;	genLabel
00106$:
;curses/mvcursor.c:16: }
;	genEndFunction
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
