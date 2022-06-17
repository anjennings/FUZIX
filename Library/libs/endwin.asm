;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module endwin
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _tputs
	.globl _wrefresh
	.globl _poscur
	.globl _outc
	.globl _delwin
	.globl _tcsetattr
	.globl _endwin
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
;curses/endwin.c:5: int endwin(void)
;	genLabel
;	genFunction
;	---------------------------------
; Function endwin
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_endwin::
;curses/endwin.c:10: refresh();
;	genIpush
;fetchPairLong
	ld	hl, (_stdscr)
	push	hl
;	genCall
	call	_wrefresh
	pop	af
;curses/endwin.c:12: poscur(LINES - 1, 0);
;	genMinus
;fetchPairLong
	ld	bc, (_LINES)
	dec	bc
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0000
	push	hl
;	genIpush
	push	bc
;	genCall
	call	_poscur
	pop	af
;curses/endwin.c:14: tputs(me, 1, outc);
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #_outc
; peephole 143 used ex to move hl onto the stack.
	ex	(sp),hl
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0001
	push	hl
;	genIpush
;fetchPairLong
	ld	hl, (_me)
	push	hl
;	genCall
	call	_tputs
	pop	af
	pop	af
	pop	af
;curses/endwin.c:16: delwin(stdscr);
;	genIpush
;fetchPairLong
	ld	hl, (_stdscr)
	push	hl
;	genCall
	call	_delwin
	pop	af
;curses/endwin.c:17: delwin(curscr);
;	genIpush
;fetchPairLong
	ld	hl, (_curscr)
	push	hl
;	genCall
	call	_delwin
	pop	af
;curses/endwin.c:18: delwin(_cursvar.tmpwin);
;	genPointerGet
	ld	hl, (#__cursvar + 0)
;	genIpush
	push	hl
;	genCall
	call	_delwin
;curses/endwin.c:20: tcsetattr(1, TCSANOW, &_orig_tty);
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #__orig_tty
; peephole 143 used ex to move hl onto the stack.
	ex	(sp),hl
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0000
	push	hl
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	l, #0x01
	push	hl
;	genCall
	call	_tcsetattr
	pop	af
	pop	af
	pop	af
;curses/endwin.c:22: return (OK);
;	genRet
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0000
;	genLabel
; peephole 158 removed unused label 00101$.
;curses/endwin.c:23: }
;	genEndFunction
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
