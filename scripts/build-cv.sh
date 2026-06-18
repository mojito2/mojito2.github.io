#!/usr/bin/env bash
# Recompile the CV from cv/cv.tex and copy the PDF into web/cv/ (the published copy
# the website links to). Run from anywhere. Requires XeLaTeX (TeX Live).
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT/cv"

echo "Compiling cv.tex with XeLaTeX..."
xelatex -interaction=nonstopmode -halt-on-error cv.tex >/dev/null

mkdir -p "$ROOT/web/cv"
cp cv.pdf "$ROOT/cv/Giulio-Salvatori-CV.pdf"
cp cv.pdf "$ROOT/web/cv/Giulio-Salvatori-CV.pdf"

# tidy LaTeX aux files
rm -f cv.aux cv.log cv.out cv.fls cv.fdb_latexmk cv.synctex.gz

echo "Done: cv/Giulio-Salvatori-CV.pdf and web/cv/Giulio-Salvatori-CV.pdf updated."
