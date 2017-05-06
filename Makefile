#TODO
#	1)[   ]	compile also for the pdf
#	2)[   ]	compile with and without bibliograpy
#	3)[   ]	create a compressed dir if of the source and dvi files
#	4)[ x ]	higligths the outptut of the command makefile
#	5)[ x ]	insert a help command for the Makefile


################### domument setting
PRINCIPALE 		= main
BIBLIOGRAFIA 		= bibliografia.bib

PRINCIPALE_TEX 		= $(PRINCIPALE).tex
PRINCIPALE_DVI 		= $(PRINCIPALE).dvi
PRINCIPALE_PDF 		= $(PRINCIPALE).pdf
FILE_CLEAN 		= *.aux *.bbl *.blg *.brf *.idx *.ilg *.ind *.log *.toc
FILE_DISTCLEAN 		= $(PRINCIPALE_DVI)$ $(PRINCIPALE_PDF)

OUTPUTS 		= Outputs


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
.DEFAULT_GOAL:= help

#################### all
all: pdf ## all -->  generation of pdf


##################### dvi
dvi: $(PRINCIPALE_DVI)  ## generation and compiling of dvi file in the $(OUTPUTS) direcotry

dvishow:  ## show the dvi file using xdvi
	xdvi $(OUTPUTS)/$(PRINCIPALE_DVI)

$(PRINCIPALE_DVI): $(PRINCIPALE_TEX) ## 
	@echo "$(START_STRING) $(COLOR_YELO)latex$(COLOR_RESET) compling ..."
	latex $(PRINCIPALE)
	@echo "$(DONE_STRING)"
	-mkdir $(OUTPUTS)	
	-mv $(PRINCIPALE_DVI) $(OUTPUTS)/ 
	#bibtex $(PRINCIPALE)
	#makeindex $(PRINCIPALE)
	#latex $(PRINCIPALE)
	#latex $(PRINCIPALE)




#################### pdf
pdf: $(PRINCIPALE_PDF) ## generation of pdf file in the $(OUTPUTS) direcotry
pdfshow: ## show the pdf file using evince
	evince  $(OUTPUTS)/$(PRINCIPALE_PDF)

$(PRINCIPALE_PDF): $(PRINCIPALE_TEX) ##
	@echo "$(START_STRING) $(COLOR_ORNG)pdflatex$(COLOR_RESET) compling ..."	
	-pdflatex $(PRINCIPALE)
	@echo "$(DONE_STRING)"
	-mkdir $(OUTPUTS)	
	-mv $(PRINCIPALE_PDF) $(OUTPUTS)/ 
	#bibtex $(PRINCIPALE)
	#makeindex $(PRINCIPALE)
	#pdflatex $(PRINCIPALE)
	#pdflatex $(PRINCIPALE)

################### clean functions

clean: ## remote latex files
	-rm -f $(FILE_CLEAN)

distclean: clean ## remove latex files included the pdf and dvi
	-rm -f $(OUTPUTS)/$(PRINCIPALE_DVI)
	-rm -f $(OUTPUTS)/$(PRINCIPALE_PDF)


################### create a mini man
help: ## get some help :)
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'



