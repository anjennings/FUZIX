;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module options
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _idlok
	.globl _clearok
	.globl _leaveok
	.globl _scrollok
	.globl _nodelay
	.globl _keypad
	.globl _meta
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
;curses/options.c:9: void idlok(WINDOW *win, bool flag)
;	genLabel
;	genFunction
;	---------------------------------
; Function idlok
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_idlok::
;curses/options.c:11: }
;	genLabel
; peephole 158 removed unused label 00101$.
;	genEndFunction
	ret
;curses/options.c:16: void clearok(WINDOW *win, bool flag)
;	genLabel
;	genFunction
;	---------------------------------
; Function clearok
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_clearok::
;curses/options.c:18: if (win == curscr)
;	genCmpEq
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 2, size 2
; peephole 62 used hl instead of iy.
	ld	hl, #2+0
	add	hl, sp
	ld	a, (hl)
;fetchLitPair
	ld	iy, #_curscr
	sub	a, 0 (iy)
	jr	NZ,00102$
; peephole 164 changed absolute to relative conditional jump.
; peephole 84 jumped to 00102$ directly instead of via 00111$.
; peephole 62 used hl instead of iy.
	ld	hl, #2+1
	add	hl, sp
	ld	a, (hl)
;fetchLitPair
	ld	iy, #_curscr
	sub	a, 1 (iy)
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00111$.
	jr	NZ,00102$
; peephole 164 changed absolute to relative conditional jump.
; peephole 82 removed jp by using inverse jump logic
; peephole 158 removed unused label 00112$.
;curses/options.c:19: _cursvar.tmpwin->_clear = flag;
;	genPointerGet
	ld	hl, (#__cursvar + 0)
;	genPlus
;fetchPairLong
;fetchLitPair
	ld	bc, #0x0012
	add	hl, bc
;	genAssign (pointer)
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 4, size 2
;	isBitvar = 0
;fetchPairLong
	ld	iy, #4
	add	iy, sp
	ld	a, 0 (iy)
	ld	(hl), a
	inc	hl
	ld	a, 1 (iy)
	ld	(hl), a
;	genGoto
	ret
; peephole 160 replaced jump by return.
;	genLabel
00102$:
;curses/options.c:21: win->_clear = flag;
;	genAssign
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 2, size 2
;fetchPairLong
	pop	de
	pop	bc
	push	bc
	push	de
;	genPlus
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0012
	add	hl, bc
;	genAssign (pointer)
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 4, size 2
;	isBitvar = 0
;fetchPairLong
	ld	iy, #4
	add	iy, sp
	ld	a, 0 (iy)
	ld	(hl), a
	inc	hl
	ld	a, 1 (iy)
	ld	(hl), a
;	genLabel
; peephole 158 removed unused label 00104$.
;curses/options.c:22: }
;	genEndFunction
	ret
;curses/options.c:30: void leaveok(WINDOW *win, bool flag)
;	genLabel
;	genFunction
;	---------------------------------
; Function leaveok
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_leaveok::
;curses/options.c:32: win->_leave = flag;
;	genAssign
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 2, size 2
;fetchPairLong
	pop	de
	pop	bc
	push	bc
	push	de
;	genPlus
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0014
	add	hl, bc
;	genAssign (pointer)
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 4, size 2
;	isBitvar = 0
;fetchPairLong
	ld	iy, #4
	add	iy, sp
	ld	a, 0 (iy)
	ld	(hl), a
	inc	hl
	ld	a, 1 (iy)
	ld	(hl), a
;	genLabel
; peephole 158 removed unused label 00101$.
;curses/options.c:33: }
;	genEndFunction
	ret
;curses/options.c:39: void scrollok(WINDOW *win, bool flag)
;	genLabel
;	genFunction
;	---------------------------------
; Function scrollok
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_scrollok::
;curses/options.c:41: win->_scroll = flag;
;	genAssign
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 2, size 2
;fetchPairLong
	pop	de
	pop	bc
	push	bc
	push	de
;	genPlus
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0016
	add	hl, bc
;	genAssign (pointer)
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 4, size 2
;	isBitvar = 0
;fetchPairLong
	ld	iy, #4
	add	iy, sp
	ld	a, 0 (iy)
	ld	(hl), a
	inc	hl
	ld	a, 1 (iy)
	ld	(hl), a
;	genLabel
; peephole 158 removed unused label 00101$.
;curses/options.c:42: }
;	genEndFunction
	ret
;curses/options.c:49: void nodelay(WINDOW *win, bool flag)
;	genLabel
;	genFunction
;	---------------------------------
; Function nodelay
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_nodelay::
;curses/options.c:51: win->_nodelay = flag;
;	genAssign
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 2, size 2
;fetchPairLong
	pop	de
	pop	bc
	push	bc
	push	de
;	genPlus
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0018
	add	hl, bc
;	genAssign (pointer)
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 4, size 2
;	isBitvar = 0
;fetchPairLong
	ld	iy, #4
	add	iy, sp
	ld	a, 0 (iy)
	ld	(hl), a
	inc	hl
	ld	a, 1 (iy)
	ld	(hl), a
;	genLabel
; peephole 158 removed unused label 00101$.
;curses/options.c:52: }
;	genEndFunction
	ret
;curses/options.c:57: void keypad(WINDOW *win, bool flag)
;	genLabel
;	genFunction
;	---------------------------------
; Function keypad
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_keypad::
;curses/options.c:59: }
;	genLabel
; peephole 158 removed unused label 00101$.
;	genEndFunction
	ret
;curses/options.c:66: void meta(WINDOW *win, int flag)
;	genLabel
;	genFunction
;	---------------------------------
; Function meta
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_meta::
;curses/options.c:68: }
;	genLabel
; peephole 158 removed unused label 00101$.
;	genEndFunction
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
