;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module doupdt
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _tputs
	.globl _poscur
	.globl _outc
	.globl _clrscr
	.globl _fflush
	.globl _fputc
	.globl _doupdate
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_twin:
	.ds 2
_newattr_lastattr_65536_156:
	.ds 2
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
;curses/doupdt.c:30: static int lastattr = 0;
;	genAssign
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0000
	ld	(_newattr_lastattr_65536_156), hl
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;curses/doupdt.c:19: static void gotoxy(int row, int col)
;	genLabel
;	genFunction
;	---------------------------------
; Function gotoxy
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_gotoxy:
;curses/doupdt.c:21: poscur(row, col);
;	genIpush
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 4, size 2
;fetchPairLong
; peephole 64 used hl instead of iy.
	ld	hl, #4
	add	hl, sp
; peephole 49 pushed bc instead of hl.
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
;	genIpush
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 2, size 2
;fetchPairLong
; peephole 64 used hl instead of iy.
	ld	hl, #4
	add	hl, sp
; peephole 49 pushed bc instead of hl.
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
;	genCall
	call	_poscur
	pop	af
	pop	af
;curses/doupdt.c:22: _cursvar.cursrow = row;
;	genAssign (pointer)
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 2, size 2
;	isBitvar = 0
;fetchPairLong
;fetchLitPair
	ld	hl, #(__cursvar + 0x0002)
	ld	iy, #2
	add	iy, sp
	ld	a, 0 (iy)
	ld	(hl), a
	inc	hl
	ld	a, 1 (iy)
	ld	(hl), a
;curses/doupdt.c:23: _cursvar.curscol = col;
;	genAssign (pointer)
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 4, size 2
;	isBitvar = 0
;fetchPairLong
;fetchLitPair
	ld	hl, #(__cursvar + 0x0004)
	ld	iy, #4
	add	iy, sp
	ld	a, 0 (iy)
	ld	(hl), a
	inc	hl
	ld	a, 1 (iy)
	ld	(hl), a
;	genLabel
; peephole 158 removed unused label 00101$.
;curses/doupdt.c:24: }
;	genEndFunction
	ret
;curses/doupdt.c:27: static void newattr(int ch)
;	genLabel
;	genFunction
;	---------------------------------
; Function newattr
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_newattr:
	call	___sdcc_enter_ix
;curses/doupdt.c:32: if (lastattr != (ch &= ATR_MSK)) {
;	genAnd
;	AOP_STK for 
	ld	c, #0x00
	ld	b, 5 (ix)
;	genAssign
;	AOP_STK for 
	ld	4 (ix), c
	ld	5 (ix), b
;	genCmpEq
;fetchLitPair
	ld	iy, #_newattr_lastattr_65536_156
	ld	a, 0 (iy)
	sub	a, c
	jr	NZ,00166$
; peephole 164 changed absolute to relative conditional jump.
;fetchLitPair
	ld	a, 1 (iy)
	sub	a, b
	jp	Z,00119$
; peephole 81 removed jp by using inverse jump logic
00166$:
;curses/doupdt.c:33: lastattr = ch;
;	genAssign
;	AOP_STK for 
;fetchPairLong
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	ld	(_newattr_lastattr_65536_156), hl
;curses/doupdt.c:35: tputs(me, 1, outc);
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
	ld	hl, (_me)
	push	hl
;	genCall
	call	_tputs
	pop	af
	pop	af
	pop	af
;curses/doupdt.c:36: if (ae) tputs(ae, 1, outc);
;	genIfx
;fetchLitPair
	ld	iy, #_ae
	ld	a, 1 (iy)
;fetchLitPair
	or	a, 0 (iy)
	jr	Z,00102$
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
	ld	hl, (_ae)
	push	hl
;	genCall
	call	_tputs
	pop	af
	pop	af
	pop	af
;	genLabel
00102$:
;curses/doupdt.c:38: if (ch & A_ALTCHARSET)
;	genAnd
;	AOP_STK for 
	bit	5, 5 (ix)
	jr	Z,00106$
; peephole 163 changed absolute to relative conditional jump.
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00167$.
;curses/doupdt.c:39: if (as) tputs(as, 1, outc);
;	genIfx
;fetchLitPair
	ld	iy, #_as
	ld	a, 1 (iy)
;fetchLitPair
	or	a, 0 (iy)
	jr	Z,00106$
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
	ld	hl, (_as)
	push	hl
;	genCall
	call	_tputs
	pop	af
	pop	af
	pop	af
;	genLabel
00106$:
;curses/doupdt.c:40: if (ch & A_BLINK) tputs(mb, 1, outc);
;	genAnd
;	AOP_STK for 
	bit	0, 5 (ix)
	jr	Z,00108$
; peephole 163 changed absolute to relative conditional jump.
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00168$.
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
	ld	hl, (_mb)
	push	hl
;	genCall
	call	_tputs
	pop	af
	pop	af
	pop	af
;	genLabel
00108$:
;curses/doupdt.c:41: if (ch & A_BOLD) tputs(md, 1, outc);
;	genAnd
;	AOP_STK for 
	bit	1, 5 (ix)
	jr	Z,00110$
; peephole 163 changed absolute to relative conditional jump.
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00169$.
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
	ld	hl, (_md)
	push	hl
;	genCall
	call	_tputs
	pop	af
	pop	af
	pop	af
;	genLabel
00110$:
;curses/doupdt.c:42: if (ch & A_REVERSE) tputs(mr, 1, outc);
;	genAnd
;	AOP_STK for 
	bit	2, 5 (ix)
	jr	Z,00112$
; peephole 163 changed absolute to relative conditional jump.
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00170$.
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
	ld	hl, (_mr)
	push	hl
;	genCall
	call	_tputs
	pop	af
	pop	af
	pop	af
;	genLabel
00112$:
;curses/doupdt.c:43: if (ch & A_STANDOUT) tputs(so, 1, outc);
;	genAnd
;	AOP_STK for 
	bit	3, 5 (ix)
	jr	Z,00114$
; peephole 163 changed absolute to relative conditional jump.
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00171$.
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
	ld	hl, (_so)
	push	hl
;	genCall
	call	_tputs
	pop	af
	pop	af
	pop	af
;	genLabel
00114$:
;curses/doupdt.c:44: if (ch & A_UNDERLINE) tputs(us, 1, outc);
;	genAnd
;	AOP_STK for 
	bit	4, 5 (ix)
	jr	Z,00119$
; peephole 163 changed absolute to relative conditional jump.
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00172$.
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
	ld	hl, (_us)
	push	hl
;	genCall
	call	_tputs
	pop	af
	pop	af
	pop	af
;	genLabel
00119$:
;curses/doupdt.c:46: }
;	genEndFunction
	pop	ix
	ret
