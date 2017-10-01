FILES=cv_pl.tex cv_en.tex
LATEXMK=latexmk -pdf
TARGETS=cv_pl.pdf cv_en.pdf

deps:
	sudo apt install \
		latexmk \
		texlive-latex-extra \
		texlive-fonts-recommended \
		texlive-fonts-extra lmodern

clean:
	rm -f *.log *.dvi *.aux *.fls *.fdb_latexmk *.out *.pdf

%.pdf: %.tex
	$(LATEXMK) $<

all: $(TARGETS)