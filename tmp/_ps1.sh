#!/bin/bash 
## ps1 prompt for bash 
_ps1() { 
PS1=''$re'[\e[0;1;38;5;$((2 + $?))m$?'$re']'$re$ipp$re'\
['$re'\e[1m\e[38;5;$((RANDOM%88 + 88))m${mod:0:8}'$re'] \
['$re$cyan'\u'$re'] '$re$(cat $HOME/logs/bat.sh 2>/dev/null)' \
['$re$yellow'\w'$re']\e[25h\e[0m\n'; }; 