;curses/doupdt.c:57: static void Putchar(int ch)
;	genLabel
;	genFunction
;	---------------------------------
; Function Putchar
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_Putchar:
	call	___sdcc_enter_ix
;curses/doupdt.c:59: if ((_cursvar.cursrow < LINES) || (_cursvar.curscol < COLS)) {
;	genPointerGet
	ld	bc, (#__cursvar + 2)
;	genCmpLt
;	Shift into pair
;fetchLitPair
	ld	hl, #_LINES
	ld	a, c
	sub	a, (hl)
	ld	a, b
	inc	hl
	sbc	a, (hl)
	jp	PO, 00111$
	xor	a, #0x80
00111$:
	jp	M, 00101$
;	genPointerGet
	ld	bc, (#__cursvar + 4)
;	genCmpLt
;	Shift into pair
;fetchLitPair
	ld	hl, #_COLS
	ld	a, c
	sub	a, (hl)
	ld	a, b
	inc	hl
	sbc	a, (hl)
	jp	PO, 00112$
	xor	a, #0x80
00112$:
	jp	P, 00104$
;	genLabel
00101$:
;curses/doupdt.c:60: newattr(ch);
;	genIpush
;	AOP_STK for 
;fetchPairLong
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
;	genCall
	call	_newattr
;curses/doupdt.c:61: putchar(ch);
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #_stdout
; peephole 143 used ex to move hl onto the stack.
	ex	(sp),hl
;	genIpush
;	AOP_STK for 
;fetchPairLong
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
;	genCall
	call	_fputc
	pop	af
	pop	af
;	genLabel
00104$:
;curses/doupdt.c:63: }
;	genEndFunction
	pop	ix
	ret
;curses/doupdt.c:70: static void clrupdate(WINDOW *scr)
;	genLabel
;	genFunction
;	---------------------------------
; Function clrupdate
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 18 bytes.
_clrupdate:
	call	___sdcc_enter_ix
	ld	hl, #-18
	add	hl, sp
	ld	sp, hl
;curses/doupdt.c:78: w = curscr;
;	genAssign
;fetchPairLong
	ld	bc, (_curscr)
;curses/doupdt.c:81: for (i = 0; i < LINES; i++) {
;	genAssign
;	AOP_STK for 
;	AOP_STK for _clrupdate_sloc0_1_0
	ld	a, 4 (ix)
	ld	-14 (ix), a
	ld	a, 5 (ix)
	ld	-13 (ix), a
;	genPlus
;	AOP_STK for _clrupdate_sloc1_1_0
;fetchPairLong
;fetchLitPair
	ld	hl, #0x001c
	add	hl, bc
	ld	-10 (ix), l
	ld	-9 (ix), h
;curses/doupdt.c:80: if (scr != w) {		/* copy scr to curscr */
;	genCmpEq
;	AOP_STK for 
	ld	a, 4 (ix)
	sub	a, c
	jr	NZ,00195$
; peephole 164 changed absolute to relative conditional jump.
	ld	a, 5 (ix)
	sub	a, b
	jp	Z,00104$
; peephole 81 removed jp by using inverse jump logic
00195$:
;curses/doupdt.c:81: for (i = 0; i < LINES; i++) {
;	genAssign
;	AOP_STK for _clrupdate_sloc0_1_0
;	AOP_STK for _clrupdate_sloc2_1_0
	ld	a, -14 (ix)
	ld	-12 (ix), a
	ld	a, -13 (ix)
	ld	-11 (ix), a
;	genAssign
;	AOP_STK for _clrupdate_sloc1_1_0
;	AOP_STK for _clrupdate_sloc3_1_0
	ld	a, -10 (ix)
	ld	-18 (ix), a
	ld	a, -9 (ix)
	ld	-17 (ix), a
;	genAssign
;fetchPairLong
;fetchLitPair
	ld	bc, #0x0000
;	genLabel
00120$:
;	genCmpLt
;	Shift into pair
;fetchLitPair
	ld	hl, #_LINES
	ld	a, c
	sub	a, (hl)
	ld	a, b
	inc	hl
	sbc	a, (hl)
	jp	PO, 00196$
	xor	a, #0x80
00196$:
	jp	P, 00104$
;curses/doupdt.c:82: src = scr->_line[i];
;	genPointerGet
;	AOP_STK for _clrupdate_sloc2_1_0
;fetchPairLong
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	de, #0x001c
	add	hl, de
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
;	genLeftShift
;fetchPairLong
	ld	e, c
	ld	d, b
	sla	e
	rl	d
;	genPlus
	add	hl, de
;	genPointerGet
;	AOP_STK for _clrupdate_sloc4_1_0
;fetchPairLong
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-6 (ix), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-5 (ix), a
;curses/doupdt.c:83: dst = w->_line[i];
;	genPointerGet
;	AOP_STK for _clrupdate_sloc3_1_0
;fetchPairLong
	pop	hl
	push	hl
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
;	genPlus
	add	hl, de
;	genPointerGet
;	AOP_STK for _clrupdate_sloc5_1_0
;fetchPairLong
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-16 (ix), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-15 (ix), a
;curses/doupdt.c:84: for (j = 0; j < COLS; j++) *dst++ = *src++;
;	genAssign
;fetchPairLong
;fetchLitPair
	ld	de, #0x0000
;	genLabel
00117$:
;	genCmpLt
;	Shift into pair
;fetchLitPair
	ld	hl, #_COLS
	ld	a, e
	sub	a, (hl)
	ld	a, d
	inc	hl
	sbc	a, (hl)
	jp	PO, 00199$
	xor	a, #0x80
00199$:
	jp	P, 00121$
;	genPointerGet
;	AOP_STK for _clrupdate_sloc4_1_0
;	AOP_STK for _clrupdate_sloc6_1_0
;fetchPairLong
	ld	l, -6 (ix)
	ld	h, -5 (ix)
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-8 (ix), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-7 (ix), a
;	genPlus
;	AOP_STK for _clrupdate_sloc4_1_0
	ld	a, -6 (ix)
	add	a, #0x02
	ld	-6 (ix), a
	jr	NC,00200$
; peephole 166 changed absolute to relative conditional jump.
	inc	-5 (ix)
00200$:
;	genAssign (pointer)
;	AOP_STK for _clrupdate_sloc5_1_0
;	AOP_STK for _clrupdate_sloc6_1_0
;	isBitvar = 0
;fetchPairLong
	ld	l, -16 (ix)
	ld	h, -15 (ix)
	ld	a, -8 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -7 (ix)
	ld	(hl), a
;	genPlus
;	AOP_STK for _clrupdate_sloc5_1_0
	ld	a, -16 (ix)
	add	a, #0x02
	ld	-16 (ix), a
	jr	NC,00201$
; peephole 166 changed absolute to relative conditional jump.
	inc	-15 (ix)
00201$:
;	genPlus
	inc	de
;	genGoto
	jr	00117$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00121$:
;curses/doupdt.c:81: for (i = 0; i < LINES; i++) {
;	genPlus
	inc	bc
;	genGoto
	jp	00120$
;	genLabel
00104$:
;curses/doupdt.c:87: newattr(scr->_attrs);
;	genAssign
;	AOP_STK for _clrupdate_sloc0_1_0
;fetchPairLong
	ld	l, -14 (ix)
	ld	h, -13 (ix)
;	genPointerGet
;fetchPairLong
	ld	de, #0x000e
	add	hl, de
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genIpush
	push	bc
;	genCall
	call	_newattr
	pop	af
;curses/doupdt.c:88: clrscr();
;	genCall
	call	_clrscr
;curses/doupdt.c:89: scr->_clear = FALSE;
;	genPlus
;	AOP_STK for _clrupdate_sloc0_1_0
	ld	a, -14 (ix)
	add	a, #0x12
	ld	l, a
	ld	a, -13 (ix)
	adc	a, #0x00
	ld	h, a
;	genAssign (pointer)
;	isBitvar = 0
;fetchPairLong
	xor	a, a
; peephole 128b cached zero in a.
	ld	(hl), a
	inc	hl
	ld	(hl), a
;curses/doupdt.c:90: for (i = 0; i < LINES; i++) {	/* update physical screen */
;	genAssign
;	AOP_STK for _clrupdate_sloc1_1_0
;	AOP_STK for _clrupdate_sloc6_1_0
	ld	a, -10 (ix)
	ld	-8 (ix), a
	ld	a, -9 (ix)
	ld	-7 (ix), a
;	genAssign
;	AOP_STK for _clrupdate_i_65536_162
	ld	-4 (ix), #0x00
	ld	-3 (ix), #0x00
;	genLabel
00123$:
;	genCmpLt
;	AOP_STK for _clrupdate_i_65536_162
;	Shift into pair
;fetchLitPair
	ld	hl, #_LINES
	ld	a, -4 (ix)
	sub	a, (hl)
	ld	a, -3 (ix)
	inc	hl
	sbc	a, (hl)
	jp	PO, 00202$
	xor	a, #0x80
00202$:
	jp	P, 00115$
;curses/doupdt.c:91: src = w->_line[i];
;	genPointerGet
;	AOP_STK for _clrupdate_sloc6_1_0
;fetchPairLong
	ld	l, -8 (ix)
	ld	h, -7 (ix)
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genLeftShift
;	AOP_STK for _clrupdate_i_65536_162
;fetchPairLong
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	add	hl, hl
;	genPlus
	add	hl, bc
;	genPointerGet
;	AOP_STK for _clrupdate_src_65536_162
;fetchPairLong
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-1 (ix), a
;curses/doupdt.c:92: j = 0;
;	genAssign
;fetchPairLong
;fetchLitPair
	ld	bc, #0x0000
;curses/doupdt.c:93: while (j < COLS) {
;	genLabel
00112$:
;	genCmpLt
;	Shift into pair
;fetchLitPair
	ld	hl, #_COLS
	ld	a, c
	sub	a, (hl)
	ld	a, b
	inc	hl
	sbc	a, (hl)
	jp	PO, 00203$
	xor	a, #0x80
00203$:
	jp	P, 00124$
;curses/doupdt.c:94: if (*src != (' ' | ATR_NRM)) {
;	genPointerGet
;	AOP_STK for _clrupdate_src_65536_162
;fetchPairLong
	ld	l, -2 (ix)
	ld	h, -1 (ix)
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;	genCmpEq
	ld	a, e
	sub	a, #0x20
	or	a, d
	jr	Z,00110$
; peephole 163 changed absolute to relative conditional jump.
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00204$.
;curses/doupdt.c:95: gotoxy(i, j);
;	genIpush
	push	bc
	push	bc
;	genIpush
;	AOP_STK for _clrupdate_i_65536_162
;fetchPairLong
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	push	hl
;	genCall
	call	_gotoxy
	pop	af
	pop	af
	pop	bc
;curses/doupdt.c:96: while (j < COLS && (*src != (' ' | ATR_NRM))) {
;	genAssign
;	AOP_STK for _clrupdate_src_65536_162
;fetchPairLong
	ld	e, -2 (ix)
	ld	d, -1 (ix)
;	genAssign
;	AOP_STK for _clrupdate_sloc5_1_0
	ld	-16 (ix), c
	ld	-15 (ix), b
;	genLabel
00106$:
;	genCmpLt
;	AOP_STK for _clrupdate_sloc5_1_0
;	Shift into pair
;fetchLitPair
	ld	hl, #_COLS
	ld	a, -16 (ix)
	sub	a, (hl)
	ld	a, -15 (ix)
	inc	hl
	sbc	a, (hl)
	jp	PO, 00205$
	xor	a, #0x80
00205$:
	jp	P, 00112$
;	genPointerGet
;fetchPairLong
	ld	l, e
	ld	h, d
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	genCmpEq
	ld	l,a
; peephole 98 removed redundant load from l into a.
	sub	a, #0x20
	or	a, h
	jr	Z,00112$
; peephole 163 changed absolute to relative conditional jump.
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00206$.
;curses/doupdt.c:97: Putchar(*src++);
;	genAssign
;	(registers are the same)
;	genPlus
	inc	de
	inc	de
;	genAssign
;	AOP_STK for _clrupdate_src_65536_162
	ld	-2 (ix), e
	ld	-1 (ix), d
;	genIpush
	push	de
	push	hl
;	genCall
	call	_Putchar
	pop	af
	pop	de
;curses/doupdt.c:98: j++;
;	genPlus
;	AOP_STK for _clrupdate_sloc5_1_0
	inc	-16 (ix)
	jr	NZ,00207$
; peephole 164 changed absolute to relative conditional jump.
	inc	-15 (ix)
00207$:
;	genAssign
;	AOP_STK for _clrupdate_sloc5_1_0
;fetchPairLong
	ld	c, -16 (ix)
	ld	b, -15 (ix)
;	genGoto
	jr	00106$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00110$:
;curses/doupdt.c:101: src++;
;	genPlus
;	AOP_STK for _clrupdate_src_65536_162
	ld	a, -2 (ix)
	add	a, #0x02
	ld	-2 (ix), a
	jr	NC,00208$
; peephole 166 changed absolute to relative conditional jump.
	inc	-1 (ix)
00208$:
;curses/doupdt.c:102: j++;
;	genPlus
	inc	bc
;	genGoto
	jp	00112$
;	genLabel
00124$:
;curses/doupdt.c:90: for (i = 0; i < LINES; i++) {	/* update physical screen */
;	genPlus
;	AOP_STK for _clrupdate_i_65536_162
	inc	-4 (ix)
	jp	NZ,00123$
; peephole 84 jumped to 00123$ directly instead of via 00209$.
	inc	-3 (ix)
; peephole 158 removed unused label 00209$.
;	genGoto
	jp	00123$
;	genLabel
00115$:
;curses/doupdt.c:106: fflush(stdout);
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #_stdout
	push	hl
;	genCall
	call	_fflush
;	genLabel
; peephole 158 removed unused label 00125$.
;curses/doupdt.c:107: }				/* clrupdate */
;	genEndFunction
; peephole 133 removed redundant pop af.
	ld	sp,ix
	pop	ix
	ret
;curses/doupdt.c:114: static void transformline(register int lineno)
;	genLabel
;	genFunction
;	---------------------------------
; Function transformline
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 16 bytes.
_transformline:
	call	___sdcc_enter_ix
	ld	hl, #-16
	add	hl, sp
	ld	sp, hl
;curses/doupdt.c:121: x = twin->_minchng[lineno];
;	genAssign
;	AOP_STK for _transformline_sloc0_1_0
;fetchPairLong
	ld	hl, (_twin)
;	genAssign
;	AOP_STK for _transformline_sloc0_1_0
;fetchPairLong
	ld	-4 (ix), l
	ld	-3 (ix), h
; peephole 11 loaded lh from lh directly instead of going through -4 (ix) -3 (ix).
; peephole 0 removed redundant load from l into l.
; peephole 0 removed redundant load from h into h.
;	genPointerGet
;fetchPairLong
	ld	de, #0x001e
	add	hl, de
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	h, (hl)
;	genLeftShift
;	AOP_STK for 
;fetchPairLong
	ld	c, 4 (ix)
	ld	b, 5 (ix)
	sla	c
	rl	b
;	genPlus
;fetchPairLong
	ld	l, e
	add	hl, bc
;	genPointerGet
;	AOP_STK for _transformline_x_65536_174
;fetchPairLong
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-10 (ix), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-9 (ix), a
;curses/doupdt.c:122: endx = twin->_maxchng[lineno];
;	genAssign
;	AOP_STK for _transformline_sloc0_1_0
;fetchPairLong
	ld	l, -4 (ix)
	ld	h, -3 (ix)
;	genPointerGet
;fetchPairLong
	ld	de, #0x0020
	add	hl, de
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	h, (hl)
;	genPlus
;fetchPairLong
	ld	l, e
	add	hl, bc
;	genPointerGet
;	AOP_STK for _transformline_endx_65536_174
;fetchPairLong
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-8 (ix), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-7 (ix), a
;curses/doupdt.c:123: dstp = curscr->_line[lineno] + x;
;	genAssign
;fetchPairLong
	ld	iy, (_curscr)
;	genPointerGet
	ld	l, 28 (iy)
	ld	h, 29 (iy)
;	genPlus
	add	hl, bc
;	genPointerGet
;fetchPairLong
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
;	genLeftShift
;	AOP_STK for _transformline_x_65536_174
;fetchPairLong
	ld	e, -10 (ix)
	ld	d, -9 (ix)
	sla	e
	rl	d
;	genPlus
	add	hl, de
;	genAssign
;	AOP_STK for _transformline_dstp_65536_174
	inc	sp
	inc	sp
	push	hl
;curses/doupdt.c:124: srcp = twin->_line[lineno] + x;
;	genAssign
;	AOP_STK for _transformline_sloc0_1_0
;fetchPairLong
	ld	l, -4 (ix)
	ld	h, -3 (ix)
;	genPointerGet
;fetchPairLong
	push	bc
	ld	bc, #0x001c
	add	hl, bc
	pop	bc
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
;	genPlus
	add	hl, bc
;	genPointerGet
;fetchPairLong
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
;	genPlus
	add	hl, de
;	genAssign
;	AOP_STK for _transformline_srcp_65536_174
	ld	-6 (ix), l
	ld	-5 (ix), h
;curses/doupdt.c:126: while (x <= endx) {
;	genLabel
00108$:
;	genCmpGt
;	AOP_STK for _transformline_x_65536_174
;	AOP_STK for _transformline_endx_65536_174
	ld	a, -8 (ix)
	sub	a, -10 (ix)
	ld	a, -7 (ix)
	sbc	a, -9 (ix)
	jp	PO, 00147$
	xor	a, #0x80
00147$:
	jp	M, 00110$
;curses/doupdt.c:127: if (*dstp != *srcp) {
;	genPointerGet
;	AOP_STK for _transformline_dstp_65536_174
;	AOP_STK for _transformline_sloc0_1_0
;fetchPairLong
	pop	hl
	push	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-4 (ix), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-3 (ix), a
;	genPointerGet
;	AOP_STK for _transformline_srcp_65536_174
;fetchPairLong
	ld	l, -6 (ix)
	ld	h, -5 (ix)
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;	genCmpEq
;	AOP_STK for _transformline_sloc0_1_0
	ld	a, -4 (ix)
	sub	a, e
	jr	NZ,00148$
; peephole 164 changed absolute to relative conditional jump.
	ld	a, -3 (ix)
	sub	a, d
	jp	Z,00106$
; peephole 81 removed jp by using inverse jump logic
00148$:
;curses/doupdt.c:128: gotoxy(lineno, x);
;	genIpush
	push	bc
;	AOP_STK for _transformline_x_65536_174
;fetchPairLong
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	push	hl
;	genIpush
;	AOP_STK for 
;fetchPairLong
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
;	genCall
	call	_gotoxy
	pop	af
	pop	af
	pop	bc
;curses/doupdt.c:129: while (x <= endx && (*dstp != *srcp)) {
;	genAssign
;	AOP_STK for _transformline_srcp_65536_174
;fetchPairLong
	ld	e, -6 (ix)
	ld	d, -5 (ix)
;	genAssign
;	AOP_STK for _transformline_dstp_65536_174
;	AOP_STK for _transformline_sloc0_1_0
	ld	a, -16 (ix)
	ld	-4 (ix), a
	ld	a, -15 (ix)
	ld	-3 (ix), a
;	genAssign
;	AOP_STK for _transformline_x_65536_174
;	AOP_STK for _transformline_sloc1_1_0
	ld	a, -10 (ix)
	ld	-2 (ix), a
	ld	a, -9 (ix)
	ld	-1 (ix), a
;	genLabel
00102$:
;	genCmpGt
;	AOP_STK for _transformline_sloc1_1_0
;	AOP_STK for _transformline_endx_65536_174
	ld	a, -8 (ix)
	sub	a, -2 (ix)
	ld	a, -7 (ix)
	sbc	a, -1 (ix)
	jp	PO, 00149$
	xor	a, #0x80
00149$:
	jp	M, 00108$
;	genPointerGet
;	AOP_STK for _transformline_sloc0_1_0
;	AOP_STK for _transformline_sloc2_1_0
;fetchPairLong
	ld	l, -4 (ix)
	ld	h, -3 (ix)
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-14 (ix), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-13 (ix), a
;	genPointerGet
;	AOP_STK for _transformline_sloc3_1_0
;	_moveFrom_tpair_()
	ld	a, (de)
	ld	-12 (ix), a
	inc	de
;	_moveFrom_tpair_()
	ld	a, (de)
	ld	-11 (ix), a
	dec	de
;	genCmpEq
;	AOP_STK for _transformline_sloc3_1_0
;	AOP_STK for _transformline_sloc2_1_0
	ld	a, -12 (ix)
	sub	a, -14 (ix)
	jr	NZ,00150$
; peephole 164 changed absolute to relative conditional jump.
	ld	a, -11 (ix)
	sub	a, -13 (ix)
	jp	Z,00108$
; peephole 81 removed jp by using inverse jump logic
00150$:
;curses/doupdt.c:130: Putchar(*srcp);
;	genIpush
	push	bc
	push	de
;	AOP_STK for _transformline_sloc3_1_0
;fetchPairLong
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	push	hl
;	genCall
	call	_Putchar
	pop	af
	pop	de
	pop	bc
;curses/doupdt.c:131: *dstp++ = *srcp++;
;	genPointerGet
;	AOP_STK for _transformline_sloc3_1_0
;	_moveFrom_tpair_()
	ld	a, (de)
	ld	-12 (ix), a
	inc	de
;	_moveFrom_tpair_()
	ld	a, (de)
	ld	-11 (ix), a
	dec	de
;	genPlus
	inc	de
	inc	de
;	genAssign
;	AOP_STK for _transformline_srcp_65536_174
	ld	-6 (ix), e
	ld	-5 (ix), d
;	genAssign (pointer)
;	AOP_STK for _transformline_sloc0_1_0
;	AOP_STK for _transformline_sloc3_1_0
;	isBitvar = 0
;fetchPairLong
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	a, -12 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -11 (ix)
	ld	(hl), a
;	genPlus
;	AOP_STK for _transformline_sloc0_1_0
	ld	a, -4 (ix)
	add	a, #0x02
	ld	-4 (ix), a
	jr	NC,00151$
; peephole 166 changed absolute to relative conditional jump.
	inc	-3 (ix)
00151$:
;	genAssign
;	AOP_STK for _transformline_sloc0_1_0
;	AOP_STK for _transformline_dstp_65536_174
	ld	a, -4 (ix)
	ld	-16 (ix), a
	ld	a, -3 (ix)
	ld	-15 (ix), a
;curses/doupdt.c:132: x++;
;	genPlus
;	AOP_STK for _transformline_sloc1_1_0
	inc	-2 (ix)
	jr	NZ,00152$
; peephole 164 changed absolute to relative conditional jump.
	inc	-1 (ix)
00152$:
;	genAssign
;	AOP_STK for _transformline_sloc1_1_0
;	AOP_STK for _transformline_x_65536_174
	ld	a, -2 (ix)
	ld	-10 (ix), a
	ld	a, -1 (ix)
	ld	-9 (ix), a
;	genGoto
	jp	00102$
;	genLabel
00106$:
;curses/doupdt.c:135: *dstp++ = *srcp++;
;	genAssign
;	(registers are the same)
;	genPlus
;	AOP_STK for _transformline_srcp_65536_174
	ld	a, -6 (ix)
	add	a, #0x02
	ld	-6 (ix), a
	jr	NC,00153$
; peephole 166 changed absolute to relative conditional jump.
	inc	-5 (ix)
00153$:
;	genAssign (pointer)
;	AOP_STK for _transformline_dstp_65536_174
;	isBitvar = 0
;fetchPairLong
	pop	hl
	push	hl
	ld	(hl), e
	inc	hl
	ld	(hl), d
;	genPlus
;	AOP_STK for _transformline_dstp_65536_174
	ld	a, -16 (ix)
	add	a, #0x02
	ld	-16 (ix), a
	jr	NC,00154$
; peephole 166 changed absolute to relative conditional jump.
	inc	-15 (ix)
00154$:
;curses/doupdt.c:136: x++;
;	genPlus
;	AOP_STK for _transformline_x_65536_174
	inc	-10 (ix)
	jp	NZ,00108$
; peephole 84 jumped to 00108$ directly instead of via 00155$.
	inc	-9 (ix)
; peephole 158 removed unused label 00155$.
;	genGoto
	jp	00108$
;	genLabel
00110$:
;curses/doupdt.c:139: twin->_minchng[lineno] = _NO_CHANGE;
;	genAssign
;fetchPairLong
	ld	iy, (_twin)
;	genPointerGet
	ld	l, 30 (iy)
	ld	h, 31 (iy)
;	genPlus
	add	hl, bc
;	genAssign (pointer)
;	isBitvar = 0
;fetchPairLong
	ld	(hl), #0xff
	inc	hl
	ld	(hl), #0xff
;curses/doupdt.c:140: twin->_maxchng[lineno] = _NO_CHANGE;
;	genAssign
;fetchPairLong
	ld	iy, (_twin)
;	genPointerGet
	ld	l, 32 (iy)
	ld	h, 33 (iy)
;	genPlus
	add	hl, bc
;	genAssign (pointer)
;	isBitvar = 0
;fetchPairLong
	ld	(hl), #0xff
	inc	hl
	ld	(hl), #0xff
;	genLabel
; peephole 158 removed unused label 00111$.
;curses/doupdt.c:141: }				/* transformline */
;	genEndFunction
	ld	sp, ix
	pop	ix
	ret
;curses/doupdt.c:149: void doupdate(void)
;	genLabel
;	genFunction
;	---------------------------------
; Function doupdate
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 0 bytes.
_doupdate::
;curses/doupdt.c:153: twin = _cursvar.tmpwin;
;	genPointerGet
	ld	hl, #__cursvar + 0
;	_moveFrom_tpair_()
	ld	a, (hl)
;fetchLitPair
	ld	iy, #_twin
	ld	0 (iy), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
;fetchLitPair
	ld	1 (iy), a
;curses/doupdt.c:154: if (curscr->_clear)
;	genAssign
;fetchPairLong
	ld	hl, (_curscr)
;	genPointerGet
;fetchPairLong
	ld	de, #0x0012
	add	hl, de
;	_moveFrom_tpair_()
;	_moveFrom_tpair_()
;	genIfx
	ld	a, (hl)
	inc	hl
; peephole 99a removed load by reordering or arguments.
	or	a, (hl)
	jr	Z,00108$
; peephole 163 changed absolute to relative conditional jump.
;curses/doupdt.c:155: clrupdate(curscr);
;	genIpush
;fetchPairLong
	ld	hl, (_curscr)
	push	hl
;	genCall
	call	_clrupdate
	pop	af
;	genGoto
	jr	00109$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00108$:
;curses/doupdt.c:157: if (twin->_clear)
;	genAssign
;fetchPairLong
	ld	hl, (_twin)
;	genPointerGet
;fetchPairLong
	ld	de, #0x0012
	add	hl, de
;	_moveFrom_tpair_()
;	_moveFrom_tpair_()
;	genIfx
	ld	a, (hl)
	inc	hl
; peephole 99a removed load by reordering or arguments.
	or	a, (hl)
	jr	Z,00119$
; peephole 163 changed absolute to relative conditional jump.
;curses/doupdt.c:158: clrupdate(twin);
;	genIpush
;fetchPairLong
	ld	hl, (_twin)
	push	hl
;	genCall
	call	_clrupdate
	pop	af
;	genGoto
	jr	00109$
; peephole 162 changed absolute to relative unconditional jump.
;curses/doupdt.c:160: for (i = 0; i < LINES; i++)
;	genLabel
00119$:
;	genAssign
;fetchPairLong
;fetchLitPair
	ld	bc, #0x0000
;	genLabel
00111$:
;	genCmpLt
;	Shift into pair
;fetchLitPair
	ld	hl, #_LINES
	ld	a, c
	sub	a, (hl)
	ld	a, b
	inc	hl
	sbc	a, (hl)
	jp	PO, 00141$
	xor	a, #0x80
00141$:
	jp	P, 00109$
;curses/doupdt.c:161: if (twin->_minchng[i] != _NO_CHANGE)
;	genAssign
;fetchPairLong
	ld	hl, (_twin)
;	genPointerGet
;fetchPairLong
	ld	de, #0x001e
	add	hl, de
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;	genLeftShift
;fetchPairLong
	ld	l, c
	ld	h, b
	add	hl, hl
;	genPlus
	add	hl, de
;	genPointerGet
;fetchPairLong
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;	genCmpEq
	inc	e
	jr	NZ,00142$
; peephole 164 changed absolute to relative conditional jump.
	inc	d
	jr	Z,00112$
; peephole 163 changed absolute to relative conditional jump.
; peephole 81 removed jp by using inverse jump logic
00142$:
;curses/doupdt.c:162: transformline(i);
;	genIpush
	push	bc
	push	bc
;	genCall
	call	_transformline
	pop	af
	pop	bc
;	genLabel
00112$:
;curses/doupdt.c:160: for (i = 0; i < LINES; i++)
;	genPlus
	inc	bc
;	genGoto
	jr	00111$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00109$:
;curses/doupdt.c:165: curscr->_curx = twin->_curx;
;	genAssign
;fetchPairLong
	ld	bc, (_curscr)
;	genPlus
	inc	bc
	inc	bc
	ld	e, b
;	genAssign
;fetchPairLong
	ld	hl, (_twin)
;	genPointerGet
;fetchPairLong
	inc	hl
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;	genAssign (pointer)
;	isBitvar = 0
;fetchPairLong
	ld	l, c
	ld	h, e
	ld	(hl), b
	inc	hl
	ld	(hl), d
;curses/doupdt.c:166: curscr->_cury = twin->_cury;
;	genAssign
;fetchPairLong
	ld	bc, (_curscr)
;	genAssign
;fetchPairLong
	ld	hl, (_twin)
;	genPointerGet
;fetchPairLong
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;	genAssign (pointer)
;	isBitvar = 0
;fetchPairLong
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
;curses/doupdt.c:154: if (curscr->_clear)
;	genAssign
;fetchPairLong
	ld	bc, (_curscr)
;curses/doupdt.c:167: gotoxy(curscr->_cury, curscr->_curx);
;	genAssign
;fetchPairLong
	ld	l, c
	ld	h, b
;	genPointerGet
;fetchPairLong
	inc	hl
	inc	hl
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;	genPointerGet
;fetchPairLong
	ld	l, c
	ld	h, b
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genIpush
	push	de
;	genIpush
	push	bc
;	genCall
	call	_gotoxy
	pop	af
;curses/doupdt.c:168: fflush(stdout);
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #_stdout
; peephole 143 used ex to move hl onto the stack.
	ex	(sp),hl
;	genCall
	call	_fflush
	pop	af
;	genLabel
; peephole 158 removed unused label 00113$.
;curses/doupdt.c:169: }				/* doupdate */
;	genEndFunction
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
