#!/bin/bash



set -e
source /root/shell/function.sh

#############################
#1. $HOME/.bashrc
#############################
BASHRC=$HOME/bashrc.txt
# BASRC=$HOME/bashrc

echo "[ Phase 01 ] "
/bin/cp /etc/skel/.bashrc  $BASHRC
cat << EOF >>$BASHRC

#
#Specific configuration
#
export PS1='\[\e[31;1m\][\u@\h\[\e[33;1m\] \w]\$ \[\e[m\]'

alias ls='ls --color=auto -h' 
alias pps='ps -ef | head -1 ; ps -ef | grep $1 '
alias vi='/usr/bin/vim'
alias grep='grep --color=auto -i'
alias df='df -h -T' 
EOF
echo "[ Phase 02 ] OK "


#2). $HOME/BASHRC
VIMRC=$HOME/.vimrc
echo "[ phase 03 ] "
cat << EOF > $VIMRC
syntax on
set nu
set ai
set ts=4 sw=4
set et
EOF
echo "[ OK ]"