#!/bin/bash

USERLIST=/root/shell/user.list
cat $USERLIST | while read UNAME UPASS
do 
    userdel -r $UNAME
    [ $? -eq 0] \
    && echo "[ OK ] "\
    || ehco "[ FAIL ]"
done