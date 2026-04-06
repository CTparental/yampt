#!/bin/bash
NATIVE="$HOME/openmw/basedata_fr"
FOREIGN="$HOME/openmw/basedata_us"
NAME="ENtoFR"
BASE="dict_base"

function pause {
    select choix in "continu " exit ; 
    do 
       case $choix in
          exit) echo "exiting"
                exit 0
                break ;;
             *) echo "choix $choix";
                break ;;
       esac
    done
}
## make base
if [ ! -f "Morrowind.BASE.xml" ];then
./yampt --make-base -f "$NATIVE/Morrowind.esm" "$FOREIGN/Morrowind.esm"
fi
if [ ! -f "Tribunal.BASE.xml" ];then
./yampt --make-base -f "$NATIVE/Tribunal.esm" "$FOREIGN/Tribunal.esm"
fi
if [ ! -f "Bloodmoon.BASE.xml" ];then
./yampt --make-base -f "$NATIVE/Bloodmoon.esm" "$FOREIGN/Bloodmoon.esm"
fi
## edit BASE xml for MISSING
echo "edit all *.BASE.xml and complet MISSING, then continu" 
pause

./yampt --merge -d "Morrowind.BASE.xml" "Tribunal.BASE.xml" "Bloodmoon.BASE.xml" -o "${NAME}.xml"
./yampt --merge -d "Morrowind.GLOS.xml" "Tribunal.GLOS.xml" "Bloodmoon.GLOS.xml" -o "${NAME}_G.xml"

rm -f "Morrowind.BASE.xml" "Tribunal.BASE.xml" "Bloodmoon.BASE.xml" 
rm -f "Morrowind.GLOS.xml" "Tribunal.GLOS.xml" "Bloodmoon.GLOS.xml"


mv "ENtoFR.xml" "$BASE"
mv "ENtoFR_G.xml" "$BASE"


./yampt --make-all -f "$FOREIGN/Morrowind.esm" -d "$BASE\${NAME}.xml"
./yampt --make-all -f "$FOREIGN/Tribunal.esm" -d "$BASE\${NAME}.xml"
./yampt --make-all -f "$FOREIGN/Bloodmoon.esm" -d "$BASE\${NAME}.xml"

./yampt --merge -d "Morrowind.ALL.xml" "Tribunal.ALL.xml" "Bloodmoon.ALL.xml" -o "${NAME}_H.xml"

rm -f "Morrowind.ALL.xml" "Tribunal.ALL.xml" "Bloodmoon.ALL.xml"
mv "${NAME}_H.xml" "$BASE"
