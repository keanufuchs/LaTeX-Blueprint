# Simple Makefile for cleaning LaTeX build artifacts

# Default target: just show help
.PHONY: help
help:
	@echo "Available targets:"
	@echo "  clean      - remove common LaTeX temp files"
	@echo "  clean-all  - DANGEROUS: remove everything except .tex/.pdf/.bib/Makefile/.gitignore"

# Safe clean: remove known LaTeX auxiliary/build files recursively
.PHONY: clean
clean:
	find . \
	  -type f \
	  \( \
	    -name '*.aux' -o \
	    -name '*.log' -o \
	    -name '*.out' -o \
	    -name '*.toc' -o \
	    -name '*.lof' -o \
	    -name '*.lot' -o \
	    -name '*.fls' -o \
	    -name '*.fdb_latexmk' -o \
	    -name '*.synctex.gz' -o \
	    -name '*.synctex(busy)' -o \
	    -name '*.bbl' -o \
	    -name '*.bcf' -o \
	    -name '*.blg' -o \
	    -name '*-blx.bib' -o \
	    -name '*.run.xml' -o \
	    -name '*.idx' -o \
	    -name '*.ilg' -o \
	    -name '*.ind' -o \
	    -name '*.nlo' -o \
	    -name '*.nls' -o \
	    -name '*.xdv' -o \
	    -name '*.pyg' -o \
	    -name '*.lol' -o \
	    -name '*.bbl-SAVE-ERROR' -o \
		-name '*.kilepr' -o \
		-name '*.tcp' -o \
		-name '*.tps' \
	  \) -delete

# Aggressive clean: remove all files (not directories) except .tex/.pdf/.bib/Makefile/.gitignore
# and skip the .git directory entirely.
.PHONY: clean-all
clean-all:
	@echo "WARNING: This will delete most non-source files in the tree!"
	find . \
	  -path './.git' -prune -o \
	  -type f \
	  ! -name 'Makefile' \
	  ! -name '.gitignore' \
	  ! -name '*.tex' \
	  ! -name '*.pdf' \
	  ! -name '*.bib' \
	  -print -delete
