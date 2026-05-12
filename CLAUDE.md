# LaTeX Blueprint Agent Guide

## Project Scope
- This repository is a LaTeX blueprint for scientific reports/theses.
- The main document entry point is `dokument.tex`.

## Build Workflow
- Preferred compile sequence:
  1. `pdflatex dokument.tex`
  2. `bibtex dokument`
  3. `pdflatex dokument.tex`
  4. `pdflatex dokument.tex`
- Cleanup commands:
  - `make clean` removes common LaTeX artifacts.
  - `make clean-all` is destructive and removes most non-source files.

## Repository Structure
- `kapitel/`: chapter files (`kapitel1.tex`, `kapitel2.tex`, ...)
- `anhang/`: appendix fragments and appendix lists
- `meta/`: title page, acronyms, declaration, abstract/thesis metadata
- `bib/literatur.bib`: bibliography source
- `handouts/`: handout document(s)
- `bilder/`: image assets referenced by `\includegraphics` (create if missing)

## Template Conventions
- Document class and global layout are configured in `dokument.tex` (KOMA-Script `scrreprt`).
- Bibliography uses `biblatex` with `bibtex` backend and IEEE-alphabetic labeling.
- Acronyms are managed via `acro` and loaded from `meta/abkuerzungen.tex`.
- Code listings use `listings`; listing captions are renamed to "Codebeispiel".
- Diagrams are commonly created with `tikz` and `pgfgantt`.
- Units and numbers are configured for German locale through `siunitx`.

## Hard Rules
- Do not alter template boilerplate in `dokument.tex` unless explicitly requested.
- Keep `meta/titelblatt.tex` structure unchanged unless explicitly requested.
- Keep section depth settings unchanged unless explicitly requested:
  - `\setcounter{secnumdepth}{3}`
  - `\setcounter{tocdepth}{3}`
- Do not add `\usepackage` declarations in chapter files under `kapitel/`.
