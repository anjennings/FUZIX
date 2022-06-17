;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module scan
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _wrefresh
	.globl _wmove
	.globl _wgetstr
	.globl _vsscanf
	.globl _wscanw
	.globl _scanw
	.globl _mvscanw
	.globl _mvwscanw
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
;curses/scan.c:12: int wscanw(WINDOW *win, const char *fmt, ...)
;	genLabel
;	genFunction
;	---------------------------------
; Function wscanw
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 0 bytes.
_wscanw::
	call	___sdcc_enter_ix
;curses/scan.c:16: va_start(args, fmt);
;	genAddrOf
;	genCast
;	(registers are the same)
;	genPlus
; peephole 141 moved increment to constant.
	ld	hl, #0x0006+1+1
; peephole 141 moved increment to constant.
	add	hl, sp
;curses/scan.c:17: wrefresh(win);		/* set cursor */
;	genIpush
; peephole 26 pushed hl directly instead of going through de.
	push	hl
;	AOP_STK for 
;fetchPairLong
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
;	genCall
	call	_wrefresh
;curses/scan.c:18: if (wgetstr(win, __printscanbuf) == ERR)	/* get string */
;	genIpush
; peephole 50 eleminated dead pop/push pair.
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
	call	_wgetstr
	pop	af
	pop	af
	pop	de
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
;curses/scan.c:19: return(ERR);
;	genRet
;fetchPairLong
;fetchLitPair
	ld	hl, #0xffff
	jr	00103$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00102$:
;curses/scan.c:20: return(vsscanf(__printscanbuf, fmt, args));
;	genIpush
	push	de
;	genIpush
;	AOP_STK for 
;fetchPairLong
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	push	hl
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #___printscanbuf
	push	hl
;	genCall
	call	_vsscanf
	pop	af
	pop	af
	pop	af
;	genRet
;fetchPairLong
;	genLabel
00103$:
;curses/scan.c:21: }				/* wscanw */
;	genEndFunction
	pop	ix
	ret
;curses/scan.c:28: int scanw(const char *fmt, ...)
;	genLabel
;	genFunction
;	---------------------------------
; Function scanw
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 0 bytes.
_scanw::
	call	___sdcc_enter_ix
;curses/scan.c:32: va_start(args, fmt);
;	genAddrOf
;	genCast
;	(registers are the same)
;	genPlus
; peephole 141 moved increment to constant.
	ld	hl, #0x0004+1+1
; peephole 141 moved increment to constant.
	add	hl, sp
;curses/scan.c:33: wrefresh(stdscr);		/* set cursor */
;	genIpush
; peephole 26 pushed hl directly instead of going through de.
	push	hl
;fetchPairLong
	ld	hl, (_stdscr)
	push	hl
;	genCall
	call	_wrefresh
;curses/scan.c:34: if (wgetstr(stdscr, __printscanbuf) == ERR)	/* get string */
;	genIpush
; peephole 50 eleminated dead pop/push pair.
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
	call	_wgetstr
	pop	af
	pop	af
	pop	de
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
;curses/scan.c:35: return(ERR);
;	genRet
;fetchPairLong
;fetchLitPair
	ld	hl, #0xffff
	jr	00103$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00102$:
;curses/scan.c:36: return(vsscanf(__printscanbuf, fmt, args));
;	genIpush
	push	de
;	genIpush
;	AOP_STK for 
;fetchPairLong
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #___printscanbuf
	push	hl
;	genCall
	call	_vsscanf
	pop	af
	pop	af
	pop	af
;	genRet
;fetchPairLong
;	genLabel
00103$:
;curses/scan.c:37: }				/* scanw */
;	genEndFunction
	pop	ix
	ret
;curses/scan.c:45: int mvscanw(int y, int x, const char *fmt, ...)
;	genLabel
;	genFunction
;	---------------------------------
; Function mvscanw
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_mvscanw::
	call	___sdcc_enter_ix
;curses/scan.c:49: va_start(args, fmt);
;	genAddrOf
;	genCast
;	(registers are the same)
;	genPlus
; peephole 141 moved increment to constant.
	ld	hl, #0x0008+1+1
; peephole 141 moved increment to constant.
	add	hl, sp
;curses/scan.c:50: if (wmove(stdscr, y, x) == ERR) return(ERR);
;	genIpush
; peephole 26 pushed hl directly instead of going through de.
	push	hl
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
	pop	de
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
;curses/scan.c:51: wrefresh(stdscr);		/* set cursor */
;	genIpush
	push	de
;fetchPairLong
	ld	hl, (_stdscr)
	push	hl
;	genCall
	call	_wrefresh
;curses/scan.c:52: if (wgetstr(stdscr, __printscanbuf) == ERR)	/* get string */
;	genIpush
; peephole 50 eleminated dead pop/push pair.
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
	call	_wgetstr
	pop	af
	pop	af
	pop	de
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
;curses/scan.c:53: return(ERR);
;	genRet
;fetchPairLong
;fetchLitPair
	ld	hl, #0xffff
	jr	00105$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00104$:
;curses/scan.c:54: return(vsscanf(__printscanbuf, fmt, args));
;	genIpush
	push	de
;	genIpush
;	AOP_STK for 
;fetchPairLong
	ld	l, 8 (ix)
	ld	h, 9 (ix)
	push	hl
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #___printscanbuf
	push	hl
;	genCall
	call	_vsscanf
	pop	af
	pop	af
	pop	af
;	genRet
;fetchPairLong
;	genLabel
00105$:
;curses/scan.c:55: }				/* mvscanw */
;	genEndFunction
	pop	ix
	ret
;curses/scan.c:63: int mvwscanw(WINDOW *win, int y, int x, const char *fmt, ...)
;	genLabel
;	genFunction
;	---------------------------------
; Function mvwscanw
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 0 bytes.
_mvwscanw::
	call	___sdcc_enter_ix
;curses/scan.c:67: va_start(args, fmt);
;	genAddrOf
;	genCast
;	(registers are the same)
;	genPlus
; peephole 141 moved increment to constant.
	ld	hl, #0x000a+1+1
; peephole 141 moved increment to constant.
	add	hl, sp
;curses/scan.c:68: if (wmove(win, y, x) == ERR) return(ERR);
;	genIpush
; peephole 26 pushed hl directly instead of going through de.
	push	hl
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
	pop	de
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
;curses/scan.c:69: wrefresh(win);		/* set cursor */
;	genIpush
	push	de
;	AOP_STK for 
;fetchPairLong
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
;	genCall
	call	_wrefresh
;curses/scan.c:70: if (wgetstr(win, __printscanbuf) == ERR)	/* get string */
;	genIpush
; peephole 50 eleminated dead pop/push pair.
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
	call	_wgetstr
	pop	af
	pop	af
	pop	de
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
;curses/scan.c:71: return(ERR);
;	genRet
;fetchPairLong
;fetchLitPair
	ld	hl, #0xffff
	jr	00105$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00104$:
;curses/scan.c:72: return(vsscanf(__printscanbuf, fmt, args));
;	genIpush
	push	de
;	genIpush
;	AOP_STK for 
;fetchPairLong
	ld	l, 10 (ix)
	ld	h, 11 (ix)
	push	hl
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #___printscanbuf
	push	hl
;	genCall
	call	_vsscanf
	pop	af
	pop	af
	pop	af
;	genRet
;fetchPairLong
;	genLabel
00105$:
;curses/scan.c:73: }				/* mvwscanw */
;	genEndFunction
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
