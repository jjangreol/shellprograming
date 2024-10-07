#!/bin/bash


IP=172.16.6.250

cmd() {
    sleep 2; echo 'root'
    sleep 0.5 ; echo 'centos'
    sleep 0.5 ; echo 'hostname'
    sleep 0.5 ; echo 'tar cvzf /tmp/linux227.tar.gz /home'
    sleep 0.5 ; ehco 'exit'
}

CMD | telnet $IP

ftp -n $IP << EOF
user root centos
cd /tmp
lcd /root
bin
hash
prompt
mget linux227.txt
auit
EOF
echo
echo "----------RESULT-------------"

ls -l /root/linux*.txt