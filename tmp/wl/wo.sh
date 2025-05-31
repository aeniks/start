#!/bin/bash
wo() { 
mkdir -p $HOME/logs/wotd 2>/dev/null; 
time="$(date +%y_%m_%d)"; wotmp=$HOME/tmp/wotd_$time.log; 
[ -z $1 ]&& ext="word-of-the-day"||ext="thesaurus/$1"; 
command w3m -cols 800 -dump https://www.merriam-webster.com/$ext > $wotmp; ####
( printf %b 'printf -v "woword" "'; cat $wotmp|sed -n 39p|cut -f1 -d" "|tr -d "\n"; printf %b '";'; echo; ) > $HOME/logs/wotd_m.sh; 
####
( printf %b 'printf -v "wotype" "'; 
cat $wotmp|sed -n 42p|cut -f1 -d" "|tr -d "\n "; 
printf %b '";'; 
echo; 
) >> $HOME/logs/wotd_m.sh; 
##
( printf %b 'printf -v "wophone" "'; 
cat $wotmp|sed -n 42p|cut -f2- -d" "|tr -d "\n "; 
printf %b '";'; echo; 
) >> $HOME/logs/wotd_m.sh; 
####
( printf %b "printf -v "'w_m'" %b "; 
printf %q "$(sed -n 48p $wotmp)"; 
) >> $HOME/logs/wotd_m.sh; 
####
wo="wotd_$(date +%Y_%m_%d)_$wowowrd"; wotd_m &>/dev/null; printf %b "$(figlet -f Roman $w_w|bat --theme Nord -ppfljava)\n$(printf %b "$w_m"|fold -sw 44|bat --theme Nord -ppflzig)\n\e[2m\n [\e[0m$(printf %b "$w_p"|bat -ppflr)\e[2m] > \e[96m$w_t    \e[2m\n\n\n\n"|\
aha -t "word of the day - $w_w" -b -y "margin:0;width:100%;overflow-x:hidden;
font-family:monospace;font-size:
clamp(2vmin,2.4vmin,.182em);
text-align:center;padding-top:
clamp(6vh,22vh,8em);margin-top:calc(12vh - 9ch);background:rgb($((RANDOM%88 + 8)),$((RANDOM%88 + 8)),$((RANDOM%88 + 8)));" > $wo.html; 
sed -i '6i<meta name="viewport" content="width=device-width, initial-scale=1.0" />' $wo.html; 
}; 
