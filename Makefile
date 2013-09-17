SRC=$(wildcard *.tex)
OBJS=$(SRC:.tex=.pdf)

all: $(OBJS)

%.pdf: %.tex
	latexmk -silent -pdf -use-make $^

clean:
	latexmk -CA
