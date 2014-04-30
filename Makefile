MD:=$(shell find . -name '*.md')
PDF:=$(subst .md,.pdf,$(MD))

MD_OPTIONS+=-H header.tex
MD_OPTIONS+=-B prebody.tex
MD_OPTIONS+=--variable lang=japanese
MD_OPTIONS+=--variable papersize=a4paper
MD_OPTIONS+=--variable author="ライト　ダニエル"
MD_OPTIONS+=--latex-engine=xelatex

.PHONY: all clean

all: $(PDF)

clean:
	@rm -rf $(PDF)

%.pdf: %.md
	pandoc -s $< -o $@ $(MD_OPTIONS)
