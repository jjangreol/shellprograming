#!/bin/bash
RET=($i \* 10)

for i in $(seq 1 10)
do 
    NUM=$($RET)
    echo -ne "$NUM%"

    START=1
    while [ $START -le $i ]
    do 
        echo -ne "==="
        START=`expr $START + 1`
    done
   
   if [ $i -ne 10 ]; then
        echo -ne ">"
    else
        echo -ne "complete\n"
    fi

    echo -ne "\r"
    sleep 1
done

