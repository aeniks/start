#!/bin/bash 
## word of the day 
wotd() { 
####
hash sudo 2>/dev/null&& sudo=sudo; hash lynx 2>/dev/null||$sudo apt install lynx -y &>/dev/null; 
####
lynx -dump https://www.dictionary.com/e/word-of-the-day|grep -m 1 -e "Learn More" -B12 > $HOME/logs/wotd.log; 
wotd_file="$HOME/logs/wotd_$(date +%F).log"; touch $wotd_file; 
chmod 775 $wotd_file; local IFS=$'\n'; 
wotd=($(sed -e s/Show.*//g -e s/\.\ .// -e /*/d $HOME/logs/wotd.log)); ####
printf %b "${wotd[*]}" > $wotd_file; 
tail -n4 $wotd_file|grep -v ']'|tr -s "\n" " "|column --output-separator '  >  ' --table --table-columns-limit 3 --output-width 88|bat -ppf --language bash --theme Dracula; 
}; 
