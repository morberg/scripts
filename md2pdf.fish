#! /usr/local/bin/fish
# Convert markdown to PDF using pandoc and some better looking fonts
# Requires `brew cask install basiclatex`
#
# Source file: $argv
# Destination file: (basename $argv .md).pdf

pandoc $argv \
    --pdf-engine=xelatex --variable documentclass=scrreprt \
    --variable mainfont="Hoefler Text" --variable sansfont="Avenir" \
    --variable papersize=a4paper \
    -o (basename $argv .md).pdf
