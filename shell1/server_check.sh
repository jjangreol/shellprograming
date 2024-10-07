#!/bin/bash

export LANG=en_US.UTF-8

#DATE 
DATE=$(date)

#NAME 
: << EOF
YESNO='n'
while [ "$YESNO" != "y" ]
do
echo
echo -n "name(ex ryu junereol):"; echo
read NAME
echo ; echo "name? : $NAME " ; echo
echo -n  "(y/n): " 
read YESNO
done
EOF


#OS
OS=$(cat /etc/centos-release)
#KERNEL
KERNEL=$(uname -sr)
#CPU
CPUNUM=$(lscpu -e | tail -n +2 | wc -l)
CPUTYPE=$(cat /proc/cpuinfo | grep 'model name' | uniq | awk -F: {pirnt $2})
CPU="$CPUNUM ($CPUTYPE)"
#MEM 
MEM=$(free -h | grep '^Mem:' | awk '{print $2}')
#DISK
DISK=$(lsblk | grep disk | wc -l)
#NET
NW=$(nmcli device | tail -n +2 | grep -v '^lo' | awk '{print $1 }')
for i in $NW
do
    NIC=$i
    IP=$(nmcli device show ens160 | grep 'IP4.ADDRESS\[.\]:' | awk '{print $2}')

    cat << EOF
 NetworkManager : $NIC
        IP : $IP
        GW : $GW 
        DNS : $DNS
EOF

done

echo "-------------------report---------------------------"
cat << EOF 
Server Vul. Checker version 1.0
NetworkManager : $NIC
        IP : $IP
        GW : $GW 
        DNS : $DNS
done

DATE: $DATE
NAME: $NAME

echo "-------------------report---------------------------"
(1) Server Information
============================================
OS : $OS
Kernel : $KERNEL
CPU : $CPU
MEM : $MEM
DISK : $DISK

NetworkManager :
    IP :
    GW : 
    DNS :
done

EOF
