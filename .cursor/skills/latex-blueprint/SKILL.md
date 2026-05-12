---
name: latex-blueprint
description: Supports writing and maintaining documents in this LaTeX Blueprint repository. Use when the user asks to write chapters, add figures/tables/code listings, manage acronyms or citations, compile the document, or update template-aligned LaTeX content.
disable-model-invocation: true
---

# LaTeX Blueprint

## When to use
Use this skill when the task mentions LaTeX work in this repository, especially:
- chapter authoring (`kapitel`)
- figures, tables, math, code listings
- acronyms (`acro`)
- bibliography entries/citations
- compile/build issues

Common trigger phrases include:
- "Kapitel schreiben"
- "Abbildung einfügen"
- "Abkürzung"
- "Literatur"
- "kompilieren"
- "LaTeX Blueprint"
- "Vorlage"

## Project baseline
- Entry file: `dokument.tex`
- Chapter files: `kapitel/kapitelN.tex`
- Appendix files: `anhang/*.tex`
- Meta files: `meta/*.tex`
- Bibliography database: `bib/literatur.bib`

## Standard workflows

### Add a chapter
1. Create `kapitel/kapitelN.tex`.
2. Start with:
   - `\ihead{Short Title}`
   - `\chapter{Full Title}`
3. Add the corresponding `\input{kapitel/kapitelN.tex}` line in `dokument.tex` (or uncomment if present).

### Add a figure
1. Use `figure[H]`.
2. Use `\includegraphics` with files from `bilder/`.
3. Add:
   - `\caption{...}` (below figure)
   - `\label{fig:...}`
4. Refer to it with `\ref{fig:...}`.

### Add a table
1. Use `table[H]`.
2. Place `\caption{...}` above the table.
3. Add `\label{tab:...}`.
4. Prefer template-friendly column patterns (`v`, `V`, `k`, `Z`) for constrained widths.

### Add code listings
Use:
`lstlisting[language=X, caption={...}, label={code:...}]`

Listings are rendered with the template naming ("Codebeispiel").

### Add math
1. Use `equation` environment for numbered formulas.
2. Always add `\label{eq:...}` for references.
3. Use `\mathrm{d}` for differentials.
4. Keep German decimal comma conventions in prose; keep valid LaTeX math notation in equations.

### Add acronyms
1. Define acronym entries in `meta/abkuerzungen.tex`.
2. Use `\DeclareAcronym{KEY}{short=..., long=...}`.
3. Use `\ac{KEY}` in text.

### Add citations
1. Add bibliographic entry to `bib/literatur.bib`.
2. Cite with `\cite{key}`.
3. Keep style compatibility with existing `biblatex` configuration (IEEE-alphabetic labels).

### Add TikZ diagrams
Follow existing diagram conventions in `kapitel/kapitel2.tex`:
- `Stealth` arrow style
- compact node labels (`\scriptsize`)
- coherent teal/blue/orange styling

### Build and verify
Run this sequence:
1. `pdflatex dokument.tex`
2. `bibtex dokument`
3. `pdflatex dokument.tex`
4. `pdflatex dokument.tex`

Then check for warnings such as `Overfull \hbox`.

## Do not do this
- Do not modify sections in `dokument.tex` explicitly marked as stable template boilerplate unless the user asks.
- Do not use `\include{}`; use `\input{}` to stay consistent with this template.
- Do not add `\usepackage` statements in chapter files under `kapitel/`; package setup belongs in `dokument.tex`.
