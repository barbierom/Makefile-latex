#TODO
#	1)[ x ]	compile also for the pdf
#	2)[ x ]	compile with bibliograpy
#	3)[ x ]	create a compressed dir if of the source and dvi files
#	4)[ x ]	higligths the outptut of the command makefile
#	5)[ x ]	insert a help command for the Makefile


################### domument setting
PRINCIPALE 		= main
BIBLIOGRAFIA 		= bibliografia.bib

PRINCIPALE_TEX 		= $(PRINCIPALE).tex
PRINCIPALE_DVI 		= $(PRINCIPALE).dvi
PRINCIPALE_PDF 		= $(PRINCIPALE).pdf
PRINCIPALE_DONE		= .$(PRINCIPALE).done
FILE_CLEAN 		= *.aux *.bbl *.blg *.brf *.idx *.ilg *.ind  *.toc *.xml *.out *-blx.bib *.log *.snm *.nav
FILE_DISTCLEAN 		= $(PRINCIPALE_PDF) $(PRINCIPALE_DONE)

OUTPUTS 		= Outputs
FIGURES			= Figures
CONTENTS		= Contents

#################### color code
COLOR_RESET=\033[0;39;49m
COLOR_GREEN=\033[1;32m
COLOR_BLUE=\033[0;34m
COLOR_RED=\033[0;31m
COLOR_PURP=\033[1;35m
COLOR_ORNG=\033[1;31m
COLOR_YELO=\033[1;33m
COLOR_GRAY=\033[1;30m
COLOR_WHIT=\033[1;37m

START_STRING=[ $(COLOR_PURP)Start$(COLOR_RESET) ]
OK_STRING=[ $(COLOR_GREEN)OK$(COLOR_RESET) ]
ERROR_STRING=[ $(COLOR_RED)Error$(COLOR_RESET) ]
DONE_STRING=[ $(COLOR_GREEN)Done$(COLOR_RESET) ]


.PHONY: dvi dvishow pdf pdfshow clean distclean help
#.DEFAULT_GOAL:= help  # if not commented, the 'make' command will give you 'make help' command

#################### all
all: pdf ## all -->  generation of pdf

#################### pdf
pdf: $(PRINCIPALE_DONE) ## generation of pdf file 
	
pdfshow: ## show the pdf file using evince
	evince  $(PRINCIPALE_PDF)

$(PRINCIPALE_DONE): $(PRINCIPALE_TEX) ##
	@echo "$(START_STRING) $(COLOR_ORNG)pdflatex$(COLOR_RESET) compling ..."	
	pdflatex $(PRINCIPALE)
	@echo "$(START_STRING) $(COLOR_ORNG)bibtex$(COLOR_RESET) compling ..."	
	-bibtex $(PRINCIPALE)
	#@echo "$(START_STRING) $(COLOR_ORNG)makeindex$(COLOR_RESET) compling ..."	
	#-makeindex $(PRINCIPALE)
	@echo "$(START_STRING) $(COLOR_ORNG)pdflatex$(COLOR_RESET) compling ..."	
	pdflatex $(PRINCIPALE)
	@echo "$(START_STRING) $(COLOR_ORNG)pdflatex$(COLOR_RESET) compling ..."	
	pdflatex $(PRINCIPALE)
	@echo "$(START_STRING) $(COLOR_ORNG)move outputs $(COLOR_RESET) ..."	
	-mkdir $(OUTPUTS)	
	-mv $(FILE_CLEAN) $(OUTPUTS)/
	echo "good job bro" >> $(PRINCIPALE_DONE)
	@echo "$(DONE_STRING)"
	evince $(PRINCIPALE_PDF)


################### compress working directory
zip: ## create a zip directory
	-zip -r $(PRINCIPALE).zip *

################### clean functions

clean: ## remove latex files the pdf and the .done file
	-rm -f $(OUTPUTS)/*.*
	-rm -f $(FILE_DISTCLEAN)
	-rm $(PRINCIPALE).zip

################### create a mini man
help: ## get some help :)
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'



