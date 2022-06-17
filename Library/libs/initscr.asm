;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module initscr
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _setterm
	.globl _newwin
	.globl _gettmode
	.globl _clearok
	.globl _getenv
	.globl _initscr
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
;curses/initscr.c:7: WINDOW *initscr(void)
;	genLabel
;	genFunction
;	---------------------------------
; Function initscr
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 0 bytes.
_initscr::
;curses/initscr.c:11: if ((term = getenv("TERM")) == NULL) return NULL;
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #___str_0
	push	hl
;	genCall
	call	_getenv
	pop	af
;	genAssign
;fetchPairLong
	ld	c, l
;	genIfx
	ld	a,h
	ld	b,a
; peephole 103 load value in a first and use it next
	or	a, l
	jr	NZ,00102$
; peephole 164 changed absolute to relative conditional jump.
;	genRet
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0000
	ret
; peephole 160 replaced jump by return.
;	genLabel
00102$:
;curses/initscr.c:12: setterm(term);
;	genIpush
	push	bc
;	genCall
	call	_setterm
	pop	af
;curses/initscr.c:13: gettmode();
;	genCall
	call	_gettmode
;curses/initscr.c:14: if ((_cursvar.tmpwin = newwin(LINES, COLS, 0, 0)) == (WINDOW *)ERR)
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0000
	push	hl
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	l, #0x00
	push	hl
;	genIpush
;fetchPairLong
	ld	hl, (_COLS)
	push	hl
;	genIpush
;fetchPairLong
	ld	hl, (_LINES)
	push	hl
;	genCall
	call	_newwin
	pop	af
	pop	af
	pop	af
	pop	af
	ld	c, l
	ld	b, h
;	genAssign (pointer)
;	isBitvar = 0
	ld	(__cursvar), bc
;	genCmpEq
	inc	c
	jr	NZ,00104$
; peephole 164 changed absolute to relative conditional jump.
; peephole 84 jumped to 00104$ directly instead of via 00131$.
	inc	b
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00131$.
	jr	NZ,00104$
; peephole 164 changed absolute to relative conditional jump.
; peephole 82 removed jp by using inverse jump logic
; peephole 158 removed unused label 00132$.
;curses/initscr.c:15: return NULL;
;	genRet
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0000
	ret
; peephole 160 replaced jump by return.
;	genLabel
00104$:
;curses/initscr.c:16: if ((curscr = newwin(LINES, COLS, 0, 0)) == (WINDOW *)ERR) 
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0000
	push	hl
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	l, #0x00
	push	hl
;	genIpush
;fetchPairLong
	ld	hl, (_COLS)
	push	hl
;	genIpush
;fetchPairLong
	ld	hl, (_LINES)
	push	hl
;	genCall
	call	_newwin
	pop	af
	pop	af
	pop	af
	pop	af
	ld	c, l
	ld	b, h
;	genAssign
	ld	(_curscr), bc
;	genCmpEq
	inc	c
	jr	NZ,00106$
; peephole 164 changed absolute to relative conditional jump.
; peephole 84 jumped to 00106$ directly instead of via 00133$.
	inc	b
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00133$.
	jr	NZ,00106$
; peephole 164 changed absolute to relative conditional jump.
; peephole 82 removed jp by using inverse jump logic
; peephole 158 removed unused label 00134$.
;curses/initscr.c:17: return NULL;
;	genRet
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0000
	ret
; peephole 160 replaced jump by return.
;	genLabel
00106$:
;curses/initscr.c:18: if ((stdscr = newwin(LINES, COLS, 0, 0)) == (WINDOW *)ERR)
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0000
	push	hl
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	l, #0x00
	push	hl
;	genIpush
;fetchPairLong
	ld	hl, (_COLS)
	push	hl
;	genIpush
;fetchPairLong
	ld	hl, (_LINES)
	push	hl
;	genCall
	call	_newwin
	pop	af
	pop	af
	pop	af
	pop	af
	ld	c, l
	ld	b, h
;	genAssign
	ld	(_stdscr), bc
;	genCmpEq
	inc	c
	jr	NZ,00108$
; peephole 164 changed absolute to relative conditional jump.
; peephole 84 jumped to 00108$ directly instead of via 00135$.
	inc	b
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00135$.
	jr	NZ,00108$
; peephole 164 changed absolute to relative conditional jump.
; peephole 82 removed jp by using inverse jump logic
; peephole 158 removed unused label 00136$.
;curses/initscr.c:19: return NULL;
;	genRet
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0000
	ret
; peephole 160 replaced jump by return.
;	genLabel
00108$:
;curses/initscr.c:20: clearok(curscr, TRUE);
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0001
	push	hl
;	genIpush
;fetchPairLong
	ld	hl, (_curscr)
	push	hl
;	genCall
	call	_clearok
	pop	af
	pop	af
;curses/initscr.c:21: return(stdscr);
;	genRet
;fetchPairLong
	ld	hl, (_stdscr)
;	genLabel
; peephole 158 removed unused label 00109$.
;curses/initscr.c:22: }
;	genEndFunction
	ret
___str_0:
	.ascii "TERM"
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
