#!/bin/bash

echo -n "filename? : "
read FILE1

echo $FILE1
if [ -f $FILE1 ] ; then
    echo "[ OK ] $FILE1 : normal " 
elif [ -d $FILE1 ] ; then
    echo "[ OK ] $FILE1 : dir "
else
    echo "[ FALI ] no file " 
    exit 2
fi