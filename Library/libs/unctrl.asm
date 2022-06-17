;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module unctrl
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _unctrl
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
_strbuf:
	.ds 3
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
;curses/unctrl.c:28: char *unctrl(char c)
;	genLabel
;	genFunction
;	---------------------------------
; Function unctrl
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 0 bytes.
_unctrl::
	call	___sdcc_enter_ix
;curses/unctrl.c:30: int ic = c;
;	genCast
;	AOP_STK for 
	ld	c, 4 (ix)
; peephole 1 removed dead load from #0x00 into b.
;curses/unctrl.c:31: ic &= 0xff;
;	genAnd
	ld	b, #0x00
;curses/unctrl.c:33: if ((ic >= ' ') && (ic != 0x7f)) {	/* normal characters */
;	genCmpLt
	ld	a, c
	sub	a, #0x20
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00102$
; peephole 165 changed absolute to relative conditional jump.
;	genCmpEq
	ld	a, c
	sub	a, #0x7f
	or	a, b
	jr	Z,00102$
; peephole 163 changed absolute to relative conditional jump.
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00124$.
;curses/unctrl.c:34: strbuf[0] = ic;
;	genCast
;	genAssign (pointer)
;	isBitvar = 0
;fetchPairLong
;fetchLitPair
	ld	hl, #_strbuf
	ld	(hl), c
;curses/unctrl.c:35: strbuf[1] = '\0';
;	genAssign (pointer)
;	isBitvar = 0
;fetchPairLong
;fetchLitPair
	ld	hl, #(_strbuf + 0x0001)
	ld	(hl), #0x00
;curses/unctrl.c:36: return(strbuf);
;	genRet
;fetchPairLong
;fetchLitPair
	ld	hl, #_strbuf
	jr	00107$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00102$:
;curses/unctrl.c:38: strbuf[0] = '^';		/* '^' prefix */
;	genAddrOf
	ld	de, #_strbuf+0
;	genAssign (pointer)
;	isBitvar = 0
	ld	a, #0x5e
	ld	(de), a
;curses/unctrl.c:40: strbuf[1] = '?';
;	genPlus
;fetchPairLong
	ld	l, e
	ld	h, d
	inc	hl
;curses/unctrl.c:39: if (c == 0x7f)		/* DEL */
;	genCmpEq
;	AOP_STK for 
	ld	a, 4 (ix)
	sub	a, #0x7f
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00125$.
	jr	NZ,00105$
; peephole 164 changed absolute to relative conditional jump.
; peephole 82 removed jp by using inverse jump logic
; peephole 158 removed unused label 00126$.
;curses/unctrl.c:40: strbuf[1] = '?';
;	genAssign (pointer)
;	isBitvar = 0
	ld	(hl), #0x3f
;	genGoto
	jr	00106$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00105$:
;curses/unctrl.c:42: strbuf[1] = ic + '@';
;	genCast
	ld	a, c
;	genPlus
	add	a, #0x40
;	genAssign (pointer)
;	isBitvar = 0
	ld	(hl), a
;	genLabel
00106$:
;curses/unctrl.c:43: return(strbuf);
;	genAssign
;	(registers are the same)
;	genCast
;	(registers are the same)
;	genRet
;fetchPairLong
; peephole 157 used ex to load de into hl.
	ex	de,hl
;	genLabel
00107$:
;curses/unctrl.c:44: }				/* unctrl */
;	genEndFunction
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__strbuf:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.area _CABS (ABS)
