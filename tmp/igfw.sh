#!/bin/bash
dddd=dd$(date +%y%m%d%H%M%S); igdd=~/logs/words; ig_file=${igdd}/${dddd}
####
lynx "http://www.thefreedictionary.com/_/WoD/rss.aspx" -dump -width 800 -force_empty_hrefless_a | tr "<>/" "\n" | grep -e "Definition" | cut -f2 -d" " --complement > ${igfile}.log; 
####
printf %b "done\n"; for i in $(cat ${igfile}.log|nl --number-width=1|cut -c1); do printf -v igf %b "$(sed -n ${i}p ${igfile}.log)"; printf -v igfw %b "$(printf %b "$igf"|cut -f1 -d" ")"; (figlet -w ${COLUMNS-222} -f Roman "$(printf %b "\n\n$igf"|cut -f1 -d" ")"|tr "''" "+"|bat -ppfljava; printf %b "\n${igf}"|cut -f2- -d" "|gum style --border normal --align center --padding "1 2" --margin "0 12 12 12" | gum style --padding "0 22 22 22" --border none | bat -ppfljava) | aha | tail -n+11 | head -n-3 | sed -e 's/style\=//g' -e s/\"color\:/color\=\'/g -e s/[\"]/\'/g -e s/\;\'\>/\'\>/g|col -xb|ul > ${igfw}.html; convert -background "#222222" -gravity center pango:"<tt>$(cat $igfw.html)</tt>" ${igfw}.jpg; done;
####
####
