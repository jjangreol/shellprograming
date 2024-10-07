#!/bin/bash

#Functions definitions
WHO() {
    who | boxes -d mouse
}
DATE() {
    date | boxes -d bear
}
PWD() {
    pwd | boxes -d boy
}
EXIT() { 
    echo "[FAIL] none " 
    exit
}

#Variable definitons
cat << EOF
====================================================
  (1). who      (2). date     (3). pwd              
====================================================
EOF

echo  -n "numbercolection? : "
read CHOICE
#echo $CHOICE


case $CHOICE in
    1) WHO ;;
    2) DATE ;;
    3) PWD ;;
    *) EXIT ;;
esac