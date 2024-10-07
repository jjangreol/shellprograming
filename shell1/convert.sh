#!/bin/bash

INPUTFILE=/share/output.txt
OUTPUTFILE=/share/output.csv
> $OUTPUTFILE

cat $INPUTFILE | while read LINE ID NAME EMAIL PHONE ADDR
do 

echo "$ID,$NAME,$EMALI,$PHONE,$ADDR" >> $OUTPUTFILE
done

