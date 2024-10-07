#!/bin/bash

MAX=5
for i in $(seq 1 $MAX)
do 
    # echo $i
    NUM=$i
    BLANK_NUM=$(expr $MAX - $NUM)
    # echo "$NUM : $BLANK_NUM"
    a_NUM=$(expr $MAX - $i)
for j in $(seq $a_NUM -1 1)
do
    echo -n '*'
done
for k in $(seq $i)
    do 
        echo -n ''
    done
    echo
done




