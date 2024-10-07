#!/bin/bash

set -e

# 1) httpd, mod_ssl
# 2) /var/www/html/index.html
# 3) httpd.service
# 4) http, https

# The file (funtion.sh) load
. /root/shell/function.sh

#
# Main function
#

# 1)
echo
echo "[ Phase: 01 ]"
PkgInstall httpd mod_ssl

# 2) 
echo "[ Phase: 02 ]"
echo
RandomIndex "/var/www/html/index.html" "MY HTTPS Web Server"
echo "[ OK ]"

#3)
echo
echo "[Phase: 03 ]"
ServiceStart httpd.service

#4)
echo
echo "[Phase: 04 ]" 
FWRule http https 