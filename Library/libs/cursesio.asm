;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module cursesio
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _fputc
	.globl _strlen
	.globl _tcgetattr
	.globl _tgoto
	.globl _tputs
	.globl _tgetstr
	.globl _tgetnum
	.globl _tgetent
	.globl _exit
	.globl _ioctl
	.globl _write
	.globl __cursident
	.globl __cursgraftable
	.globl _ACS_BLOCK
	.globl _ACS_LANTERN
	.globl _ACS_BOARD
	.globl _ACS_UARROW
	.globl _ACS_DARROW
	.globl _ACS_RARROW
	.globl _ACS_LARROW
	.globl _ACS_BULLET
	.globl _ACS_PLMINUS
	.globl _ACS_DEGREE
	.globl _ACS_CKBOARD
	.globl _ACS_DIAMOND
	.globl _ACS_S9
	.globl _ACS_S1
	.globl _ACS_PLUS
	.globl _ACS_VLINE
	.globl _ACS_HLINE
	.globl _ACS_TTEE
	.globl _ACS_BTEE
	.globl _ACS_LTEE
	.globl _ACS_RTEE
	.globl _ACS_LRCORNER
	.globl _ACS_URCORNER
	.globl _ACS_LLCORNER
	.globl _ACS_ULCORNER
	.globl _vb
	.globl _bl
	.globl _ae
	.globl _as
	.globl _vs
	.globl _ve
	.globl _vi
	.globl _ue
	.globl _us
	.globl _md
	.globl _mb
	.globl _me
	.globl _mr
	.globl _se
	.globl _so
	.globl _cm
	.globl _cl
	.globl _cp
	.globl _ttytype
	.globl _tc
	.globl _termcap
	.globl _NONL
	.globl _COLS
	.globl _LINES
	.globl _curscr
	.globl _stdscr
	.globl __cursvar
	.globl __tty
	.globl __orig_tty
	.globl _fatal
	.globl _outc
	.globl _poscur
	.globl _clrscr
	.globl _setterm
	.globl _gettmode
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
__orig_tty::
	.ds 20
__tty::
	.ds 20
__cursvar::
	.ds 12
_stdscr::
	.ds 2
_curscr::
	.ds 2
_LINES::
	.ds 2
_COLS::
	.ds 2
_NONL::
	.ds 2
_termcap::
	.ds 1024
_tc::
	.ds 200
_ttytype::
	.ds 2
_arp:
	.ds 2
_cp::
	.ds 2
_cl::
	.ds 2
_cm::
	.ds 2
_so::
	.ds 2
_se::
	.ds 2
_mr::
	.ds 2
_me::
	.ds 2
_mb::
	.ds 2
_md::
	.ds 2
_us::
	.ds 2
_ue::
	.ds 2
_vi::
	.ds 2
_ve::
	.ds 2
_vs::
	.ds 2
_as::
	.ds 2
_ae::
	.ds 2
_bl::
	.ds 2
_vb::
	.ds 2
_ACS_ULCORNER::
	.ds 2
_ACS_LLCORNER::
	.ds 2
_ACS_URCORNER::
	.ds 2
_ACS_LRCORNER::
	.ds 2
_ACS_RTEE::
	.ds 2
_ACS_LTEE::
	.ds 2
_ACS_BTEE::
	.ds 2
_ACS_TTEE::
	.ds 2
_ACS_HLINE::
	.ds 2
_ACS_VLINE::
	.ds 2
_ACS_PLUS::
	.ds 2
_ACS_S1::
	.ds 2
_ACS_S9::
	.ds 2
_ACS_DIAMOND::
	.ds 2
_ACS_CKBOARD::
	.ds 2
_ACS_DEGREE::
	.ds 2
_ACS_PLMINUS::
	.ds 2
_ACS_BULLET::
	.ds 2
_ACS_LARROW::
	.ds 2
_ACS_RARROW::
	.ds 2
_ACS_DARROW::
	.ds 2
_ACS_UARROW::
	.ds 2
_ACS_BOARD::
	.ds 2
_ACS_LANTERN::
	.ds 2
_ACS_BLOCK::
	.ds 2
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
__cursgraftable::
	.ds 54
__cursident::
	.ds 28
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
;curses/cursesio.c:42: void fatal(char *s)
;	genLabel
;	genFunction
;	---------------------------------
; Function fatal
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_fatal::
;curses/cursesio.c:44: write(2, "curses: ", 8);
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0008
	push	hl
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #___str_0
	push	hl
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0002
	push	hl
