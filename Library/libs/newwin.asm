;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module newwin
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _calloc
	.globl _malloc
	.globl _free
	.globl _newwin
	.globl _subwin
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
;curses/newwin.c:10: static WINDOW *makenew(int num_lines, int num_columns, int begy, int begx)
;	genLabel
;	genFunction
;	---------------------------------
; Function makenew
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 10 bytes.
_makenew:
	call	___sdcc_enter_ix
	ld	hl, #-10
	add	hl, sp
	ld	sp, hl
;curses/newwin.c:16: if ((win = (WINDOW *) malloc(sizeof(WINDOW))) == NULL) 
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0026
	push	hl
;	genCall
	call	_malloc
	pop	af
	ld	c, l
	ld	b, h
;	genCast
;	(registers are the same)
;	genAssign
;	AOP_STK for _makenew_win_65536_284
	ld	-4 (ix), c
	ld	-3 (ix), b
;	genIfx
	ld	a, b
	or	a, c
	jr	NZ,00102$
; peephole 164 changed absolute to relative conditional jump.
;curses/newwin.c:17: return((WINDOW *) ERR);
;	genRet
;fetchPairLong
;fetchLitPair
	ld	hl, #0xffff
	jp	00122$
;	genLabel
00102$:
;curses/newwin.c:20: if ((win->_line = (int **) calloc(num_lines, sizeof(int *))) == NULL) {
;	genPlus
;	AOP_STK for _makenew_win_65536_284
;	AOP_STK for _makenew_sloc0_1_0
	ld	a, -4 (ix)
	add	a, #0x1c
	ld	-6 (ix), a
	ld	a, -3 (ix)
	adc	a, #0x00
	ld	-5 (ix), a
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0002
	push	hl
;	genIpush
;	AOP_STK for 
;fetchPairLong
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
;	genCall
	call	_calloc
	pop	af
	pop	af
; peephole 156 used ex to load hl into de.
	ex	de,hl
;	genCast
;	(registers are the same)
;	genAssign (pointer)
;	AOP_STK for _makenew_sloc0_1_0
;	isBitvar = 0
;fetchPairLong
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
;curses/newwin.c:21: free(win);
;	genCast
;	AOP_STK for _makenew_win_65536_284
;fetchPairLong
	ld	c, -4 (ix)
	ld	b, -3 (ix)
;curses/newwin.c:20: if ((win->_line = (int **) calloc(num_lines, sizeof(int *))) == NULL) {
;	genIfx
	ld	a, d
	or	a, e
	jr	NZ,00104$
; peephole 164 changed absolute to relative conditional jump.
;curses/newwin.c:21: free(win);
;	genIpush
	push	bc
;	genCall
	call	_free
	pop	af
;curses/newwin.c:22: return((WINDOW *) ERR);
;	genRet
;fetchPairLong
;fetchLitPair
	ld	hl, #0xffff
	jp	00122$
;	genLabel
00104$:
;curses/newwin.c:26: if ((win->_minchng = (int *) calloc(num_lines, sizeof(int))) == NULL) {
;	genPlus
;	AOP_STK for _makenew_win_65536_284
;	AOP_STK for _makenew_sloc1_1_0
	ld	a, -4 (ix)
	add	a, #0x1e
	ld	-8 (ix), a
	ld	a, -3 (ix)
	adc	a, #0x00
	ld	-7 (ix), a
;	genIpush
	push	bc
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0002
	push	hl
;	genIpush
;	AOP_STK for 
;fetchPairLong
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
;	genCall
	call	_calloc
	pop	af
	pop	af
; peephole 156 used ex to load hl into de.
	ex	de,hl
	pop	bc
;	genCast
;	(registers are the same)
;	genAssign (pointer)
;	AOP_STK for _makenew_sloc1_1_0
;	isBitvar = 0
;fetchPairLong
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
;	genIfx
	ld	a, d
	or	a, e
	jr	NZ,00106$
; peephole 164 changed absolute to relative conditional jump.
;curses/newwin.c:27: free(win);
;	genIpush
	push	bc
;	genCall
	call	_free
	pop	af
;curses/newwin.c:28: free(win->_line);
;	genPointerGet
;	AOP_STK for _makenew_sloc0_1_0
;fetchPairLong
	ld	l, -6 (ix)
	ld	h, -5 (ix)
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genCast
;	(registers are the same)
;	genIpush
	push	bc
;	genCall
	call	_free
	pop	af
;curses/newwin.c:29: return((WINDOW *) ERR);
;	genRet
;fetchPairLong
;fetchLitPair
	ld	hl, #0xffff
	jp	00122$
;	genLabel
00106$:
;curses/newwin.c:31: if ((win->_maxchng = (int *) calloc(num_lines, sizeof(int))) == NULL) {
;	genPlus
;	AOP_STK for _makenew_win_65536_284
;	AOP_STK for _makenew_sloc2_1_0
	ld	a, -4 (ix)
	add	a, #0x20
	ld	-10 (ix), a
	ld	a, -3 (ix)
	adc	a, #0x00
	ld	-9 (ix), a
;	genIpush
	push	bc
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0002
	push	hl
;	genIpush
;	AOP_STK for 
;fetchPairLong
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
;	genCall
	call	_calloc
	pop	af
	pop	af
; peephole 156 used ex to load hl into de.
	ex	de,hl
	pop	bc
;	genCast
;	(registers are the same)
;	genAssign (pointer)
;	AOP_STK for _makenew_sloc2_1_0
;	isBitvar = 0
;fetchPairLong
	pop	hl
	push	hl
	ld	(hl), e
	inc	hl
	ld	(hl), d
;	genIfx
	ld	a, d
	or	a, e
	jr	NZ,00108$
; peephole 164 changed absolute to relative conditional jump.
;curses/newwin.c:32: free(win);
;	genIpush
	push	bc
;	genCall
	call	_free
	pop	af
;curses/newwin.c:33: free(win->_line);
;	genPointerGet
;	AOP_STK for _makenew_sloc0_1_0
;fetchPairLong
	ld	l, -6 (ix)
	ld	h, -5 (ix)
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genCast
;	(registers are the same)
;	genIpush
	push	bc
;	genCall
	call	_free
	pop	af
;curses/newwin.c:34: free(win->_minchng);
;	genPointerGet
;	AOP_STK for _makenew_sloc1_1_0
;fetchPairLong
	ld	l, -8 (ix)
	ld	h, -7 (ix)
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genCast
;	(registers are the same)
;	genIpush
	push	bc
;	genCall
	call	_free
	pop	af
;curses/newwin.c:35: return((WINDOW *) ERR);
;	genRet
;fetchPairLong
;fetchLitPair
	ld	hl, #0xffff
	jp	00122$
;	genLabel
00108$:
;curses/newwin.c:39: win->_curx = 0;
;	genPlus
;	AOP_STK for _makenew_win_65536_284
;fetchPairLong
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	inc	hl
	inc	hl
;	genAssign (pointer)
;	isBitvar = 0
;fetchPairLong
	xor	a, a
; peephole 128b cached zero in a.
	ld	(hl), a
	inc	hl
	ld	(hl), a
;curses/newwin.c:40: win->_cury = 0;
;	genAssign (pointer)
;	AOP_STK for _makenew_win_65536_284
;	isBitvar = 0
;fetchPairLong
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	xor	a, a
; peephole 128b cached zero in a.
	ld	(hl), a
	inc	hl
	ld	(hl), a
;curses/newwin.c:41: win->_maxy = num_lines - 1;
;	genPlus
;	AOP_STK for _makenew_win_65536_284
	ld	a, -4 (ix)
	add	a, #0x04
	ld	l, a
	ld	a, -3 (ix)
	adc	a, #0x00
	ld	h, a
;	genMinus
;	AOP_STK for 
;fetchPairLong
	ld	e, 4 (ix)
	ld	d, 5 (ix)
	dec	de
;	genAssign (pointer)
;	isBitvar = 0
;fetchPairLong
	ld	(hl), e
	inc	hl
	ld	(hl), d
;curses/newwin.c:42: win->_maxx = num_columns - 1;
;	genPlus
;	AOP_STK for _makenew_win_65536_284
	ld	a, -4 (ix)
	add	a, #0x06
	ld	l, a
	ld	a, -3 (ix)
	adc	a, #0x00
	ld	h, a
;	genMinus
;	AOP_STK for 
;fetchPairLong
	ld	c, 6 (ix)
	ld	b, 7 (ix)
	dec	bc
;	genAssign (pointer)
;	isBitvar = 0
;fetchPairLong
	ld	(hl), c
	inc	hl
	ld	(hl), b
;curses/newwin.c:43: win->_begy = begy;
;	genPlus
;	AOP_STK for _makenew_win_65536_284
	ld	a, -4 (ix)
	add	a, #0x08
	ld	l, a
	ld	a, -3 (ix)
	adc	a, #0x00
	ld	h, a
;	genAssign (pointer)
;	AOP_STK for 
;	isBitvar = 0
;fetchPairLong
	ld	a, 8 (ix)
	ld	(hl), a
	inc	hl
	ld	a, 9 (ix)
	ld	(hl), a
;curses/newwin.c:44: win->_begx = begx;
;	genPlus
;	AOP_STK for _makenew_win_65536_284
	ld	a, -4 (ix)
	add	a, #0x0a
	ld	l, a
	ld	a, -3 (ix)
	adc	a, #0x00
	ld	h, a
;	genAssign (pointer)
;	AOP_STK for 
;	isBitvar = 0
;fetchPairLong
	ld	a, 10 (ix)
	ld	(hl), a
	inc	hl
	ld	a, 11 (ix)
	ld	(hl), a
;curses/newwin.c:45: win->_flags = 0;
;	genPlus
;	AOP_STK for _makenew_win_65536_284
;	AOP_STK for _makenew_sloc0_1_0
	ld	a, -4 (ix)
	add	a, #0x0c
	ld	-6 (ix), a
	ld	a, -3 (ix)
	adc	a, #0x00
	ld	-5 (ix), a
;	genAssign (pointer)
;	AOP_STK for _makenew_sloc0_1_0
;	isBitvar = 0
;fetchPairLong
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	xor	a, a
; peephole 128b cached zero in a.
	ld	(hl), a
	inc	hl
	ld	(hl), a
;curses/newwin.c:46: win->_attrs = ATR_NRM;
;	genPlus
;	AOP_STK for _makenew_win_65536_284
	ld	a, -4 (ix)
	add	a, #0x0e
	ld	l, a
	ld	a, -3 (ix)
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
;curses/newwin.c:47: win->_tabsize = 8;
;	genPlus
;	AOP_STK for _makenew_win_65536_284
	ld	a, -4 (ix)
	add	a, #0x10
	ld	l, a
	ld	a, -3 (ix)
	adc	a, #0x00
	ld	h, a
;	genAssign (pointer)
;	isBitvar = 0
;fetchPairLong
	ld	(hl), #0x08
	inc	hl
	ld	(hl), #0x00
;curses/newwin.c:48: win->_clear = FALSE;
;	genPlus
;	AOP_STK for _makenew_win_65536_284
	ld	a, -4 (ix)
	add	a, #0x12
	ld	l, a
	ld	a, -3 (ix)
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
;curses/newwin.c:49: win->_leave = FALSE;
;	genPlus
;	AOP_STK for _makenew_win_65536_284
	ld	a, -4 (ix)
	add	a, #0x14
	ld	l, a
	ld	a, -3 (ix)
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
;curses/newwin.c:50: win->_scroll = FALSE;
;	genPlus
;	AOP_STK for _makenew_win_65536_284
	ld	a, -4 (ix)
	add	a, #0x16
	ld	l, a
	ld	a, -3 (ix)
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
;curses/newwin.c:51: win->_nodelay = FALSE;
;	genPlus
;	AOP_STK for _makenew_win_65536_284
	ld	a, -4 (ix)
	add	a, #0x18
	ld	l, a
	ld	a, -3 (ix)
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
;curses/newwin.c:52: win->_keypad = FALSE;
;	genPlus
;	AOP_STK for _makenew_win_65536_284
	ld	a, -4 (ix)
	add	a, #0x1a
	ld	l, a
	ld	a, -3 (ix)
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
;curses/newwin.c:53: win->_regtop = 0;
;	genPlus
;	AOP_STK for _makenew_win_65536_284
	ld	a, -4 (ix)
	add	a, #0x22
	ld	l, a
	ld	a, -3 (ix)
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
;curses/newwin.c:54: win->_regbottom = num_lines - 1;
;	genPlus
;	AOP_STK for _makenew_win_65536_284
	ld	a, -4 (ix)
	add	a, #0x24
	ld	l, a
	ld	a, -3 (ix)
	adc	a, #0x00
	ld	h, a
;	genAssign (pointer)
;	isBitvar = 0
;fetchPairLong
	ld	(hl), e
	inc	hl
	ld	(hl), d
;curses/newwin.c:57: for (i = 0; i < num_lines; i++) {
;	genAssign
;	AOP_STK for _makenew_i_65536_284
	ld	-2 (ix), #0x00
	ld	-1 (ix), #0x00
;	genLabel
00120$:
;	genCmpLt
;	AOP_STK for _makenew_i_65536_284
;	AOP_STK for 
	ld	a, -2 (ix)
	sub	a, 4 (ix)
	ld	a, -1 (ix)
	sbc	a, 5 (ix)
	jp	PO, 00185$
	xor	a, #0x80
00185$:
	jp	P, 00109$
;curses/newwin.c:58: win->_minchng[i] = 0;
;	genPointerGet
;	AOP_STK for _makenew_sloc1_1_0
;fetchPairLong
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
;	genLeftShift
;	AOP_STK for _makenew_i_65536_284
;fetchPairLong
	ld	e, -2 (ix)
	ld	d, -1 (ix)
	sla	e
	rl	d
;	genPlus
	add	hl, de
;	genAssign (pointer)
;	isBitvar = 0
;fetchPairLong
	xor	a, a
; peephole 128b cached zero in a.
	ld	(hl), a
	inc	hl
	ld	(hl), a
;curses/newwin.c:59: win->_maxchng[i] = num_columns - 1;
;	genPointerGet
;	AOP_STK for _makenew_sloc2_1_0
;fetchPairLong
	pop	hl
	push	hl
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
;	genPlus
	add	hl, de
;	genAssign (pointer)
;	isBitvar = 0
;fetchPairLong
	ld	(hl), c
	inc	hl
	ld	(hl), b
;curses/newwin.c:57: for (i = 0; i < num_lines; i++) {
;	genPlus
;	AOP_STK for _makenew_i_65536_284
	inc	-2 (ix)
	jr	NZ,00120$
; peephole 164 changed absolute to relative conditional jump.
; peephole 84 jumped to 00120$ directly instead of via 00188$.
	inc	-1 (ix)
; peephole 158 removed unused label 00188$.
;	genGoto
	jr	00120$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00109$:
;curses/newwin.c:63: if ((begy + num_lines) == LINES) {
;	genPlus
;	AOP_STK for 
;	AOP_STK for 
	ld	a, 8 (ix)
	add	a, 4 (ix)
	ld	e, a
	ld	a, 9 (ix)
	adc	a, 5 (ix)
	ld	d, a
;	genCmpEq
;fetchLitPair
	ld	iy, #_LINES
	ld	a, 0 (iy)
	sub	a, e
	jr	NZ,00115$
; peephole 164 changed absolute to relative conditional jump.
; peephole 84 jumped to 00115$ directly instead of via 00189$.
;fetchLitPair
	ld	a, 1 (iy)
	sub	a, d
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00189$.
	jr	NZ,00115$
; peephole 164 changed absolute to relative conditional jump.
; peephole 82 removed jp by using inverse jump logic
; peephole 158 removed unused label 00190$.
;curses/newwin.c:64: win->_flags |= _ENDLINE;
;	genPointerGet
;	AOP_STK for _makenew_sloc0_1_0
;fetchPairLong
	ld	l, -6 (ix)
	ld	h, -5 (ix)
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genOr
	set	1, c
;	genAssign (pointer)
;	AOP_STK for _makenew_sloc0_1_0
;	isBitvar = 0
;fetchPairLong
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
;curses/newwin.c:65: if ((begx == 0) && (num_columns == COLS) && (begy == 0))
;	genIfx
;	AOP_STK for 
	ld	a, 11 (ix)
	or	a, 10 (ix)
	jr	NZ,00115$
; peephole 164 changed absolute to relative conditional jump.
;	genCmpEq
;	AOP_STK for 
	ld	a, 6 (ix)
;fetchLitPair
	ld	iy, #_COLS
	sub	a, 0 (iy)
	jr	NZ,00115$
; peephole 164 changed absolute to relative conditional jump.
; peephole 84 jumped to 00115$ directly instead of via 00191$.
	ld	a, 7 (ix)
;fetchLitPair
	sub	a, 1 (iy)
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00191$.
	jr	NZ,00115$
; peephole 164 changed absolute to relative conditional jump.
; peephole 82 removed jp by using inverse jump logic
; peephole 158 removed unused label 00192$.
;	genIfx
;	AOP_STK for 
	ld	a, 9 (ix)
	or	a, 8 (ix)
	jr	NZ,00115$
; peephole 164 changed absolute to relative conditional jump.
;curses/newwin.c:66: win->_flags |= _FULLWIN;
;	genPointerGet
;	AOP_STK for _makenew_sloc0_1_0
;fetchPairLong
	ld	l, -6 (ix)
	ld	h, -5 (ix)
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genOr
	set	2, c
;	genAssign (pointer)
;	AOP_STK for _makenew_sloc0_1_0
;	isBitvar = 0
;fetchPairLong
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
;	genLabel
00115$:
;curses/newwin.c:68: if (((begy + num_lines) == LINES) && ((begx + num_columns) == COLS))
;	genCmpEq
;fetchLitPair
	ld	iy, #_LINES
	ld	a, 0 (iy)
	sub	a, e
	jr	NZ,00117$
; peephole 164 changed absolute to relative conditional jump.
; peephole 84 jumped to 00117$ directly instead of via 00193$.
;fetchLitPair
	ld	a, 1 (iy)
	sub	a, d
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00193$.
	jr	NZ,00117$
; peephole 164 changed absolute to relative conditional jump.
; peephole 82 removed jp by using inverse jump logic
; peephole 158 removed unused label 00194$.
;	genPlus
;	AOP_STK for 
;	AOP_STK for 
	ld	a, 10 (ix)
	add	a, 6 (ix)
	ld	c, a
	ld	a, 11 (ix)
	adc	a, 7 (ix)
	ld	b, a
;	genCmpEq
;fetchLitPair
	ld	iy, #_COLS
	ld	a, 0 (iy)
	sub	a, c
	jr	NZ,00117$
; peephole 164 changed absolute to relative conditional jump.
; peephole 84 jumped to 00117$ directly instead of via 00195$.
;fetchLitPair
	ld	a, 1 (iy)
	sub	a, b
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00195$.
	jr	NZ,00117$
; peephole 164 changed absolute to relative conditional jump.
; peephole 82 removed jp by using inverse jump logic
; peephole 158 removed unused label 00196$.
;curses/newwin.c:69: win->_flags |= _SCROLLWIN;
;	genPointerGet
;	AOP_STK for _makenew_sloc0_1_0
;fetchPairLong
	ld	l, -6 (ix)
	ld	h, -5 (ix)
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genOr
	set	3, c
;	genAssign (pointer)
;	AOP_STK for _makenew_sloc0_1_0
;	isBitvar = 0
;fetchPairLong
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
;	genLabel
00117$:
;curses/newwin.c:70: return(win);
;	genRet
;	AOP_STK for _makenew_win_65536_284
;fetchPairLong
	ld	l, -4 (ix)
	ld	h, -3 (ix)
;	genLabel
00122$:
;curses/newwin.c:71: }
;	genEndFunction
	ld	sp, ix
	pop	ix
	ret
;curses/newwin.c:80: WINDOW *newwin(int num_lines, int num_columns, int begy, int begx)
;	genLabel
;	genFunction
;	---------------------------------
; Function newwin
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 10 bytes.
_newwin::
	call	___sdcc_enter_ix
	ld	hl, #-10
	add	hl, sp
	ld	sp, hl
;curses/newwin.c:86: if (num_lines == 0) num_lines = LINES - begy;
;	genIfx
;	AOP_STK for 
	ld	a, 5 (ix)
	or	a, 4 (ix)
	jr	NZ,00102$
; peephole 164 changed absolute to relative conditional jump.
;	genMinus
;	AOP_STK for 
;fetchLitPair
	ld	iy, #_LINES
	ld	a, 0 (iy)
	sub	a, 8 (ix)
	ld	c, a
;fetchLitPair
	ld	a, 1 (iy)
	sbc	a, 9 (ix)
	ld	b, a
;	genAssign
;	AOP_STK for 
	ld	4 (ix), c
	ld	5 (ix), b
;	genLabel
00102$:
;curses/newwin.c:87: if (num_columns == 0) num_columns = COLS - begx;
;	genIfx
;	AOP_STK for 
	ld	a, 7 (ix)
	or	a, 6 (ix)
	jr	NZ,00104$
; peephole 164 changed absolute to relative conditional jump.
;	genMinus
;	AOP_STK for 
;fetchLitPair
	ld	iy, #_COLS
	ld	a, 0 (iy)
	sub	a, 10 (ix)
	ld	c, a
;fetchLitPair
	ld	a, 1 (iy)
	sbc	a, 11 (ix)
	ld	b, a
;	genAssign
;	AOP_STK for 
	ld	6 (ix), c
	ld	7 (ix), b
;	genLabel
00104$:
;curses/newwin.c:88: if ((win = makenew(num_lines, num_columns, begy, begx)) == (WINDOW *) ERR)
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
	call	_makenew
	pop	af
	pop	af
	pop	af
	pop	af
;	genAssign
;	AOP_STK for _newwin_win_65536_292
	ld	-2 (ix), l
	ld	-1 (ix), h
;	genCmpEq
	inc	l
	jr	NZ,00106$
; peephole 164 changed absolute to relative conditional jump.
; peephole 84 jumped to 00106$ directly instead of via 00176$.
	inc	h
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00176$.
	jr	NZ,00106$
; peephole 164 changed absolute to relative conditional jump.
; peephole 82 removed jp by using inverse jump logic
; peephole 158 removed unused label 00177$.
;curses/newwin.c:89: return((WINDOW *) ERR);
;	genRet
;fetchPairLong
;fetchLitPair
	ld	hl, #0xffff
	jp	00122$
;	genLabel
00106$:
;curses/newwin.c:90: for (i = 0; i < num_lines; i++) {	/* make and clear the lines */
;	genAssign
;	AOP_STK for _newwin_sloc0_1_0
	ld	-6 (ix), #0x00
	ld	-5 (ix), #0x00
;	genLeftShift
;	AOP_STK for 
;	AOP_STK for _newwin_sloc1_1_0
	ld	a, 6 (ix)
	ld	-8 (ix), a
	ld	a, 7 (ix)
	ld	-7 (ix), a
	sla	-8 (ix)
	rl	-7 (ix)
;	genAssign
;	AOP_STK for _newwin_i_65536_292
	ld	-4 (ix), #0x00
	ld	-3 (ix), #0x00
;	genLabel
00120$:
;	genCmpLt
;	AOP_STK for _newwin_i_65536_292
;	AOP_STK for 
	ld	a, -4 (ix)
	sub	a, 4 (ix)
	ld	a, -3 (ix)
	sbc	a, 5 (ix)
	jp	PO, 00180$
	xor	a, #0x80
00180$:
	jp	P, 00112$
;curses/newwin.c:91: if ((win->_line[i] = (int *)calloc(num_columns, sizeof(int))) == NULL){
;	genPlus
;	AOP_STK for _newwin_win_65536_292
;	AOP_STK for _newwin_sloc2_1_0
	ld	a, -2 (ix)
	add	a, #0x1c
	ld	-10 (ix), a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	-9 (ix), a
;	genPointerGet
;	AOP_STK for _newwin_sloc2_1_0
;fetchPairLong
	pop	hl
	push	hl
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	h, (hl)
;	genLeftShift
;	AOP_STK for _newwin_i_65536_292
;fetchPairLong
	ld	e, -4 (ix)
	ld	d, -3 (ix)
	sla	e
	rl	d
;	genPlus
;fetchPairLong
	ld	l, c
	add	hl, de
;	genIpush
	push	hl
	push	de
;fetchPairLong
;fetchLitPair
	ld	bc, #0x0002
	push	bc
;	genIpush
;	AOP_STK for 
;fetchPairLong
	ld	c, 6 (ix)
	ld	b, 7 (ix)
	push	bc
;	genCall
	call	_calloc
	pop	af
	pop	af
	ld	c, l
	ld	b, h
	pop	de
	pop	hl
;	genCast
;	(registers are the same)
;	genAssign (pointer)
;	isBitvar = 0
;fetchPairLong
	ld	(hl), c
	inc	hl
	ld	(hl), b
;	genIfx
	ld	a, b
	or	a, c
	jr	NZ,00110$
; peephole 164 changed absolute to relative conditional jump.
;curses/newwin.c:92: for (j = 0; j < i; j++)	/* if error, free all the data */
;	genAssign
;fetchPairLong
;fetchLitPair
	ld	bc, #0x0000
;	genLabel
00114$:
;	genCmpLt
;	AOP_STK for _newwin_sloc0_1_0
	ld	a, c
	sub	a, -6 (ix)
	ld	a, b
	sbc	a, -5 (ix)
	jp	PO, 00183$
	xor	a, #0x80
00183$:
	jp	P, 00107$
;curses/newwin.c:93: free(win->_line[j]);
;	genPointerGet
;	AOP_STK for _newwin_sloc2_1_0
;fetchPairLong
	pop	hl
	push	hl
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
;	genCast
;	(registers are the same)
;	genIpush
	push	bc
	push	de
;	genCall
	call	_free
	pop	af
	pop	bc
;curses/newwin.c:92: for (j = 0; j < i; j++)	/* if error, free all the data */
;	genPlus
	inc	bc
;	genGoto
	jr	00114$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00107$:
;curses/newwin.c:94: free(win->_minchng);
;	genAssign
;	AOP_STK for _newwin_win_65536_292
;fetchPairLong
	ld	l, -2 (ix)
	ld	h, -1 (ix)
;	genPointerGet
;fetchPairLong
	ld	de, #0x001e
	add	hl, de
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genCast
;	(registers are the same)
;	genIpush
	push	bc
;	genCall
	call	_free
	pop	af
;curses/newwin.c:95: free(win->_maxchng);
;	genAssign
;	AOP_STK for _newwin_win_65536_292
;fetchPairLong
	ld	l, -2 (ix)
	ld	h, -1 (ix)
;	genPointerGet
;fetchPairLong
	ld	de, #0x0020
	add	hl, de
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genCast
;	(registers are the same)
;	genIpush
	push	bc
;	genCall
	call	_free
	pop	af
;curses/newwin.c:96: free(win->_line);
;	genPointerGet
;	AOP_STK for _newwin_sloc2_1_0
;fetchPairLong
	pop	hl
	push	hl
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genCast
;	(registers are the same)
;	genIpush
	push	bc
;	genCall
	call	_free
	pop	af
;curses/newwin.c:97: free(win);
;	genCast
;	AOP_STK for _newwin_win_65536_292
;fetchPairLong
	ld	c, -2 (ix)
	ld	b, -1 (ix)
;	genIpush
	push	bc
;	genCall
	call	_free
	pop	af
;curses/newwin.c:98: return((WINDOW *) ERR);
;	genRet
;fetchPairLong
;fetchLitPair
	ld	hl, #0xffff
	jr	00122$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00110$:
;curses/newwin.c:100: for (ptr = win->_line[i]; ptr < win->_line[i] + num_columns;)
;	genPointerGet
;	AOP_STK for _newwin_sloc2_1_0
;fetchPairLong
	pop	hl
	push	hl
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	h, (hl)
;	genPlus
;fetchPairLong
	ld	l, c
	add	hl, de
;	genPointerGet
;fetchPairLong
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genAssign
;	(registers are the same)
;	genLabel
00117$:
;	genPointerGet
;	AOP_STK for _newwin_sloc2_1_0
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
;fetchPairLong
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	genPlus
;	AOP_STK for _newwin_sloc1_1_0
; peephole 9 loaded a from a directly instead of going through l.
; peephole 0 removed redundant load from a into a.
	add	a, -8 (ix)
	ld	l, a
	ld	a, h
	adc	a, -7 (ix)
	ld	h, a
;	genCmpLt
	ld	a, c
	sub	a, l
	ld	a, b
	sbc	a, h
	jr	NC,00121$
; peephole 166 changed absolute to relative conditional jump.
;curses/newwin.c:101: *ptr++ = ' ' | ATR_NRM;
;	genAssign (pointer)
;	isBitvar = 0
;fetchPairLong
	ld	l, c
	ld	h, b
	ld	(hl), #0x20
	inc	hl
	ld	(hl), #0x00
;	genPlus
	inc	bc
	inc	bc
;	genGoto
	jr	00117$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00121$:
;curses/newwin.c:90: for (i = 0; i < num_lines; i++) {	/* make and clear the lines */
;	genPlus
;	AOP_STK for _newwin_i_65536_292
	inc	-4 (ix)
	jr	NZ,00184$
; peephole 164 changed absolute to relative conditional jump.
	inc	-3 (ix)
00184$:
;	genAssign
;	AOP_STK for _newwin_i_65536_292
;	AOP_STK for _newwin_sloc0_1_0
	ld	a, -4 (ix)
	ld	-6 (ix), a
	ld	a, -3 (ix)
	ld	-5 (ix), a
;	genGoto
	jp	00120$
;	genLabel
00112$:
;curses/newwin.c:104: return(win);
;	genRet
;	AOP_STK for _newwin_win_65536_292
;fetchPairLong
	ld	l, -2 (ix)
	ld	h, -1 (ix)
;	genLabel
00122$:
;curses/newwin.c:105: }
;	genEndFunction
	ld	sp, ix
	pop	ix
	ret
;curses/newwin.c:116: WINDOW *subwin(WINDOW *orig, int num_lines, int num_columns, int begy, int begx)
;	genLabel
;	genFunction
;	---------------------------------
; Function subwin
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 14 bytes.
_subwin::
	call	___sdcc_enter_ix
	ld	hl, #-14
	add	hl, sp
	ld	sp, hl
;curses/newwin.c:122: if (begy < orig->_begy || begx < orig->_begx ||
;	genAssign
;	AOP_STK for 
;	AOP_STK for _subwin_sloc0_1_0
	ld	a, 4 (ix)
	ld	-4 (ix), a
	ld	a, 5 (ix)
	ld	-3 (ix), a
;	genPlus
;	AOP_STK for _subwin_sloc0_1_0
;	AOP_STK for _subwin_sloc1_1_0
	ld	a, -4 (ix)
	add	a, #0x08
	ld	-6 (ix), a
	ld	a, -3 (ix)
	adc	a, #0x00
	ld	-5 (ix), a
;	genPointerGet
;	AOP_STK for _subwin_sloc1_1_0
;fetchPairLong
	ld	l, -6 (ix)
	ld	h, -5 (ix)
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genCmpLt
;	AOP_STK for 
	ld	a, 10 (ix)
	sub	a, c
	ld	a, 11 (ix)
	sbc	a, b
	jp	PO, 00159$
	xor	a, #0x80
00159$:
	jp	M, 00101$
;	genPlus
;	AOP_STK for _subwin_sloc0_1_0
;	AOP_STK for _subwin_sloc2_1_0
	ld	a, -4 (ix)
	add	a, #0x0a
	ld	-8 (ix), a
	ld	a, -3 (ix)
	adc	a, #0x00
	ld	-7 (ix), a
;	genPointerGet
;	AOP_STK for _subwin_sloc2_1_0
;	AOP_STK for _subwin_sloc3_1_0
;fetchPairLong
	ld	l, -8 (ix)
	ld	h, -7 (ix)
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-12 (ix), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-11 (ix), a
;	genCmpLt
;	AOP_STK for 
;	AOP_STK for _subwin_sloc3_1_0
	ld	a, 12 (ix)
	sub	a, -12 (ix)
	ld	a, 13 (ix)
	sbc	a, -11 (ix)
	jp	PO, 00160$
	xor	a, #0x80
00160$:
	jp	M, 00101$
;curses/newwin.c:123: (begy + num_lines) > (orig->_begy + orig->_maxy) ||
;	genPlus
;	AOP_STK for 
;	AOP_STK for 
	ld	a, 10 (ix)
	add	a, 6 (ix)
	ld	e, a
	ld	a, 11 (ix)
	adc	a, 7 (ix)
	ld	d, a
;	genAssign
;	AOP_STK for _subwin_sloc0_1_0
;fetchPairLong
	ld	l, -4 (ix)
	ld	h, -3 (ix)
;	genPointerGet
;	AOP_STK for _subwin_sloc4_1_0
;fetchPairLong
	inc	hl
	inc	hl
	inc	hl
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-14 (ix), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-13 (ix), a
;	genPlus
;	AOP_STK for _subwin_sloc4_1_0
;fetchPairLong
	pop	hl
	push	hl
	add	hl, bc
;	genCmpGt
	ld	a, l
	sub	a, e
	ld	a, h
	sbc	a, d
	jp	PO, 00161$
	xor	a, #0x80
00161$:
	jp	M, 00101$
;curses/newwin.c:124: (begx + num_columns) > (orig->_begx + orig->_maxx) )
;	genPlus
;	AOP_STK for 
;	AOP_STK for 
;	AOP_STK for _subwin_sloc5_1_0
	ld	a, 12 (ix)
	add	a, 8 (ix)
	ld	-2 (ix), a
	ld	a, 13 (ix)
	adc	a, 9 (ix)
	ld	-1 (ix), a
;	genAssign
;	AOP_STK for _subwin_sloc0_1_0
;fetchPairLong
	ld	l, -4 (ix)
	ld	h, -3 (ix)
;	genPointerGet
;fetchPairLong
	ld	de, #0x0006
	add	hl, de
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;	genPlus
;	AOP_STK for _subwin_sloc3_1_0
;fetchPairLong
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	add	hl, de
;	genCmpGt
;	AOP_STK for _subwin_sloc5_1_0
	ld	a, l
	sub	a, -2 (ix)
	ld	a, h
	sbc	a, -1 (ix)
	jp	PO, 00162$
	xor	a, #0x80
00162$:
	jp	P, 00102$
;	genLabel
00101$:
;curses/newwin.c:125: return((WINDOW *) ERR);
;	genRet
;fetchPairLong
;fetchLitPair
	ld	hl, #0xffff
	jp	00116$
;	genLabel
00102$:
;curses/newwin.c:127: if (num_lines == 0) num_lines = orig->_maxy - (begy - orig->_begy);
;	genIfx
;	AOP_STK for 
	ld	a, 7 (ix)
	or	a, 6 (ix)
	jr	NZ,00107$
; peephole 164 changed absolute to relative conditional jump.
;	genMinus
;	AOP_STK for 
	ld	a, 10 (ix)
	sub	a, c
	ld	c, a
	ld	a, 11 (ix)
	sbc	a, b
	ld	b, a
;	genMinus
;	AOP_STK for _subwin_sloc4_1_0
	ld	a, -14 (ix)
	sub	a, c
	ld	c, a
	ld	a, -13 (ix)
	sbc	a, b
	ld	b, a
;	genAssign
;	AOP_STK for 
	ld	6 (ix), c
	ld	7 (ix), b
;	genLabel
00107$:
;curses/newwin.c:128: if (num_columns == 0) num_columns = orig->_maxx - (begx - orig->_begx);
;	genIfx
;	AOP_STK for 
	ld	a, 9 (ix)
	or	a, 8 (ix)
	jr	NZ,00109$
; peephole 164 changed absolute to relative conditional jump.
;	genMinus
;	AOP_STK for 
;	AOP_STK for _subwin_sloc3_1_0
	ld	a, 12 (ix)
	sub	a, -12 (ix)
	ld	c, a
	ld	a, 13 (ix)
	sbc	a, -11 (ix)
	ld	b, a
;	genMinus
	ld	a, e
	sub	a, c
	ld	c, a
	ld	a, d
	sbc	a, b
	ld	b, a
;	genAssign
;	AOP_STK for 
	ld	8 (ix), c
	ld	9 (ix), b
;	genLabel
00109$:
;curses/newwin.c:129: if ((win = makenew(num_lines, num_columns, begy, begx)) == (WINDOW *) ERR)
;	genIpush
;	AOP_STK for 
;fetchPairLong
	ld	l, 12 (ix)
	ld	h, 13 (ix)
	push	hl
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
;	genIpush
;	AOP_STK for 
;fetchPairLong
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	push	hl
;	genCall
	call	_makenew
	pop	af
	pop	af
	pop	af
	pop	af
;	genAssign
;fetchPairLong
	ld	c, l
	ld	b, h
;	genCmpEq
	inc	l
	jr	NZ,00111$
; peephole 164 changed absolute to relative conditional jump.
; peephole 84 jumped to 00111$ directly instead of via 00163$.
	inc	h
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00163$.
	jr	NZ,00111$
; peephole 164 changed absolute to relative conditional jump.
; peephole 82 removed jp by using inverse jump logic
; peephole 158 removed unused label 00164$.
;curses/newwin.c:130: return((WINDOW *) ERR);
;	genRet
;fetchPairLong
;fetchLitPair
	ld	hl, #0xffff
	jp	00116$
;	genLabel
00111$:
;curses/newwin.c:133: j = begy - orig->_begy;
;	genPointerGet
;	AOP_STK for _subwin_sloc1_1_0
;fetchPairLong
	ld	l, -6 (ix)
	ld	h, -5 (ix)
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;	genMinus
;	AOP_STK for 
;	AOP_STK for _subwin_sloc5_1_0
	ld	a, 10 (ix)
	sub	a, e
	ld	-2 (ix), a
	ld	a, 11 (ix)
	sbc	a, d
	ld	-1 (ix), a
;curses/newwin.c:134: k = begx - orig->_begx;
;	genPointerGet
;	AOP_STK for _subwin_sloc2_1_0
;fetchPairLong
	ld	l, -8 (ix)
	ld	h, -7 (ix)
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;	genMinus
;	AOP_STK for 
	ld	a, 12 (ix)
	sub	a, e
	ld	l, a
	ld	a, 13 (ix)
	sbc	a, d
	ld	h, a
;	genAssign
;	(registers are the same)
;curses/newwin.c:135: for (i = 0; i < num_lines; i++) win->_line[i] = (orig->_line[j++]) + k;
;	genAssign
;	AOP_STK for _subwin_sloc4_1_0
	inc	sp
	inc	sp
	push	bc
;	genAssign
;	AOP_STK for _subwin_sloc0_1_0
;	AOP_STK for _subwin_sloc3_1_0
	ld	a, -4 (ix)
	ld	-12 (ix), a
	ld	a, -3 (ix)
	ld	-11 (ix), a
;	genLeftShift
;	AOP_STK for _subwin_sloc2_1_0
	add	hl, hl
	ld	-8 (ix), l
	ld	-7 (ix), h
;	genAssign
;	AOP_STK for _subwin_i_65536_300
	ld	-10 (ix), #0x00
	ld	-9 (ix), #0x00
;	genLabel
00114$:
;	genCmpLt
;	AOP_STK for _subwin_i_65536_300
;	AOP_STK for 
	ld	a, -10 (ix)
	sub	a, 6 (ix)
	ld	a, -9 (ix)
	sbc	a, 7 (ix)
	jp	PO, 00165$
	xor	a, #0x80
00165$:
	jp	P, 00112$
;	genPointerGet
;	AOP_STK for _subwin_sloc4_1_0
;fetchPairLong
	pop	hl
	push	hl
	ld	de, #0x001c
	add	hl, de
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;	genLeftShift
;	AOP_STK for _subwin_i_65536_300
;fetchPairLong
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	add	hl, hl
;	genPlus
	add	hl, de
	push	hl
	pop	iy
;	genPointerGet
;	AOP_STK for _subwin_sloc3_1_0
;fetchPairLong
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	de, #0x001c
	add	hl, de
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;	genAssign
;	AOP_STK for _subwin_sloc5_1_0
;fetchPairLong
	ld	l, -2 (ix)
	ld	h, -1 (ix)
;	genPlus
;	AOP_STK for _subwin_sloc5_1_0
	inc	-2 (ix)
	jr	NZ,00166$
; peephole 164 changed absolute to relative conditional jump.
	inc	-1 (ix)
00166$:
;	genLeftShift
	add	hl, hl
;fetchPairLong
;	genPlus
	add	hl, de
;	genPointerGet
;fetchPairLong
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;	genPlus
;	AOP_STK for _subwin_sloc2_1_0
;fetchPairLong
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	add	hl, de
;	genAssign (pointer)
;	isBitvar = 0
	ld	0 (iy), l
	ld	1 (iy), h
;	genPlus
;	AOP_STK for _subwin_i_65536_300
	inc	-10 (ix)
	jr	NZ,00114$
; peephole 164 changed absolute to relative conditional jump.
; peephole 84 jumped to 00114$ directly instead of via 00167$.
	inc	-9 (ix)
; peephole 158 removed unused label 00167$.
;	genGoto
	jr	00114$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00112$:
;curses/newwin.c:136: win->_flags |= _SUBWIN;
;	genPlus
;fetchPairLong
;fetchLitPair
	ld	hl, #0x000c
	add	hl, bc
;	genPointerGet
	push	hl
;fetchPairLong
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
	pop	hl
;	genOr
	set	0, e
;	genAssign (pointer)
;	isBitvar = 0
;fetchPairLong
	ld	(hl), e
	inc	hl
	ld	(hl), d
;curses/newwin.c:137: return(win);
;	genRet
;fetchPairLong
	ld	l, c
	ld	h, b
;	genLabel
00116$:
;curses/newwin.c:138: }
;	genEndFunction
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
