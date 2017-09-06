pdflatex -draftmode file
bibtex file # or biber
makeindex file.idx # if needed
makeindex -s style.gls ...# for glossary if needed
pdflatex -draftmode file
pdflatex file

