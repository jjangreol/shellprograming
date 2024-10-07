#!/bin/bash

########################################
#1.telent service
#2.vsftpd service
#3?
#########################################

set -e

source /root/shell/function.sh

#################################
# 1.telent service
PKGS="telnet-server telnet"
echo "[ Phase 01 ] OK "
PkgInstall $PKGS

# 1) telnet-server.telnet
SVCS="telnet.socket"
echo "[ Phase 02 ] OK "
ServiceStart $SVCS


# 2) telnet-socket
RULSE="telnet"
echo "[ Phase 03 ] ok "
FWRule $RULSE
echo
#####################################
# 2.vsftpd service

# 1)vsftpd.ftp
PKGS="vsftpd ftp"
echo "[ Phase 01 ] OK "
PkgInstall $PKGS
# 2) /etc/vsftpd/{frpuser.user_list}
FTPUSERS=/etc/vsftpd/ftpusers
USER_LIST=/etc/vsftpd/user_list

echo "[ OK ] $FTPUSERS $USER_LIST Setting"
for i in  $FTPUSERS $USER_LIST
do 
    sed -i 's/^root/#root/' $i
done
    echo "[ OK ]"
    
# 3) vsftpd.service
RULSE="vsftpd"
echo "[ Phase 03 ] ok "
FWRule $RULSE
echo

# 4) ftp 
RULSE="ftp"
echo "[ Phase 04 ] ok "
FWRule $RULSE
echo

