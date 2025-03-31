#!/bin/bash
unalias apa 2>/dev/null; 
apa() { 
apa="$HOME/logs/apa.log"; [ -z $PREFIX ]&& sudo=sudo; 
mkdir -p $HOME/logs/apts 2>/dev/null; c2="\e[96m--\e[0m"
[ -e "$apa" ]||apt list 2>/dev/null|tail -n+2|cut -f1 -d"/"|tee "$apa"; 
declare -a apas; local IFS=$'\n '; 
printf %b "\n\n\n\n\n\n\e[5A $c2 Update apt list? \e[0;2m[\e[0mY\e[2m/\e[0mn\e[2m]\e[0m "; read -sn1 "oo"; if [ -z $oo ]; then 
printf %b "\n\e[A\e[28G\e[92mOK\e[0m\n $c2 Updating... "; 
for aa in $(cat $apa); 
do printf %b "\e[19G\e[38;5;$((RANDOM%88 + 116))m$aa\e[0K\e[44G"; 
$sudo apt show $aa 2>/dev/null > $HOME/logs/apts/$aa; done; printf %b "\e[0m\n"; fi; echo; cd $HOME/logs/apts; 
apas=($(cat $apa|fzf --bind "q:abort" -i -m --border none \
--preview "cat "{}" 2>/dev/null|batcat -ppflc" \
--preview-window right,wrap --scroll-off=22 --inline-info \
--preview-border none; )); [ "$apas" = "q" ] && echo ok && return 0;   \
apas=( ${apas[*]/q/} ); 
printf %b "\n\n\n\n\n\e[7A \e[96m--\e[0m Install: "; 
unset mn; mn=66; for i in ${apas[*]}; 
do printf %b "\e[38;5;"$((mn++))"m$i\e[0m, "; done; 
[ -z "$apas" ]&& echo && echo && cd - && return 0; 
printf %b "\b\b\e[2;96m? \e[0;2m[\e[0mY\e[2m/\e[0mn\e[2m]\e[0m "; 
read -sn1 "ny"; echo;echo; [ "$ny" ]||$sudo apt install ${apas[*]}; 
}; 

