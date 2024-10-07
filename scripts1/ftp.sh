#!/bin/bash

# Functiom definitions
HELP() {
    cat << EOF
    Commands may be abbreviated.  Commands are:

!		debug		mdir		sendport	site
$		dir		mget		put		size

EOF
}

INVALID() {
    echo "?Invalid command"
}

OPEN() {
    echo -n "FTP SERVER IP :"
    read IP1
    # echo $IP1
    ftp $IP1
}

QUIT() {
    :
}


while true
do 
    echo -n "MYftp> "
    read CMD
    echo $CMD

    case $CMD in
        'help') HELP ;;
        'open') OPEN ;;
        'quit') QUIT ;;
        '')     :    ;;
        *)      INVALID ;;
    esac
done



