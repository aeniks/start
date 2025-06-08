#!/bin/bash 
wordd() { dd=${EPOCHSECONDS}; wc="$(lynx "http://www.thefreedictionary.com/_/WoD/rss.aspx" -dump -width 800 -force_empty_hrefless_a|tr "<>/" "\n"|grep -e "Definition"|cut -f2 -d" " --complement | tee ~/logs/words/dd$dd.log | wc -l; )"; 
for i in $(seq $wc;); 
do ww=($(sed -n ${i}p ~/logs/words/dd$dd.log)); 
printf %b "${ww[*]}" > ~/logs/words/w_${ww}.log; 
####
(figlet -w $COLUMNS -f Roman -o "$ww"|bat -ppfljava --theme DarkNeon; printf %b "\e[2A${ww[1]}\n"|bat -ppfll --theme DarkNeon ; printf %b "\n${ww[*]:2}\n"|tr "\n" " "|bat -ppf --language d --theme Visual\ Studio\ Dark+ ; printf %b "\n")|tee ~/logs/words/w_${ww}_f.log | aha -t "word of the day - $w_w" -b -y "margin:0;width:100%;overflow-x:hidden;
font-family:monospace;font-size:
clamp(2vmin,2.4vmin,.182em);
text-align:center;padding-top:
clamp(6vh,22vh,8em);margin-top:calc(12vh - 9ch);background:rgb($((RANDOM%88 + 8)),$((RANDOM%88 + 8)),$((RANDOM%88 + 8)));" > ~/logs/words/w_${ww}.html; 
done; 
}; 

wordd; 
