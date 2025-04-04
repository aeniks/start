#!/bin/bash 
## ps1 prompt for bash 
batt() { 
[ -e $HOME/logs/bp.log ] 2>/dev/null &&
printf %b "\e[9$(cat $HOME/logs/bp.log|cut -c1)m" &&
cat $HOME/logs/bp.log 2>/dev/null && printf %b "\e[0m ";
}; 

_ps1() { 
PS1=''$re'[\e[0;1;38;5;$((2 + $?))m$?'$re']'$re$ipp$re'\
['$re'\e[1m\e[38;5;$((RANDOM%88 + 88))m${mod:0:8}'$re'] \
['$re$cyan'\u'$re']'$re'$(uptime|cut -f11 -d" "|tr -d ",")''\
['$re$yellow'\w'$re']\e[25h\e[0m\n'; }; 
