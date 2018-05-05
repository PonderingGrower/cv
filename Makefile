FILES=cv_pl.tex cv_en.tex
LATEXMK=latexmk -pdf
TARGETS=cv_pl.pdf cv_en.pdf

all: $(TARGETS)

deps:
	sudo apt install \
		rename latexmk \
		texlive-latex-extra \
		texlive-fonts-recommended \
		texlive-fonts-extra lmodern

clean:
	rm -f *.log *.dvi *.aux *.fls *.fdb_latexmk *.out *.pdf

%.pdf: %.tex
	$(LATEXMK) $<

rename:
	 rename -f 's/.*_(en|pl).pdf/jakub_sokolowski_cv_$$1.pdf/' *.pdf

upload: all rename
	scp *.pdf gsokolowski.pl:/var/www/files/
