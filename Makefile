manuscript = nt_pressure_sfr
latexopt   = -halt-on-error -file-line-error

all: $(manuscript).pdf

$(manuscript).pdf: $(manuscript).tex *.bib *.tex figures/*
	pdflatex $(latexopt) $<
	if [ -f $(manuscript).aux ]; then bibtex $(manuscript).aux; fi
	pdflatex $(latexopt) $<
	pdflatex $(latexopt) $<

pdf: *.tex
	pdflatex $(latexopt) $(manuscript)

clean :
	@rm -f *.aux *.bbl *.blg *.log *.out *.spl $(manuscript).pdf

.PHONY : clean all
