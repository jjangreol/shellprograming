#!/bin/bash

# 1) ping 192.168.10.2
# 2) ping 8.8.8.8
# 3) ping www.google.com


IP1=192.168.10.2
IP2=8.8.8.8
IP3=www.google.com

source /root/shell/function.sh

# 1.ping test
print_info "ping $IP1"
ping -c 1 -w 1 $IP1 >/dev/null 2>&1
if [ $? -eq 0 ]; then
    print_good "[ OK ]"
else
    print error "[ FAIL ] Local Network Connection"
    cat << EOF 
    (ㄱ) VMware >  Edit > Virtual Network Editor
    (ㄴ) VMware > VM > Settings > Network Adapter
    (ㄷ) # ifconfig 
EOF
    exit 1
fi 

# 2.outside ping test
print_info "ping $IP2"
ping -c 1 -w 1 $IP2 >/dev/null 2>&1
if [ $? -eq 0 ]; then
    print_good "[ OK ]"
else
    print error "[ FAIL ] Local Network Connection"
    cat << EOF
    (1) # ip a
EOF
    exit 2
fi 

# 3.name ping.tets
print_info "ping $IP3"
ping -c 1 -w 1 $IP3 >/dev/null 2>&1
if [ $? -eq 0 ]; then
    print_good "[ OK ]"
else
    print error "[ FAIL ] Local Network Connection"
    cat << EOF
    (ㄱ) # cat /etc/resolv.conf
EOF
    exit 3
fi 
