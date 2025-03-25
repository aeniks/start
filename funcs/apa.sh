#!/bin/bash
unalias apa 2>/dev/null; 
apa() { apa="$HOME/logs/apa.log"; mkdir ~/logs 2>~.x;
[ -e "$apa" ]||apt list 2>~.x|tail -n+2|cut -f1 -d"/"|tee "$apa"; 
declare -a apas; local IFS=$'\n '; 
apas=($(cat $apa|fzf --expect "q" -i -m \
--preview "apt show "{}" 2>/dev/null|batcat -ppflc" \
--preview-window up,wrap --scroll-off=22 --inline-info \
--preview-border none; )); [ "$apas" = "q" ]&& echo ok && return 0; 
apas=( ${apas[*]/q/} );  
printf %b "\n\n\n\e[2A \e[96m--\e[0m Install: "; 
unset mn; mn=66; for i in ${apas[*]}; 
do printf %b "\e[38;5;"$((mn++))"m$i\e[0m, "; done; 
printf %b "\b\b\e[2;96m? \e[0;2m[\e[0mY\e[2m/\e[0mn\e[2m]\e[0m "; 
read -sn1 "ny"; echo;echo; [ "$ny" ]||sudo apt install ${apas[*]}; 
}; 

