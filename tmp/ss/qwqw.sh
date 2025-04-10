#!/usr/bin/env bash
## display 
qwqw() { 
unset msg1; [[ $1 ]] && msg1="$@";
dim="\e[2m" re="\e[0m" figglist="$HOME/figgs.sh"; 
local IFS=$'\n\t '; ff=($(cat $HOME/figz.sh)); t=${#ff[*]}; h=$((RANDOM%${t})); 
printf %b "\e[K"; for i in $(seq $LINES); do sleep .01; echo; done; 
printf %b "\e[2A\e7\e[K$n${ff[$h]}\[2A\e[1J\e[2H"; 
figlet -f "${ff[$h]}" -w $COLUMNS -c "${ff[$h]}"|bat -ppflzig; 
# printf %b "\e8\e[K$n${ff[$h]}"; 
figg() { printf %b "\e8\e[2A\e[1J\e[2H"; 
if [[ $msg1 ]]; then msg="$msg1"; else msg="${ff[$h]}"; fi; figlet -f "${ff[$h]}" -w $COLUMNS -c "${msg}"|bat -ppflzig||h=$((RANDOM%${t})); 
printf %b "\e8\e[K $re $h \t $n${ff[$h]} $re ";
}; 

while read -n1 -rs k; do case $k in 
A|C) [[ $h < $t ]]&& ((h++))&& n="\e[38;5;$((h / 6 + 44))m"||n="\e[41;1m STOP $re"; figg ;; 
B|D) [[ $h > 1 ]] && ((h--))&& n="\e[38;5;${h}m"||n="\e[41;2m END $re"; figg ;; 
r|"") h=$((RANDOM%${t}))&& n="\e[38;5;$((h / 6 + 22))m"; figg ;; 
s) printf %b "\t${ff[$h]}"|tee -a $HOME/logs/figgz.sh; 
printf %b "\t $n${ff[$h]} $re$dim saved to $re$figglist"; sleep 1; figg ;; 
q) printf %b "\e8\e[K$n${ff[$h]}\n"; break ;; 
m) printf %b "\e8\e[K message:"; read -ep " " -i "$msg1" "msg1"; figg ;; 
esac; done; 
}; 

