#!/bin/bash
## klock
klock() {
printf "\e7\e[?25l\e[?47h"; clear;
########### variables
#figlist=($(figlist|batcat -pp --line-range 4:|head -n-5)); 
###################
figlist=(3d 4x4_offr fender contrast Electronic 4maxebbs_1__ aquaplan doh Big_Money-sw Electronic s-relief devilish Big_Money-nw poison )
figfont="$(shuf -n1 -e ${figlist[@]})"; figlength="$(figlet -f "$figfont" $(date +%T))";
###########
########### funtions
fsize() { 
sizeh=$(stty size|cut -f1 -d" "); sizew=$(stty size|cut -f2 -d" "); 
sizehh="$((${sizeh}/2-9))"
} 
fsize; 
ftime() { 
printf "\e[$((${sizeh}/2-8));$((${sizew}/2-2))H\e[1m$(date +%H:%M)"; ## print time plainly ## move to center
printf "\e[$((${sizeh}/2-4))H\e[0J";  
} 
fday() { 
dag="$(date +%#A" den"%e":de "%#B)"; daghw=$((${#dag}/2)); halfw=$((${sizew}/2)); printf "\e[2m\e[2J\e[${sizehh};$((${halfw}-${daghw}))H${dag}\e[0m"; ## print day
} 
while true; do figfont="$(shuf -n1 -e ${figlist[@]})"; figlength="$(figlet -f "$figfont" $(date +%T))"; [ "${#figlength}" -gt 8 ]&& break; done; fday; 
while true; do date="$(date +%H:%M;)"; ftime; lang='c#'; 
[ "$1" ] && figfont="$1" && key="s";
[ "$2" ] && lang="$2";
if [ "$lang" != 22 ]; then figlet -w "$sizew" -cf "$figfont" "$date"|batcat -Ppl "$lang"; ## time
else printf "\e[36m"; figlet -w "$sizew" -cf "$figfont" "$date"; fi; ## time
read -t60 -srn1 "key"||key=0; printf "$((kk++))\e[2K"; [ "$kk" -eq 44 ] && key="c" && kk="0";
if [ "$key" = "c" ]; then figfont=$(shuf -n1 -e ${figlist[@]}); fsize; fday; 
printf "\e[2m\e[${sizehh};$((${halfw}-${daghw}))H${dag}\e[0m\e[0J"; 
printf "\e[H\e[2m$lang $figfont          "; 
elif [ "$key" = "" ]; then break; 
elif [ "$key" = "q" ]; then break; 
elif [ "$key" = " " ]; then break; 
elif [ "$key" = "s" ]; then kk="45"; printf "\e[2m\e[0;${sizew}Hs"; printf "$figfont\n" >> ~/figz.sh;
elif [ "$key" = "l" ]; then fsize; fday; 
lang=$(shuf -n1 -e ${figlist[@]}); printf "\e[2m\e[H$lang $figfont       ";
fi; done; 
printf "\e[?47l\e[?25h\e[0m\e8";
}

#klock




