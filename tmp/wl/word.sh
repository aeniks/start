
word() { 
dd="$@"; mkdir $HOME/logs/words -p 2>/dev/null; wort="$HOME/logs/words/word_$dd"; 
[ -z $1 ]&& printf %b "\n\n\n\n\n\n\e[4A\e[96m --\e[0m word:"&& read -e -p " " -i "${dic}" "dd"; wort="$HOME/logs/words/word_$dd"; 
wo=($(lynx -nolist -preparsed -minimal -width 400 -dump https://merriam-webster.com/thesaurus/${dd}|sed -n 72,74p|cut -f4 -d" ";));
####
wom=($(command lynx -dump -width 600 "https://merriam-webster.com/thesaurus/${dd}"|sed -n 77p; )); 
####
(figlet -f Roman "$dd"; printf %b "\n${wo[0]} > ${wo[1]}\n\n${wom[*]}"; )|\
aha -t "word of the day - $word" -b -y "margin:0; width:100vw; display:flex; overflow-x:hidden; font-family:monospace; font-size:clamp(2vmin,2.4vmin,.182em); text-align:center; padding-top:
clamp(6vh,22vh,8em); margin-top:calc(12vh - 9ch); background:rgb($((RANDOM%88 + 8)),$((RANDOM%88 + 8)),$((RANDOM%88 + 8)));" |sed -i '6i<meta name="viewport" content="width=device-width,initial-scale=1" /> '; }; 
####


wdic() { 
dd="$@"; mkdir $HOME/logs/words -p 2>/dev/null; 
[ -z $1 ]&& printf %b "\n\n\n\n\n\n\e[4A\e[96m --\e[0m word:"&& read -e -p " " -i "${dic}" "dd"; 
wort="$HOME/logs/words/word_$dd"; 
command lynx -dump -width 600 \
"https://merriam-webster.com/thesaurus/${dd}" > $wort.log; 
# word=($(cat $wort.log|sed -n 60,64p|cut -f1 -d" ";)); 
# words=($(cat $wort.log|sed -n 66,77p;)); 
# printf %b "${word[0]}\n
# [${word[1]}] > ${word[2]}\n
# ${words[*]}\n" > $wort.sh; 
# printf %b "$(figlet -f Roman ${word[0]}|bat --theme Nord -ppfljava)\n$(printf %b "${word[1]}"|fold -sw 44|bat --theme Nord -ppflzig)\n\e[2m\n [\e[0m$(printf %b "${words}"|bat -ppflr)\e[2m] > \e[96m$w_t    \e[2m\n\n\n\n"|\

wo=($(sed -n 60,64p $wort.log|cut -f1 -d" "|tr -s "\n0-9" "\n"; )); wom=($(sed -n 75,76p $wort.log|tr -s "\n0-9" "\n "; )); 
printf %b "\n$(figlet -f Roman "${wo[0]}"|bat -ppflzig --theme Nord)\n${wo[1]} > ${wo[2]}\n\n${wom[*]}\n"|\
aha -t "word of the day - $word" -b -y "margin:0;width:100%;overflow-x:hidden;
font-family:monospace;font-size:
clamp(2vmin,2.4vmin,.182em);
text-align:center;padding-top:
clamp(6vh,22vh,8em);margin-top:calc(12vh - 9ch);background:rgb($((RANDOM%88 + 8)),$((RANDOM%88 + 8)),$((RANDOM%88 + 8)));" |sed -i '6i<meta name="viewport" content="width=device-width,initial-scale=1" />' 
####

}; 