;	genCall
	call	_write
	pop	af
	pop	af
	pop	af
;curses/cursesio.c:45: write(2, s, strlen(s));
;	genIpush
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 2, size 2
;fetchPairLong
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
;	genCall
	call	_strlen
	pop	af
;	genCast
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 2, size 2
;fetchPairLong
	pop	de
	pop	bc
	push	bc
	push	de
;	genIpush
	push	hl
;	genIpush
	push	bc
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0002
	push	hl
;	genCall
	call	_write
	pop	af
	pop	af
;curses/cursesio.c:46: write(2, "\n", 1);
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0001
; peephole 143 used ex to move hl onto the stack.
	ex	(sp),hl
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #___str_1
	push	hl
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0002
	push	hl
;	genCall
	call	_write
	pop	af
	pop	af
;curses/cursesio.c:47: exit(1);
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0001
; peephole 143 used ex to move hl onto the stack.
	ex	(sp),hl
;	genCall
	call	_exit
	pop	af
;	genLabel
; peephole 158 removed unused label 00101$.
;curses/cursesio.c:48: }
;	genEndFunction
	ret
___str_0:
	.ascii "curses: "
	.db 0x00
___str_1:
	.db 0x0a
	.db 0x00
;curses/cursesio.c:51: int outc(int c)
;	genLabel
;	genFunction
;	---------------------------------
; Function outc
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_outc::
;curses/cursesio.c:53: return putchar(c);
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #_stdout
	push	hl
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
	call	_fputc
	pop	af
	pop	af
;	genRet
;fetchPairLong
;	genLabel
; peephole 158 removed unused label 00101$.
;curses/cursesio.c:54: }
;	genEndFunction
	ret
;curses/cursesio.c:57: void poscur(int r, int c)
;	genLabel
;	genFunction
;	---------------------------------
; Function poscur
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_poscur::
;curses/cursesio.c:59: tputs(tgoto(cm, c, r), 1, outc);
;	genIpush
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 2, size 2
;fetchPairLong
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
;	genIpush
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 4, size 2
;fetchPairLong
; peephole 64 used hl instead of iy.
	ld	hl, #6
	add	hl, sp
; peephole 49 pushed bc instead of hl.
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
;	genIpush
;fetchPairLong
	ld	hl, (_cm)
	push	hl
;	genCall
	call	_tgoto
	pop	af
	pop	af
	pop	af
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	bc, #_outc
	push	bc
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	bc, #0x0001
	push	bc
;	genIpush
	push	hl
;	genCall
	call	_tputs
	pop	af
	pop	af
	pop	af
;	genLabel
; peephole 158 removed unused label 00101$.
;curses/cursesio.c:60: }
;	genEndFunction
	ret
;curses/cursesio.c:63: void clrscr(void)
;	genLabel
;	genFunction
;	---------------------------------
; Function clrscr
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_clrscr::
;curses/cursesio.c:65: tputs(cl, 1, outc);
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
	ld	hl, (_cl)
	push	hl
;	genCall
	call	_tputs
	pop	af
	pop	af
	pop	af
;	genLabel
; peephole 158 removed unused label 00101$.
;curses/cursesio.c:66: }
;	genEndFunction
	ret
;curses/cursesio.c:135: int setterm(char *type)
;	genLabel
;	genFunction
;	---------------------------------
; Function setterm
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 11 bytes.
_setterm::
	call	___sdcc_enter_ix
	ld	hl, #-11
	add	hl, sp
	ld	sp, hl
;curses/cursesio.c:143: if (tgetent(termcap, type) != 1) return ERR;
;	genIpush
;	AOP_STK for 
;fetchPairLong
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #_termcap
	push	hl
;	genCall
	call	_tgetent
	pop	af
	pop	af
;	genCmpEq
	ld	a, l
	dec	a
	or	a, h
	jr	Z,00102$
; peephole 163 changed absolute to relative conditional jump.
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00165$.
;	genRet
;fetchPairLong
;fetchLitPair
	ld	hl, #0xffff
	jp	00114$
