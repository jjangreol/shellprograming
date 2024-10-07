#!/bin/bash

#Function definitions
YES() {
    echo 
    echo : "YES" | boxes -d info
}
NO() {
    echo
    echo : "NO" | boxes -d critical
}
FAIL() {
    echo : "[ FAIL ] : naga"
    exit 2
}
#variable definitions

#Main Function
echo -n "choice ~~ (Y/N): "
read CHOICE

case $CHOICE in
    Y|y|yes|YES|Yes) YES  ;;
    n|N|NO|No)       NO   ;;
    *)               FAIL ;;
esac