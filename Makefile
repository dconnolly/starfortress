# You want latexmk to *always* run, because make does not have all the info.
# Also, include non-file targets in .PHONY so they are run regardless of any
# file of the given name existing.
.PHONY: submission all clean

all: submission

git:
	git submodule update --init --recursive; true

submission: git
	latexmk -f -g -pdf -pdflatex="pdflatex --no-shell-escape" main

diff:
	git latexdiff --latexopt -bibtex --latexopt -pdf --latexopt -pdflatex="pdflatex -interaction=nonstopmode" --latexopt -use-make --latexopt -g --bibtex --latexmk HEAD^

diff-working-tree:
	 git latexdiff --latexmk HEAD --

clean:
	latexmk -c
