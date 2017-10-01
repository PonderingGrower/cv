FILES=cv_pl.tex cv_en.tex

deps:
	sudo apt install \
		latexmk \
		texlive-latex-extra \
		texlive-fonts-recommended \
		texlive-fonts-extra lmodern

clean:
	rm -f *.log *.dvi *.aux *.fls *.fdb_latexmk *.out *.pdf

all:
	latexmk ${FILES}
