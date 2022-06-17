;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module prnt
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _wmove
	.globl _waddstr
	.globl _vsnprintf
	.globl _strlen
	.globl _wprintw
	.globl _printw
	.globl _mvprintw
	.globl _mvwprintw
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
;curses/prnt.c:10: int wprintw(WINDOW *win, const char *fmt, ...)
;	genLabel
;	genFunction
;	---------------------------------
; Function wprintw
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_wprintw::
	call	___sdcc_enter_ix
;curses/prnt.c:14: va_start(args, fmt);
;	genAddrOf
;	genCast
;	(registers are the same)
;	genPlus
; peephole 141 moved increment to constant.
	ld	hl, #0x0006+1+1
; peephole 141 moved increment to constant.
	add	hl, sp
;curses/prnt.c:15: vsnprintf(__printscanbuf, sizeof(__printscanbuf), fmt, args);
;	genIpush
; peephole 26 pushed hl directly instead of going through de.
	push	hl
;	genIpush
;	AOP_STK for 
;fetchPairLong
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	push	hl
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0201
	push	hl
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #___printscanbuf
	push	hl
;	genCall
	call	_vsnprintf
	pop	af
	pop	af
	pop	af
;curses/prnt.c:16: if (waddstr(win, __printscanbuf) == ERR) return(ERR);
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #___printscanbuf
; peephole 143 used ex to move hl onto the stack.
	ex	(sp),hl
;	genIpush
;	AOP_STK for 
;fetchPairLong
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
;	genCall
	call	_waddstr
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
;curses/prnt.c:17: return(strlen(__printscanbuf));
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #___printscanbuf
	push	hl
;	genCall
	call	_strlen
	pop	af
;	genRet
;fetchPairLong
;	genLabel
00103$:
;curses/prnt.c:18: }
;	genEndFunction
	pop	ix
	ret
;curses/prnt.c:23: int printw(const char *fmt, ...)
;	genLabel
;	genFunction
;	---------------------------------
; Function printw
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_printw::
	call	___sdcc_enter_ix
;curses/prnt.c:27: va_start(args, fmt);
;	genAddrOf
;	genCast
;	(registers are the same)
;	genPlus
; peephole 141 moved increment to constant.
	ld	hl, #0x0004+1+1
; peephole 141 moved increment to constant.
	add	hl, sp
;curses/prnt.c:28: vsnprintf(__printscanbuf, sizeof(__printscanbuf), fmt, args);
;	genIpush
; peephole 26 pushed hl directly instead of going through de.
	push	hl
;	genIpush
;	AOP_STK for 
;fetchPairLong
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0201
	push	hl
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #___printscanbuf
	push	hl
;	genCall
	call	_vsnprintf
	pop	af
	pop	af
	pop	af
;curses/prnt.c:29: if (waddstr(stdscr, __printscanbuf) == ERR) return(ERR);
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #___printscanbuf
; peephole 143 used ex to move hl onto the stack.
	ex	(sp),hl
;	genIpush
;fetchPairLong
	ld	hl, (_stdscr)
	push	hl
;	genCall
	call	_waddstr
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
;curses/prnt.c:30: return(strlen(__printscanbuf));
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #___printscanbuf
	push	hl
;	genCall
	call	_strlen
	pop	af
;	genRet
;fetchPairLong
;	genLabel
00103$:
;curses/prnt.c:31: }				/* printw */
;	genEndFunction
	pop	ix
	ret
;curses/prnt.c:37: int mvprintw(int y, int x, const char *fmt, ...)
;	genLabel
;	genFunction
;	---------------------------------
; Function mvprintw
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 0 bytes.
_mvprintw::
	call	___sdcc_enter_ix
;curses/prnt.c:41: va_start(args, fmt);
;	genAddrOf
;	genCast
;	(registers are the same)
;	genPlus
; peephole 129 moved increment of hl to constant.
	ld	hl,#0x0008+1+1
	add	hl,sp
; peephole 129 moved increment of hl to constant.
	ld	b, l
	ld	c, h
;curses/prnt.c:42: if (wmove(stdscr, y, x) == ERR) return(ERR);
;	genIpush
	push	bc
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
	pop	bc
;	genCmpEq
	inc	l
	jr	NZ,00102$
; peephole 164 changed absolute to relative conditional jump.
; peephole 84 jumped to 00102$ directly instead of via 00117$.
	inc	h
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00117$.
	jr	NZ,00102$
; peephole 164 changed absolute to relative conditional jump.
; peephole 82 removed jp by using inverse jump logic
; peephole 158 removed unused label 00118$.
;	genRet
;fetchPairLong
;fetchLitPair
	ld	hl, #0xffff
	jr	00105$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00102$:
