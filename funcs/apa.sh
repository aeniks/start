#!/bin/bash
unalias apa 2>/dev/null; 
apa() { [ "$k" ]|| k="$HOME/k" && mkdir $HOME/k 2>/dev/null;
[ -f "$k/apts.sh" ] || apt list 2>/dev/null|tail -n+2|cut -f1 -d"/" > "$k/apts.sh"; 
[ "$@" ]&& qq="-q $@"; unset instapt; 
instapt=($(cat $k/apts.sh|fzf --expect "q" ${qq} -m \
--preview "apt show "{}" 2>/dev/null|batcat -ppflc" \
--preview-window up,wrap,+5 --scroll-off=22 --inline-info)); 
instapt=( "${instapt[@]/q/}" );  
printf %b "\n\n\n\e[2A \e[96m--\e[0m Install: "; 
unset mn; mn=66; for i in ${instapt[*]}; 
do printf %b "\e[38;5;"$((mn++))"m$i\e[0m, "; done; 
printf %b "\e[2;96m? \e[0;2m[\e[0mY\e[2m/\e[0mn\e[2m]\e[0m "; 
read -sn1 "ny"; echo;echo; [ "$ny" ]||sudo apt install ${instapt[*]}; 
}; 