;	genLabel
00102$:
;curses/cursesio.c:146: if (ioctl(0, TIOCGWINSZ, &wsize) == 0) {
;	genAddrOf
;	AOP_STK for _setterm_sloc0_1_0
	ld	hl, #0x0000
	add	hl, sp
;	genCast
;	AOP_STK for _setterm_sloc0_1_0
;fetchPairLong
	ld	-2 (ix), l
	ld	-1 (ix), h
; peephole 11 loaded cb from lh directly instead of going through -2 (ix) -1 (ix).
;	genIpush
; peephole 48 pushed hl instead of bc.
	push	hl
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #0x000a
	push	hl
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	l, #0x00
	push	hl
;	genCall
	call	_ioctl
	pop	af
	pop	af
	pop	af
;	genIfx
	ld	a, h
	or	a, l
	jr	NZ,00104$
; peephole 164 changed absolute to relative conditional jump.
;curses/cursesio.c:147: LINES = wsize.ws_row != 0 ? wsize.ws_row : tgetnum("li");
;	genPointerGet
;	AOP_STK for _setterm_sloc0_1_0
;fetchPairLong
	ld	l, -2 (ix)
	ld	h, -1 (ix)
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	h, (hl)
;	genIfx
	ld	a, h
	or	a, c
	jr	Z,00116$
; peephole 163 changed absolute to relative conditional jump.
;	genAssign
;fetchPairLong
	ld	l, c
;	genGoto
	jr	00117$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00116$:
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #___str_2
	push	hl
;	genCall
	call	_tgetnum
	pop	af
;	genAssign
;	(registers are the same)
;	genLabel
00117$:
;	genAssign
	ld	(_LINES), hl
;curses/cursesio.c:148: COLS = wsize.ws_col != 0 ? wsize.ws_col : tgetnum("co");
;	genAssign
;	AOP_STK for _setterm_sloc0_1_0
;fetchPairLong
	ld	l, -2 (ix)
	ld	h, -1 (ix)
;	genPointerGet
;fetchPairLong
	inc	hl
	inc	hl
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	h, (hl)
;	genIfx
	ld	a, h
	or	a, c
	jr	Z,00118$
; peephole 163 changed absolute to relative conditional jump.
;	genAssign
;fetchPairLong
	ld	l, c
;	genGoto
	jr	00119$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00118$:
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #___str_3
	push	hl
;	genCall
	call	_tgetnum
	pop	af
;	genAssign
;	(registers are the same)
;	genLabel
00119$:
;	genAssign
	ld	(_COLS), hl
;	genGoto
	jr	00105$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00104$:
;curses/cursesio.c:151: LINES = tgetnum("li");
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #___str_2
	push	hl
;	genCall
	call	_tgetnum
	pop	af
;	genAssign
	ld	(_LINES), hl
;curses/cursesio.c:152: COLS = tgetnum("co");
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #___str_3
	push	hl
;	genCall
	call	_tgetnum
	pop	af
;	genAssign
	ld	(_COLS), hl
;	genLabel
00105$:
;curses/cursesio.c:157: arp = tc;
;	genAddrOf
	ld	hl, #_tc+0
;	genCast
	ld	(_arp), hl
;curses/cursesio.c:158: cl = tgetstr("cl", &arp);
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #_arp
	push	hl
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #___str_4
	push	hl
;	genCall
	call	_tgetstr
	pop	af
	pop	af
;	genAssign
	ld	(_cl), hl
;curses/cursesio.c:159: so = tgetstr("so", &arp);
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #_arp
	push	hl
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #___str_5
	push	hl
;	genCall
	call	_tgetstr
	pop	af
	pop	af
;	genAssign
	ld	(_so), hl
;curses/cursesio.c:160: se = tgetstr("se", &arp);
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #_arp
	push	hl
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #___str_6
	push	hl
;	genCall
	call	_tgetstr
	pop	af
	pop	af
;	genAssign
	ld	(_se), hl
;curses/cursesio.c:161: cm = tgetstr("cm", &arp);
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #_arp
	push	hl
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #___str_7
	push	hl
;	genCall
	call	_tgetstr
	pop	af
	pop	af
;	genAssign
	ld	(_cm), hl
;curses/cursesio.c:162: mr = tgetstr("mr", &arp);
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #_arp
	push	hl
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #___str_8
	push	hl
;	genCall
	call	_tgetstr
	pop	af
	pop	af
;	genAssign
	ld	(_mr), hl
;curses/cursesio.c:163: me = tgetstr("me", &arp);
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #_arp
	push	hl
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #___str_9
	push	hl
;	genCall
	call	_tgetstr
	pop	af
	pop	af
;	genAssign
	ld	(_me), hl
;curses/cursesio.c:164: mb = tgetstr("mb", &arp);
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #_arp
	push	hl
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #___str_10
	push	hl
;	genCall
	call	_tgetstr
	pop	af
	pop	af
;	genAssign
	ld	(_mb), hl
;curses/cursesio.c:165: md = tgetstr("md", &arp);
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #_arp
	push	hl
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #___str_11
	push	hl
;	genCall
	call	_tgetstr
	pop	af
	pop	af
;	genAssign
	ld	(_md), hl
;curses/cursesio.c:166: us = tgetstr("us", &arp);
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #_arp
	push	hl
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #___str_12
	push	hl
;	genCall
	call	_tgetstr
	pop	af
	pop	af
;	genAssign
	ld	(_us), hl
;curses/cursesio.c:167: ue = tgetstr("ue", &arp);
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #_arp
	push	hl
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #___str_13
	push	hl
;	genCall
	call	_tgetstr
	pop	af
	pop	af
;	genAssign
	ld	(_ue), hl
;curses/cursesio.c:168: vi = tgetstr("vi", &arp);
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #_arp
	push	hl
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #___str_14
	push	hl
;	genCall
	call	_tgetstr
	pop	af
	pop	af
;	genAssign
	ld	(_vi), hl
;curses/cursesio.c:169: ve = tgetstr("ve", &arp);
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #_arp
	push	hl
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #___str_15
	push	hl
;	genCall
	call	_tgetstr
	pop	af
	pop	af
;	genAssign
	ld	(_ve), hl
;curses/cursesio.c:170: vs = tgetstr("vs", &arp);
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #_arp
	push	hl
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #___str_16
	push	hl
;	genCall
	call	_tgetstr
	pop	af
	pop	af
;	genAssign
	ld	(_vs), hl
;curses/cursesio.c:171: as = tgetstr("as", &arp);
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #_arp
	push	hl
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #___str_17
	push	hl
;	genCall
	call	_tgetstr
	pop	af
	pop	af
;	genAssign
	ld	(_as), hl
;curses/cursesio.c:172: ae = tgetstr("ae", &arp);
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #_arp
	push	hl
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #___str_18
	push	hl
;	genCall
	call	_tgetstr
	pop	af
	pop	af
;	genAssign
	ld	(_ae), hl
;curses/cursesio.c:173: ac = (unsigned char *) tgetstr("ac", &arp);
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #_arp
	push	hl
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #___str_19
	push	hl
;	genCall
	call	_tgetstr
	pop	af
;	genAssign
;	(registers are the same)
;curses/cursesio.c:174: bl = tgetstr("bl", &arp);
;	genIpush
; peephole 48 pushed hl instead of bc.
; peephole 142 used ex to move hl onto the stack.
	ex	(sp),hl
;fetchPairLong
;fetchLitPair
	ld	hl, #_arp
	push	hl
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #___str_20
	push	hl
;	genCall
	call	_tgetstr
	pop	af
	pop	af
	pop	bc
;	genAssign
	ld	(_bl), hl
;curses/cursesio.c:175: vb = tgetstr("vb", &arp);
;	genIpush
	push	bc
;fetchPairLong
;fetchLitPair
	ld	hl, #_arp
	push	hl
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #___str_21
	push	hl
;	genCall
	call	_tgetstr
	pop	af
	pop	af
	pop	bc
;	genAssign
	ld	(_vb), hl
;curses/cursesio.c:177: if (ac) {
;	genIfx
	ld	a, b
	or	a, c
	jr	Z,00113$
; peephole 163 changed absolute to relative conditional jump.
;curses/cursesio.c:178: while (*ac) {
;	genLabel
00109$:
;	genPointerGet
;	AOP_STK for _setterm_sloc0_1_0
	ld	a, (bc)
;	genIfx
;	AOP_STK for _setterm_sloc0_1_0
; peephole 33 loaded a from a instead of going through -2 (ix).
	ld	-2 (ix), a
; peephole 0 removed redundant load from a into a.
	or	a, a
	jr	Z,00113$
; peephole 163 changed absolute to relative conditional jump.
;curses/cursesio.c:180: while (*ac != _cursident[i]) i++;
;	genAssign
;fetchPairLong
;fetchLitPair
	ld	de, #0x0000
;	genLabel
00106$:
;	genPlus
;fetchPairLong
;fetchLitPair
	ld	hl, #__cursident
	add	hl, de
;	genPointerGet
;	AOP_STK for _setterm_sloc1_1_0
	ld	a, (hl)
	ld	-3 (ix), a
;	genCmpEq
;	AOP_STK for _setterm_sloc0_1_0
;	AOP_STK for _setterm_sloc1_1_0
	ld	a, -2 (ix)
	sub	a, -3 (ix)
	jr	Z,00108$
; peephole 163 changed absolute to relative conditional jump.
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00166$.
;	genPlus
	inc	de
;	genGoto
	jr	00106$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00108$:
;curses/cursesio.c:181: _cursgraftable[i] = *++ac | A_ALTCHARSET;
;	genLeftShift
;fetchPairLong
	sla	e
	rl	d
;	genPlus
;fetchPairLong
;fetchLitPair
	ld	iy, #__cursgraftable
;fetchPairLong
	add	iy, de
;	genPlus
	inc	bc
;	genPointerGet
	ld	a, (bc)
;	genCast
	ld	e, a
	ld	d, #0x00
;	genOr
	set	5, d
;	genAssign (pointer)
;	isBitvar = 0
	ld	0 (iy), e
	ld	1 (iy), d
;curses/cursesio.c:182: ac++;
;	genPlus
	inc	bc
;	genGoto
	jr	00109$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00113$:
;curses/cursesio.c:186: ACS_ULCORNER = _cursgraftable[UPLEFT];
;	genPointerGet
	ld	hl, #__cursgraftable + 26
;	_moveFrom_tpair_()
	ld	a, (hl)
;fetchLitPair
	ld	iy, #_ACS_ULCORNER
	ld	0 (iy), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
;fetchLitPair
	ld	1 (iy), a
;curses/cursesio.c:187: ACS_LLCORNER = _cursgraftable[DOWNLEFT];
;	genPointerGet
	ld	hl, #__cursgraftable + 28
;	_moveFrom_tpair_()
	ld	a, (hl)
;fetchLitPair
	ld	iy, #_ACS_LLCORNER
	ld	0 (iy), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
;fetchLitPair
	ld	1 (iy), a
;curses/cursesio.c:188: ACS_URCORNER = _cursgraftable[UPRIGHT];
;	genPointerGet
	ld	hl, #__cursgraftable + 24
;	_moveFrom_tpair_()
	ld	a, (hl)
;fetchLitPair
	ld	iy, #_ACS_URCORNER
	ld	0 (iy), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
;fetchLitPair
	ld	1 (iy), a
;curses/cursesio.c:189: ACS_LRCORNER = _cursgraftable[DOWNRIGHT];
;	genPointerGet
	ld	hl, #__cursgraftable + 22
;	_moveFrom_tpair_()
	ld	a, (hl)
;fetchLitPair
	ld	iy, #_ACS_LRCORNER
	ld	0 (iy), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
;fetchLitPair
	ld	1 (iy), a
;curses/cursesio.c:190: ACS_RTEE = _cursgraftable[TEERIGHT];
;	genPointerGet
	ld	hl, #__cursgraftable + 44
;	_moveFrom_tpair_()
	ld	a, (hl)
;fetchLitPair
	ld	iy, #_ACS_RTEE
	ld	0 (iy), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
;fetchLitPair
	ld	1 (iy), a
;curses/cursesio.c:191: ACS_LTEE = _cursgraftable[TEELEFT];
;	genPointerGet
	ld	hl, #__cursgraftable + 42
;	_moveFrom_tpair_()
	ld	a, (hl)
;fetchLitPair
	ld	iy, #_ACS_LTEE
	ld	0 (iy), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
;fetchLitPair
	ld	1 (iy), a
;curses/cursesio.c:192: ACS_BTEE = _cursgraftable[TEEHEAD];
;	genPointerGet
	ld	hl, #__cursgraftable + 46
;	_moveFrom_tpair_()
	ld	a, (hl)
;fetchLitPair
	ld	iy, #_ACS_BTEE
	ld	0 (iy), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
;fetchLitPair
	ld	1 (iy), a
;curses/cursesio.c:193: ACS_TTEE = _cursgraftable[TEENORMAL];
;	genPointerGet
	ld	hl, #__cursgraftable + 48
;	_moveFrom_tpair_()
	ld	a, (hl)
;fetchLitPair
	ld	iy, #_ACS_TTEE
	ld	0 (iy), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
;fetchLitPair
	ld	1 (iy), a
;curses/cursesio.c:194: ACS_HLINE = _cursgraftable[MIDLINE];
;	genPointerGet
	ld	hl, #__cursgraftable + 36
;	_moveFrom_tpair_()
	ld	a, (hl)
;fetchLitPair
	ld	iy, #_ACS_HLINE
	ld	0 (iy), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
;fetchLitPair
	ld	1 (iy), a
;curses/cursesio.c:195: ACS_VLINE = _cursgraftable[VERTLINE];
;	genPointerGet
	ld	hl, #__cursgraftable + 50
;	_moveFrom_tpair_()
	ld	a, (hl)
;fetchLitPair
	ld	iy, #_ACS_VLINE
	ld	0 (iy), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
;fetchLitPair
	ld	1 (iy), a
;curses/cursesio.c:196: ACS_PLUS = _cursgraftable[CROSS];
;	genPointerGet
	ld	hl, #__cursgraftable + 30
;	_moveFrom_tpair_()
	ld	a, (hl)
;fetchLitPair
	ld	iy, #_ACS_PLUS
	ld	0 (iy), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
;fetchLitPair
	ld	1 (iy), a
;curses/cursesio.c:197: ACS_S1 = _cursgraftable[UPLINE];
;	genPointerGet
	ld	hl, #__cursgraftable + 32
;	_moveFrom_tpair_()
	ld	a, (hl)
;fetchLitPair
	ld	iy, #_ACS_S1
	ld	0 (iy), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
;fetchLitPair
	ld	1 (iy), a
;curses/cursesio.c:198: ACS_S9 = _cursgraftable[DOWNLINE];
;	genPointerGet
	ld	hl, #__cursgraftable + 40
;	_moveFrom_tpair_()
	ld	a, (hl)
;fetchLitPair
	ld	iy, #_ACS_S9
	ld	0 (iy), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
;fetchLitPair
	ld	1 (iy), a
;curses/cursesio.c:199: ACS_DIAMOND = _cursgraftable[DIAMOND];
;	genPointerGet
	ld	hl, #__cursgraftable + 16
;	_moveFrom_tpair_()
	ld	a, (hl)
;fetchLitPair
	ld	iy, #_ACS_DIAMOND
	ld	0 (iy), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
;fetchLitPair
	ld	1 (iy), a
;curses/cursesio.c:200: ACS_CKBOARD = _cursgraftable[GREYSQUARE];
;	genPointerGet
	ld	hl, #__cursgraftable + 10
;	_moveFrom_tpair_()
	ld	a, (hl)
;fetchLitPair
	ld	iy, #_ACS_CKBOARD
	ld	0 (iy), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
;fetchLitPair
	ld	1 (iy), a
;curses/cursesio.c:201: ACS_DEGREE = _cursgraftable[DEGREE];
;	genPointerGet
	ld	hl, #__cursgraftable + 18
;	_moveFrom_tpair_()
	ld	a, (hl)
;fetchLitPair
	ld	iy, #_ACS_DEGREE
	ld	0 (iy), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
;fetchLitPair
	ld	1 (iy), a
;curses/cursesio.c:202: ACS_PLMINUS = _cursgraftable[PLUSMINUS];
;	genPointerGet
	ld	hl, #__cursgraftable + 20
;	_moveFrom_tpair_()
	ld	a, (hl)
;fetchLitPair
	ld	iy, #_ACS_PLMINUS
	ld	0 (iy), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
;fetchLitPair
	ld	1 (iy), a
;curses/cursesio.c:203: ACS_BULLET = 'o';		/* where the hell is a bullet defined in
;	genAssign
;fetchPairLong
;fetchLitPair
	ld	hl, #0x006f
	ld	(_ACS_BULLET), hl
;curses/cursesio.c:205: ACS_LARROW = _cursgraftable[LEFTARROW];
;	genPointerGet
	ld	hl, #__cursgraftable + 2
;	_moveFrom_tpair_()
	ld	a, (hl)
;fetchLitPair
	ld	iy, #_ACS_LARROW
	ld	0 (iy), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
;fetchLitPair
	ld	1 (iy), a
;curses/cursesio.c:206: ACS_RARROW = _cursgraftable[RIGHTARROW];
;	genPointerGet
	ld	hl, #__cursgraftable + 0
;	_moveFrom_tpair_()
	ld	a, (hl)
;fetchLitPair
	ld	iy, #_ACS_RARROW
	ld	0 (iy), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
;fetchLitPair
	ld	1 (iy), a
;curses/cursesio.c:207: ACS_DARROW = _cursgraftable[DOWNARROW];
;	genPointerGet
	ld	hl, #__cursgraftable + 4
;	_moveFrom_tpair_()
	ld	a, (hl)
;fetchLitPair
	ld	iy, #_ACS_DARROW
	ld	0 (iy), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
;fetchLitPair
	ld	1 (iy), a
;curses/cursesio.c:208: ACS_UARROW = _cursgraftable[UPARROW];
;	genPointerGet
	ld	hl, #__cursgraftable + 6
;	_moveFrom_tpair_()
	ld	a, (hl)
;fetchLitPair
	ld	iy, #_ACS_UARROW
	ld	0 (iy), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
;fetchLitPair
	ld	1 (iy), a
;curses/cursesio.c:209: ACS_BOARD = _cursgraftable[EMPTYSQUARE];
;	genPointerGet
	ld	hl, #__cursgraftable + 12
;	_moveFrom_tpair_()
	ld	a, (hl)
;fetchLitPair
	ld	iy, #_ACS_BOARD
	ld	0 (iy), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
;fetchLitPair
	ld	1 (iy), a
;curses/cursesio.c:210: ACS_LANTERN = _cursgraftable[LATERN];
;	genPointerGet
	ld	hl, #__cursgraftable + 14
;	_moveFrom_tpair_()
	ld	a, (hl)
;fetchLitPair
	ld	iy, #_ACS_LANTERN
	ld	0 (iy), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
;fetchLitPair
	ld	1 (iy), a
;curses/cursesio.c:211: ACS_BLOCK = _cursgraftable[FULLSQUARE];
;	genPointerGet
	ld	hl, #__cursgraftable + 8
;	_moveFrom_tpair_()
	ld	a, (hl)
;fetchLitPair
	ld	iy, #_ACS_BLOCK
	ld	0 (iy), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
;fetchLitPair
	ld	1 (iy), a
;curses/cursesio.c:213: return OK;
;	genRet
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0000
;	genLabel
00114$:
;curses/cursesio.c:214: }
;	genEndFunction
	ld	sp, ix
	pop	ix
	ret
___str_2:
	.ascii "li"
	.db 0x00
___str_3:
	.ascii "co"
	.db 0x00
___str_4:
	.ascii "cl"
	.db 0x00
___str_5:
	.ascii "so"
	.db 0x00
___str_6:
	.ascii "se"
	.db 0x00
___str_7:
	.ascii "cm"
	.db 0x00
___str_8:
	.ascii "mr"
	.db 0x00
___str_9:
	.ascii "me"
	.db 0x00
___str_10:
	.ascii "mb"
	.db 0x00
___str_11:
	.ascii "md"
	.db 0x00
___str_12:
	.ascii "us"
	.db 0x00
___str_13:
	.ascii "ue"
	.db 0x00
___str_14:
	.ascii "vi"
	.db 0x00
___str_15:
	.ascii "ve"
	.db 0x00
___str_16:
	.ascii "vs"
	.db 0x00
___str_17:
	.ascii "as"
	.db 0x00
___str_18:
	.ascii "ae"
	.db 0x00
___str_19:
	.ascii "ac"
	.db 0x00
___str_20:
	.ascii "bl"
	.db 0x00
___str_21:
	.ascii "vb"
	.db 0x00
;curses/cursesio.c:216: void gettmode(void)
;	genLabel
;	genFunction
;	---------------------------------
; Function gettmode
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 0 bytes.
_gettmode::
;curses/cursesio.c:218: tcgetattr(0, &_orig_tty);
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #__orig_tty
	push	hl
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0000
	push	hl
;	genCall
	call	_tcgetattr
	pop	af
;curses/cursesio.c:219: tcgetattr(0, &_tty);
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #__tty
; peephole 143 used ex to move hl onto the stack.
	ex	(sp),hl
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0000
	push	hl
;	genCall
	call	_tcgetattr
	pop	af
	pop	af
;curses/cursesio.c:220: _cursvar.echoit = (_tty.c_lflag & ECHO) != 0;
;	genPointerGet
	ld	hl, (#(__tty + 0x0006) + 0)
;	genAnd
	ld	a, l
	and	a, #0x01
;	genNot
; peephole 9 loaded a from #0x00 directly instead of going through b.
; peephole 1 removed dead load from a into c.
	or	a,#0x00
; peephole 99 removed load by reordering or arguments.
	sub	a,#0x01
	ld	a, #0x00
	rla
;	genNot
	xor	a, #0x01
;	genCast
	ld	c, a
	ld	b, #0x00
;	genAssign (pointer)
;	isBitvar = 0
	ld	((__cursvar + 0x000a)), bc
;curses/cursesio.c:221: _cursvar.rawmode = (_tty.c_lflag & (ICANON|ISIG)) == 0;
;	genPointerGet
	ld	hl, (#(__tty + 0x0006) + 0)
;	genAnd
	ld	a, l
	and	a, #0x50
	ld	c, a
	ld	b, #0x00
;	genCmpEq
	ld	a, c
	or	a, a
	or	a, b
; peephole 164 changed absolute to relative conditional jump.
; peephole 162 changed absolute to relative unconditional jump.
	jr	NZ, 00103$
	ld	a, #0x01
	.db	#0x20
; peephole 169xnz used jr NZ opcode to jump over 1-byte instruction.
00103$:
	xor	a, a
00104$:
;	genCast
	ld	c, a
	ld	b, #0x00
;	genAssign (pointer)
;	isBitvar = 0
	ld	((__cursvar + 0x0006)), bc
;curses/cursesio.c:222: _cursvar.cbrkmode = (_tty.c_lflag & (ICANON|ISIG)) == ISIG;
;	genPointerGet
	ld	hl, (#(__tty + 0x0006) + 0)
;	genAnd
	ld	a, l
	and	a, #0x50
	ld	c, a
	ld	b, #0x00
;	genCmpEq
	ld	a, c
	sub	a, #0x40
	or	a, b
; peephole 164 changed absolute to relative conditional jump.
; peephole 162 changed absolute to relative unconditional jump.
	jr	NZ, 00105$
	ld	a, #0x01
	.db	#0x20
; peephole 169xnz used jr NZ opcode to jump over 1-byte instruction.
00105$:
	xor	a, a
00106$:
;	genCast
	ld	c, a
	ld	b, #0x00
;	genAssign (pointer)
;	isBitvar = 0
	ld	((__cursvar + 0x0008)), bc
;curses/cursesio.c:223: NONL = (_tty.c_iflag & ICRNL) != 0;
;	genPointerGet
	ld	hl, (#__tty + 0)
;	genAnd
	ld	a, l
	and	a, #0x02
;	genNot
; peephole 9 loaded a from #0x00 directly instead of going through b.
; peephole 1 removed dead load from a into c.
	or	a,#0x00
; peephole 99 removed load by reordering or arguments.
	sub	a,#0x01
	ld	a, #0x00
	rla
;	genNot
	xor	a, #0x01
;	genCast
;fetchLitPair
	ld	iy, #_NONL
	ld	0 (iy), a
;fetchLitPair
	ld	1 (iy), #0x00
;	genLabel
; peephole 158 removed unused label 00101$.
;curses/cursesio.c:224: }
;	genEndFunction
	ret
	.area _CODE
	.area _INITIALIZER
__xinit___cursgraftable:
	.dw #0x003e
	.dw #0x003c
	.dw #0x0076
	.dw #0x005e
	.dw #0x0023
	.dw #0x003a
	.dw #0x0020
	.dw #0x0023
	.dw #0x002b
	.dw #0x0027
	.dw #0x0023
	.dw #0x002b
	.dw #0x002b
	.dw #0x002b
	.dw #0x002b
	.dw #0x002b
	.dw #0x002d
	.dw #0x0020
	.dw #0x002d
	.dw #0x0020
	.dw #0x005f
	.dw #0x002b
	.dw #0x002b
	.dw #0x002b
	.dw #0x002b
	.dw #0x007c
	.db 0x00
	.db 0x00
__xinit___cursident:
	.ascii "+,.-0ahI`fgjklmnopqrstuvwx~"
	.db 0x00
	.area _CABS (ABS)
