#!/bin/bash

STAR=200
END=230
NET=172.16.6

RESULT=/tmp/tmp1
>$RESULT

for i in $(seq $STAR $END)
do
        ping -c 1 -w 1 $NET.$i >/dev/null 2>&1
        [ $? -eq 0 ] \
        && echo "[ OK ] $NET.$i" | tee -a $RESULT \
        || echo "[ FAIL ] $NET.$i" >>$RESULT
done