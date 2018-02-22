#!/bin/bash

SRC=$1
LEVEL=1

if [ -z "$SRC" ]; then
	echo "Please pass URL as first paramater."
  exit
fi

echo "Trawling $SRC (recursive level $LEVEL)..."
wget  -A.html,.php -e robots=off --wait 1 -r -l$LEVEL "$SRC" -R gif,jpg,pdf,png -O output.html 
#find . -type f -exec cat {} \; > output.html

SRCB="output.html"
echo "Parsing $SRC..."
cat $SRCB | html2text-2.7 --decode-errors=ignore > html2text.tmp
echo "- converted to text"
paste -sd , html2text.tmp | sed 's/\([.!?]\) \([[:upper:]]\)/\1\n\2/g' | sed '/^.\{256\}./d' > knowledge.dat
echo "- split into facts"
rm output.html html2text.tmp
echo "- removed temporary files"
echo "Updated knowledge.dat using source $SRC."
echo "Now, run knowledgebot.sh!"


