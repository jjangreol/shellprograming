#!/bin/bash

#################################
#1. epel-release 
#2. boxes, gcc, make
#################################


set -e
source /root/shell/function.sh

echo 

#1. epel-release 
PKGS="epel-release"
echo "[phase 01]"
PkgInstall $PKGS





#2. boxes, gcc, make
PKGS="gcc make boxes"
echo "[phase 02]"
PkgInstall $PKGS
