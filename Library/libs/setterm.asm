;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module setterm
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _tcsetattr
	.globl _raw
	.globl _noraw
	.globl _echo
	.globl _noecho
	.globl _nl
	.globl _nonl
	.globl _cbreak
	.globl _nocbreak
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
;curses/setterm.c:4: static void ttysetflags(void)
;	genLabel
;	genFunction
;	---------------------------------
; Function ttysetflags
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 0 bytes.
_ttysetflags:
;curses/setterm.c:6: _tty.c_iflag |= ICRNL | IXON;
;	genPointerGet
	ld	bc, (#__tty + 0)
;	genOr
	set	1, c
	set	4, b
;	genAssign (pointer)
;	isBitvar = 0
	ld	(__tty), bc
;curses/setterm.c:7: _tty.c_oflag |= OPOST | ONLCR;
;	genPointerGet
	ld	bc, (#(__tty + 0x0002) + 0)
;	genOr
	ld	a, c
	or	a, #0x05
	ld	c, a
;	genAssign (pointer)
;	isBitvar = 0
	ld	((__tty + 0x0002)), bc
;curses/setterm.c:8: _tty.c_lflag |= ECHO | ICANON | IEXTEN | ISIG;
;	genPointerGet
	ld	bc, (#(__tty + 0x0006) + 0)
;	genOr
	ld	a, c
	or	a, #0x71
	ld	c, a
;	genAssign (pointer)
;	isBitvar = 0
	ld	((__tty + 0x0006)), bc
;curses/setterm.c:9: _tty.c_cc[VEOF] = 4;
;	genPlus
;fetchLitPair
	ld	bc, #__tty + 8
;	genAssign (pointer)
;	isBitvar = 0
	ld	a, #0x04
	ld	(bc), a
;curses/setterm.c:11: if (_cursvar.rawmode) {
;	genPointerGet
	ld	hl, (#__cursvar + 6)
;	genIfx
	ld	a, h
	or	a, l
	jr	Z,00102$
; peephole 163 changed absolute to relative conditional jump.
;curses/setterm.c:12: _tty.c_iflag &= ~(ICRNL | IXON);
;	genPointerGet
	ld	de, (#__tty + 0)
;	genAnd
	res	1, e
	res	4, d
;	genAssign (pointer)
;	isBitvar = 0
	ld	(__tty), de
;curses/setterm.c:13: _tty.c_oflag &= ~(OPOST);
;	genPointerGet
	ld	de, (#(__tty + 0x0002) + 0)
;	genAnd
	res	0, e
;	genAssign (pointer)
;	isBitvar = 0
	ld	((__tty + 0x0002)), de
;curses/setterm.c:14: _tty.c_lflag &= ~(ICANON | IEXTEN | ISIG);
;	genPointerGet
	ld	de, (#(__tty + 0x0006) + 0)
;	genAnd
	ld	a, e
	and	a, #0x8f
	ld	e, a
;	genAssign (pointer)
;	isBitvar = 0
	ld	((__tty + 0x0006)), de
;curses/setterm.c:15: _tty.c_cc[VMIN] = 1;
;	genAssign (pointer)
;	isBitvar = 0
	ld	a, #0x01
	ld	(bc), a
;	genLabel
00102$:
;curses/setterm.c:17: if (_cursvar.cbrkmode) {
;	genPointerGet
	ld	hl, (#__cursvar + 8)
;	genIfx
	ld	a, h
	or	a, l
	jr	Z,00104$
; peephole 163 changed absolute to relative conditional jump.
;curses/setterm.c:18: _tty.c_lflag &= ~(ICANON);
;	genPointerGet
	ld	de, (#(__tty + 0x0006) + 0)
;	genAnd
	res	4, e
;	genAssign (pointer)
;	isBitvar = 0
	ld	((__tty + 0x0006)), de
;curses/setterm.c:19: _tty.c_cc[VMIN] = 1;
;	genAssign (pointer)
;	isBitvar = 0
	ld	a, #0x01
	ld	(bc), a
;	genLabel
00104$:
;curses/setterm.c:21: if (!_cursvar.echoit) {
;	genPointerGet
	ld	hl, (#__cursvar + 10)
;	genIfx
	ld	a, h
	or	a, l
	jr	NZ,00106$
; peephole 164 changed absolute to relative conditional jump.
;curses/setterm.c:22: _tty.c_lflag &= ~(ECHO | ECHONL);
;	genPointerGet
	ld	bc, (#(__tty + 0x0006) + 0)
;	genAnd
	ld	a, c
	and	a, #0xf6
	ld	c, a
;	genAssign (pointer)
;	isBitvar = 0
	ld	((__tty + 0x0006)), bc
;	genLabel
00106$:
;curses/setterm.c:24: if (NONL) {
;	genIfx
;fetchLitPair
	ld	iy, #_NONL
	ld	a, 1 (iy)
;fetchLitPair
	or	a, 0 (iy)
	jr	Z,00108$
; peephole 163 changed absolute to relative conditional jump.
;curses/setterm.c:25: _tty.c_iflag &= ~(ICRNL);
;	genPointerGet
	ld	bc, (#__tty + 0)
;	genAnd
	res	1, c
;	genAssign (pointer)
;	isBitvar = 0
	ld	(__tty), bc
;curses/setterm.c:26: _tty.c_oflag &= ~(ONLCR);
;	genPointerGet
	ld	bc, (#(__tty + 0x0002) + 0)
;	genAnd
	res	2, c
;	genAssign (pointer)
;	isBitvar = 0
	ld	((__tty + 0x0002)), bc
;	genLabel
00108$:
;curses/setterm.c:28: tcsetattr(0, TCSANOW, &_tty);
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #__tty
	push	hl
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
;	genCall
	call	_tcsetattr
	pop	af
	pop	af
	pop	af
;	genLabel
; peephole 158 removed unused label 00109$.
;curses/setterm.c:29: }				/* ttysetflags */
;	genEndFunction
	ret
;curses/setterm.c:31: void raw(void)
;	genLabel
;	genFunction
;	---------------------------------
; Function raw
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_raw::
;curses/setterm.c:33: _cursvar.rawmode = TRUE;
;	genAssign (pointer)
;	isBitvar = 0
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0001
	ld	((__cursvar + 0x0006)), hl
;curses/setterm.c:34: ttysetflags();
;	genCall
;	genLabel
; peephole 158 removed unused label 00101$.
;curses/setterm.c:35: }				/* raw */
;	genEndFunction
	jp  _ttysetflags
; peephole 135 replaced call at end of function by jump (tail call optimization).
;curses/setterm.c:37: void noraw(void)
;	genLabel
;	genFunction
;	---------------------------------
; Function noraw
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_noraw::
;curses/setterm.c:39: _cursvar.rawmode = FALSE;
;	genAssign (pointer)
;	isBitvar = 0
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0000
	ld	((__cursvar + 0x0006)), hl
;curses/setterm.c:40: ttysetflags();
;	genCall
;	genLabel
; peephole 158 removed unused label 00101$.
;curses/setterm.c:41: }				/* noraw */
;	genEndFunction
	jp  _ttysetflags
; peephole 135 replaced call at end of function by jump (tail call optimization).
;curses/setterm.c:43: void echo(void)
;	genLabel
;	genFunction
;	---------------------------------
; Function echo
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_echo::
;curses/setterm.c:45: _cursvar.echoit = TRUE;
;	genAssign (pointer)
;	isBitvar = 0
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0001
	ld	((__cursvar + 0x000a)), hl
;curses/setterm.c:46: ttysetflags();
;	genCall
;	genLabel
; peephole 158 removed unused label 00101$.
;curses/setterm.c:47: }
;	genEndFunction
	jp  _ttysetflags
; peephole 135 replaced call at end of function by jump (tail call optimization).
;curses/setterm.c:49: void noecho(void)
;	genLabel
;	genFunction
;	---------------------------------
; Function noecho
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_noecho::
;curses/setterm.c:51: _cursvar.echoit = FALSE;
;	genAssign (pointer)
;	isBitvar = 0
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0000
	ld	((__cursvar + 0x000a)), hl
;curses/setterm.c:52: ttysetflags();
;	genCall
;	genLabel
; peephole 158 removed unused label 00101$.
;curses/setterm.c:53: }
;	genEndFunction
	jp  _ttysetflags
; peephole 135 replaced call at end of function by jump (tail call optimization).
;curses/setterm.c:55: void nl(void)
;	genLabel
;	genFunction
;	---------------------------------
; Function nl
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_nl::
;curses/setterm.c:57: NONL = FALSE;
;	genAssign
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0000
	ld	(_NONL), hl
;curses/setterm.c:58: ttysetflags();
;	genCall
;	genLabel
; peephole 158 removed unused label 00101$.
;curses/setterm.c:59: }				/* nl */
;	genEndFunction
	jp  _ttysetflags
; peephole 135 replaced call at end of function by jump (tail call optimization).
;curses/setterm.c:61: void nonl(void)
;	genLabel
;	genFunction
;	---------------------------------
; Function nonl
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_nonl::
;curses/setterm.c:63: NONL = TRUE;
;	genAssign
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0001
	ld	(_NONL), hl
;curses/setterm.c:64: ttysetflags();
;	genCall
;	genLabel
; peephole 158 removed unused label 00101$.
;curses/setterm.c:65: }				/* nonl */
;	genEndFunction
	jp  _ttysetflags
; peephole 135 replaced call at end of function by jump (tail call optimization).
;curses/setterm.c:67: void cbreak(void)
;	genLabel
;	genFunction
;	---------------------------------
; Function cbreak
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_cbreak::
;curses/setterm.c:69: _cursvar.cbrkmode = TRUE;
;	genAssign (pointer)
;	isBitvar = 0
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0001
	ld	((__cursvar + 0x0008)), hl
;curses/setterm.c:70: ttysetflags();
;	genCall
;	genLabel
; peephole 158 removed unused label 00101$.
;curses/setterm.c:71: }				/* cbreak */
;	genEndFunction
	jp  _ttysetflags
; peephole 135 replaced call at end of function by jump (tail call optimization).
;curses/setterm.c:73: void nocbreak(void)
;	genLabel
;	genFunction
;	---------------------------------
; Function nocbreak
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_nocbreak::
;curses/setterm.c:75: _cursvar.cbrkmode = FALSE;
;	genAssign (pointer)
;	isBitvar = 0
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0000
	ld	((__cursvar + 0x0008)), hl
;curses/setterm.c:76: ttysetflags();
;	genCall
;	genLabel
; peephole 158 removed unused label 00101$.
;curses/setterm.c:77: }				/* nocbreak */
;	genEndFunction
	jp  _ttysetflags
; peephole 135 replaced call at end of function by jump (tail call optimization).
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
