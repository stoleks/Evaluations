#!/bin/bash

# generate all molecules pdf
function generate_molecule_pdf () {
  lines=$(wc -l < $1)
  for i in $(seq 1 $lines);
  do
    # skip lines that don't include a molecule file
    local start=`date +%s`
    line=`awk "NR==$i" $1`
    if [[ $line != *"input{molecules"* ]]; then
      continue
    fi

    # extract pdf names for A4 and A5
    filename=`awk "NR==$i" $1 | awk -F "[{}]" '{print $2}'`
    A4File=`echo $filename | sed "s|molecules|&_A4|"`
    A5File=`echo $filename | sed "s|molecules|&_A5|"`

    # Uncomment current line and generate pdf (two call for references)
    sed -i "$i s|% ||" $1
    printf "%-50s" "Génération de $filename... "
    pdflatex -quiet -draftmode -interaction=nonstopmode main.tex
    pdflatex -quiet -interaction=nonstopmode main.tex > log.out 

    # copy the pdf in the set directory
    local end=`date +%s`
    cp main.pdf "$A4File.pdf"

    # generate the A5 version
    pdflatex -quiet livret.tex
    pdflatex -quiet split.tex
    cp split.pdf "$A5File.pdf"
    echo "Il a fallu $((end - start)) secondes pour générer $A4File et $A5File."

    # comment current line, we need to use \\\\ instead of \\ because we use "" for the sed scope
    sed -i "$i s|\\\\in|% \\\\in|" $1
  done
}

# generate pdf for all molecules
echo "Generation des évaluations sur les molécules"
start=`date +%s`
sed -i "5 s|^% ||" "main.tex"
generate_molecule_pdf "molecules.tex"
sed -i "5 s|\\\\|% \\\\|" "main.tex"
end=`date +%s`
echo "Il a fallu $((end - start)) secondes ($(((end - start)/60)) minutes) pour générer toutes les molécules."
