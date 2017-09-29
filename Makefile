# Set this to the desired platform to build
#
# Useful values for general work
#
# coco2cart:	Tandy COCO2 or Dragon with 64K and IDE or SDC + cartridge flash
#		(or modified xroar)
# coco3:	Tandy COCO3 512K (or MAME)
# dragon-nx32:	Dragon 32/64 with Spinx 512K card (or modified xroar)
# msx2:		MSX2 with 128K or more and MegaFlashROM+SD interface
#		(or OpenMSX suitably configured)
# mtx:		Memotech MTX512 with SDX (or MEMU emulator)
# multicomp09:	Extended multicomp 6809
# n8vem-mark4:	N8VEM Retrobrew Z180 board
# nc100:	Amstrad NC100 (or emulator)
# p112:		DX Designs P112
# socz80:	Will Sowerbutt's FPGA SocZ80 or extended version
# trs80:	TRS80 Model 4P with 128K RAM (some other TRS80 extension
#		mappers have untested code in the tree)
# z80pack:	Z80Pack virtual Z80 platform
# zeta-v2:	Zeta retrobrew SBC
#
# Virtual platforms for in progress development work
#
# v65:		Virtual platform for 6502 development
# v65c816:	Virtual platform for 65c816 development
# v68:		Virtual platfomr for 68000 development

TARGET=coco2cart

# Get the CPU type
include Kernel/platform-$(TARGET)/target.mk

ifeq ($(USERCPU),)
	USERCPU = $(CPU)
endif

# TARGET is what we are building
# CPU is the CPU type for the kernel
# USERCPU is the CPU type for userspace and eventually may be different
# (eg for 65c816 with 6502 user)
export TARGET CPU USERCPU

all: stand ltools libs apps kernel


stand:
	(cd Standalone; make)

ltools:
	(cd Library; make; make install)

libs:
	(cd Library/libs; make -f Makefile.$(CPU))

apps:
	(cd Applications; make)

kernel:
	(cd Kernel; make)

clean:
	(cd Standalone; make clean)
	(cd Library/libs; make -f Makefile.$(CPU) clean)
	(cd Library; make clean)
	(cd Kernel; make clean)
	(cd Applications; make clean)
