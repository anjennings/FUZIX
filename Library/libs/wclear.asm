;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module wclear
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _werase
	.globl _wclear
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
;curses/wclear.c:9: void wclear(WINDOW *win)
;	genLabel
;	genFunction
;	---------------------------------
; Function wclear
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_wclear::
;curses/wclear.c:11: werase(win);
;	genIpush
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 2, size 2
;fetchPairLong
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
;	genCall
	call	_werase
	pop	af
;curses/wclear.c:12: win->_clear = TRUE;
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
	ld	hl, #0x0012
	add	hl, bc
;	genAssign (pointer)
;	isBitvar = 0
;fetchPairLong
	ld	(hl), #0x01
	inc	hl
	ld	(hl), #0x00
;	genLabel
; peephole 158 removed unused label 00101$.
;curses/wclear.c:13: }				/* wclear */
;	genEndFunction
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
