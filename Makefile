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

rename:
	 rename -f 's/.*_(en|pl).pdf/Jakub Sokolowski CV ($$1).pdf/' *.pdf

upload: cv_en.pdf cv_pl.pdf
	scp cv_en.pdf gsokolowski.pl:/var/www/files/jakub_sokolowski_cv_en.pdf
	scp cv_pl.pdf gsokolowski.pl:/var/www/files/jakub_sokolowski_cv_pl.pdf

all: $(TARGETS) rename
