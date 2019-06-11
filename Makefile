DOC = Campobadal_Thesis

all: $(DOC).pdf
	@echo " -> Document: $(DOC).pdf"

$(DOC).pdf: *.tex chapters/*.tex references.bib
	@$(MAKE) -s clean_pdf
	@echo " -> Creating PDF..."
	@pdflatex thesis.tex -job-name=$(DOC) -shell-escape
	@bibtex $(DOC)
	@pdflatex thesis.tex -job-name=$(DOC) -shell-escape
	@bibtex $(DOC)
	@$(MAKE) -s clean
	@echo " -> PDF created!"
	@echo ""
	@echo ""

clean:
	@echo " -> Removing temp documents..."
	@rm -f *.toc *.out *.log *.aux *.lof *.bbl *blg *.xml *blx.bib *.bcf *.lol *.lot
	@echo " -> Temp documents removed!"

clean_pdf:
	@echo " -> Removing PDF"
	@rm -f $(DOC).pdf
	@echo " -> PDF removed!"

clean_all:
	@$(MAKE) -s clean
	@$(MAKE) -s clean_pdf
