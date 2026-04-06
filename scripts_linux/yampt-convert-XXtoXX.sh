
DICT=ENtoFR.xml

REM ############### DON'T EDIT ###############

INPUT=input
OUTPUT=output
BASE=dict_base
USER=dict_user

DICT_U=""
DICT_U=$(find $USER -type f \( -name *.xml \) )

ESM=""
ESM=$(find $INPUT -type f \( -name *.esm -o -name *.esp \) )

./yampt --convert --add-hyperlinks -f $ESM -d "$BASE\$DICT" $DICT_U

mv -f "*.esm" "$OUTPUT"
mv -f "*.esp" "$OUTPUT" 

