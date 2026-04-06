

DICT=ENtoFR_plpatch.xml
DICT_H=ENtoFR_plpatch_H.xml
DICT_G=ENtoFR_plpatch_G.xml
GLOS=Glossary.xml
COMMANDS="--add-annotations --add-hyperlinks"

REM ############### DON'T EDIT ###############

INPUT=input
OUTPUT=output
BASE=dict_base
NEW=dict_new

rm-f "$NEW/*.xml" 


export ESM=""


ESM=$(find $INPUT -type f \( -name *.esm -o -name *.esp \) )

./yampt --make-not $COMMANDS -f $ESM -d "$BASE/$DICT" "$BASE/$DICT_G" "$BASE/$GLOS"
./yampt --make-changed $COMMANDS -f $ESM -d "$BASE/$DICT_H" "$BASE/$DICT_G" "$BASE/$GLOS"

mv -f "*.CHANGED.xml" "$NEW" 
mv -f "*.NOTFOUND.xml" "$NEW" 


