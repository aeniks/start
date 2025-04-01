#!/bin/bash 
## word of the day 
wotd() { 
####
hash sudo 2>/dev/null&& sudo=sudo; hash lynx 2>/dev/null||$sudo apt install lynx -y &>/dev/null; 
####
wotd_file="$HOME/logs/wotd_$(date +%F).log"; 
wotd_form="$HOME/logs/wotd_$(date +%F)_form.log"; 
if [ -e $wotd_file ]; then cat $wotd_file; else \
lynx -dump https://www.dictionary.com/e/word-of-the-day|grep -m 1 -e "Learn More" -B12 > $wotd_file; chmod 775 $wotd_file; local IFS=$'\n';
wotd=($(sed -e s/Show.*//g -e s/\.\ .// -e /*/d $wotd_file)); 
####
printf %b "${wotd[*]}" > $wotd_form; 
tail -n4 $wotd_form|grep -v ']'|tr -s "\n" " "|column --output-separator '  >  ' --table --table-columns-limit 3 --output-width 88|bat -ppf --language bash --theme Dracula >  $wotd_file; cat $wotd_file; fi; 
}; 
