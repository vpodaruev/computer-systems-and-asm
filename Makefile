## config file
MKRC ?= latexmkrc

## source *.tex file
SOURCE ?= seminars

## LaTeX compiler output *.pdf file
TARGET ?= $(SOURCE)

## LaTeX version
BACKEND ?= -lualatex

## -synctex=1    -- synchronization file between source and PDF for IDE
## -shell-escape -- required for minted and pythontex packages
LATEXFLAGS ?= -synctex=1 -shell-escape -halt-on-error -file-line-error

BIBERFLAGS ?= # --fixinits

TIMERON ?= # show CPU usage

LATEXMKFLAGS ?= -silent

## Makefile options
MAKEFLAGS := -s
.DEFAULT_GOAL := all
.NOTPARALLEL:


export LATEXFLAGS
export BIBERFLAGS
export TIMERON


all:
	latexmk -norc -r $(MKRC) $(LATEXMKFLAGS) $(BACKEND) -latexoption="$(LATEXFLAGS)" -jobname=$(TARGET) $(SOURCE)


clean:
	latexmk -norc -r $(MKRC) -f $(LATEXMKFLAGS) $(BACKEND) -jobname=$(TARGET) -c $(SOURCE)

cleanall: clean
	rm -f $(SOURCE).synctex.gz
	rm -rf __pycache__

distclean:
	latexmk -norc -r $(MKRC) -f $(LATEXMKFLAGS) $(BACKEND) -jobname=$(TARGET) -C $(SOURCE)
	rm -rf __pycache__


force: all
force: LATEXMKFLAGS := $(LATEXMKFLAGS) -g
force:


.PHONY: all clean cleanall distclean force
