;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module curs_set
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _tputs
	.globl _outc
	.globl _curs_set
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
;curses/curs_set.c:7: void curs_set(int visibility)
;	genLabel
;	genFunction
;	---------------------------------
; Function curs_set
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_curs_set::
;curses/curs_set.c:9: switch (visibility) {
;	genCmpEq
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 2, size 2
	ld	iy, #2
	add	iy, sp
	ld	a, 0 (iy)
	or	a, a
	or	a, 1 (iy)
	jr	Z,00101$
; peephole 163 changed absolute to relative conditional jump.
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00151$.
;	genCmpEq
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 2, size 2
	ld	a, 0 (iy)
	dec	a
	or	a, 1 (iy)
	jr	Z,00104$
; peephole 163 changed absolute to relative conditional jump.
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00152$.
;	genCmpEq
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 2, size 2
	ld	a, 0 (iy)
	sub	a, #0x02
	or	a, 1 (iy)
	jr	Z,00107$
; peephole 163 changed absolute to relative conditional jump.
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00153$.
;	genGoto
	ret
; peephole 160 replaced jump by return.
;curses/curs_set.c:10: case 0:
;	genLabel
00101$:
;curses/curs_set.c:11: if (vi) tputs(vi, 1, outc);
;	genIfx
;fetchLitPair
	ld	iy, #_vi
	ld	a, 1 (iy)
;fetchLitPair
	or	a, 0 (iy)
	ret	Z
; peephole 161 replaced jump by return.
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #_outc
	push	hl
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0001
	push	hl
;	genIpush
;fetchPairLong
	ld	hl, (_vi)
	push	hl
;	genCall
	call	_tputs
	pop	af
	pop	af
	pop	af
;curses/curs_set.c:12: break;
;	genGoto
	ret
; peephole 160 replaced jump by return.
;curses/curs_set.c:13: case 1:
;	genLabel
00104$:
;curses/curs_set.c:14: if (ve) tputs(ve, 1, outc);
;	genIfx
;fetchLitPair
	ld	iy, #_ve
	ld	a, 1 (iy)
;fetchLitPair
	or	a, 0 (iy)
	jr	Z,00107$
; peephole 163 changed absolute to relative conditional jump.
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #_outc
	push	hl
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0001
	push	hl
;	genIpush
;fetchPairLong
	ld	hl, (_ve)
	push	hl
;	genCall
	call	_tputs
	pop	af
	pop	af
	pop	af
;curses/curs_set.c:15: case 2:
;	genLabel
00107$:
;curses/curs_set.c:16: if (vs)
;	genIfx
;fetchLitPair
	ld	iy, #_vs
	ld	a, 1 (iy)
;fetchLitPair
	or	a, 0 (iy)
	jr	Z,00111$
; peephole 163 changed absolute to relative conditional jump.
;curses/curs_set.c:17: tputs(vs, 1, outc);
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #_outc
	push	hl
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0001
	push	hl
;	genIpush
;fetchPairLong
	ld	hl, (_vs)
	push	hl
;	genCall
	call	_tputs
	pop	af
	pop	af
	pop	af
;	genGoto
	ret
; peephole 160 replaced jump by return.
;	genLabel
00111$:
;curses/curs_set.c:18: else if (ve)
;	genIfx
;fetchLitPair
	ld	iy, #_ve
	ld	a, 1 (iy)
;fetchLitPair
	or	a, 0 (iy)
	ret	Z
; peephole 161 replaced jump by return.
;curses/curs_set.c:19: tputs(ve, 1, outc);
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #_outc
	push	hl
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0001
	push	hl
;	genIpush
;fetchPairLong
	ld	hl, (_ve)
	push	hl
;	genCall
	call	_tputs
	pop	af
	pop	af
	pop	af
;curses/curs_set.c:20: }
;	genLabel
; peephole 158 removed unused label 00114$.
;curses/curs_set.c:21: }
;	genEndFunction
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
