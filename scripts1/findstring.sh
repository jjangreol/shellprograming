#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 <pattern> <filename>"
    exit 1
fi
PATTERN="$1"
FILENAME="$2"

grep -q "$PATTERN" "$FILENAME" >/dev/null 2>&1 
if [ $? -eq 0 ] ; then
    echo "[ OK ] good "
else    
    echo "[ FAIL ] nooooo "
fi