;curses/prnt.c:43: vsnprintf(__printscanbuf, sizeof(__printscanbuf), fmt, args);
;	genIpush
;fetchPairLong
	ld	l, b
	ld	h, c
	push	hl
;	genIpush
;	AOP_STK for 
;fetchPairLong
	ld	l, 8 (ix)
	ld	h, 9 (ix)
	push	hl
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0201
	push	hl
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #___printscanbuf
	push	hl
;	genCall
	call	_vsnprintf
	pop	af
	pop	af
	pop	af
;curses/prnt.c:44: if (waddstr(stdscr, __printscanbuf) == ERR) return(ERR);
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #___printscanbuf
; peephole 143 used ex to move hl onto the stack.
	ex	(sp),hl
;	genIpush
;fetchPairLong
	ld	hl, (_stdscr)
	push	hl
;	genCall
	call	_waddstr
	pop	af
	pop	af
;	genCmpEq
	inc	l
	jr	NZ,00104$
; peephole 164 changed absolute to relative conditional jump.
; peephole 84 jumped to 00104$ directly instead of via 00119$.
	inc	h
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00119$.
	jr	NZ,00104$
; peephole 164 changed absolute to relative conditional jump.
; peephole 82 removed jp by using inverse jump logic
; peephole 158 removed unused label 00120$.
;	genRet
;fetchPairLong
;fetchLitPair
	ld	hl, #0xffff
	jr	00105$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00104$:
;curses/prnt.c:45: return(strlen(__printscanbuf));
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #___printscanbuf
	push	hl
;	genCall
	call	_strlen
	pop	af
;	genRet
;fetchPairLong
;	genLabel
00105$:
;curses/prnt.c:46: }
;	genEndFunction
	pop	ix
	ret
;curses/prnt.c:52: int mvwprintw(WINDOW *win, int y, int x, const char *fmt, ...)
;	genLabel
;	genFunction
;	---------------------------------
; Function mvwprintw
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 0 bytes.
_mvwprintw::
	call	___sdcc_enter_ix
;curses/prnt.c:56: va_start(args, fmt);
;	genAddrOf
;	genCast
;	(registers are the same)
;	genPlus
; peephole 129 moved increment of hl to constant.
	ld	hl,#0x000a+1+1
	add	hl,sp
; peephole 129 moved increment of hl to constant.
	ld	b, l
	ld	c, h
;curses/prnt.c:57: if (wmove(win, y, x) == ERR) return(ERR);
;	genIpush
	push	bc
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
	pop	bc
;	genCmpEq
	inc	l
	jr	NZ,00102$
; peephole 164 changed absolute to relative conditional jump.
; peephole 84 jumped to 00102$ directly instead of via 00117$.
	inc	h
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00117$.
	jr	NZ,00102$
; peephole 164 changed absolute to relative conditional jump.
; peephole 82 removed jp by using inverse jump logic
; peephole 158 removed unused label 00118$.
;	genRet
;fetchPairLong
;fetchLitPair
	ld	hl, #0xffff
	jr	00105$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00102$:
;curses/prnt.c:58: vsnprintf(__printscanbuf, sizeof(__printscanbuf), fmt, args);
;	genIpush
;fetchPairLong
	ld	l, b
	ld	h, c
	push	hl
;	genIpush
;	AOP_STK for 
;fetchPairLong
	ld	l, 10 (ix)
	ld	h, 11 (ix)
	push	hl
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0201
	push	hl
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #___printscanbuf
	push	hl
;	genCall
	call	_vsnprintf
	pop	af
	pop	af
	pop	af
;curses/prnt.c:59: if (waddstr(win, __printscanbuf) == ERR) return(ERR);
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #___printscanbuf
; peephole 143 used ex to move hl onto the stack.
	ex	(sp),hl
;	genIpush
;	AOP_STK for 
;fetchPairLong
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
;	genCall
	call	_waddstr
	pop	af
	pop	af
;	genCmpEq
	inc	l
	jr	NZ,00104$
; peephole 164 changed absolute to relative conditional jump.
; peephole 84 jumped to 00104$ directly instead of via 00119$.
	inc	h
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00119$.
	jr	NZ,00104$
; peephole 164 changed absolute to relative conditional jump.
; peephole 82 removed jp by using inverse jump logic
; peephole 158 removed unused label 00120$.
;	genRet
;fetchPairLong
;fetchLitPair
	ld	hl, #0xffff
	jr	00105$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00104$:
;curses/prnt.c:60: return(strlen(__printscanbuf));
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #___printscanbuf
	push	hl
;	genCall
	call	_strlen
	pop	af
;	genRet
;fetchPairLong
;	genLabel
00105$:
;curses/prnt.c:61: }				/* mvwprintw */
;	genEndFunction
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
