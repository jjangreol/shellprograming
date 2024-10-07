#!/bin/bash

Error() {
    echo "[ FAIL ]: no"
}
echo -n "Enter A: "
read A

echo -n "OP: "
read OP

echo -n "Enter B: "
read B

case $OP in
    '+') echo "$A + $B = $(expr $A + $B)" ;;
    '-') echo "$A - $B = $(expr $A - $B)" ;;
    '*') echo "$A * $B = $(expr $A \* $B)" ;;
    '/') echo "$A / $B = $(expr $A / $B)" ;;
    *) Error  ;;
esac