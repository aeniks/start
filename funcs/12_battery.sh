#!/bin/bash 
#termux battery 
alias battery12='battery="$(timeout 4 termux-battery-status|grep "percentage"|cut -c 17-18&)"; printf %b "\e[36m\n --$re Battery$dim :$re \e[95m$battery\e[0m%\n"'; 
