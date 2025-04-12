#!/usr/bin/env bash
## display 
qw() { 
dim="\e[2m" re="\e[0m" figga="$HOME/logs/figga.sh"; 
unset msg1; [[ $1 ]] && msg1="$@" 
# local IFS=$'\n\t '; 
IFS=$'\n\t'; 

bb=($(cat $start/config/bat/batl.sh)); b=${#bb[*]}; d=$((RANDOM%${b})); 
ff=($(cat $HOME/logs/figz.sh)); t=${#ff[*]}; h=$((RANDOM%${t})); 

printf %b "\e[K"; for i in $(seq $LINES); do sleep .01; echo; done; 
printf %b "\e[2A\e7\e[K$n${ff[$h]}\[2A\e[1J\e[2H"; 
figlet -f "${ff[$h]}" -w $COLUMNS -c "${ff[$h]}"|bat -ppfl${bb[d]}; 
# printf %b "\e8\e[K$n${ff[$h]}"; 

figg() { printf %b "\e8\e[2A\e[1J\e[2H"; 
if [[ $msg1 ]]; then msg="$msg1"; else msg="${ff[$h]}"; fi; figlet -f "${ff[$h]}" -w $COLUMNS -c "${msg}"|bat -ppf --language "${bb[d]}"; 
# ||h=$((RANDOM%${t}))|| d=$((RANDOM%${b})); 
printf %b "\e8\e[K $re $h/$t \t $n${ff[$h]} $re\e[$((COLUMNS / 2))G  $re$d/$b \t $p${bb[$d]} \e[K";
}; 
# [[ $d > 1 ]] && 
# [[ $d < $b ]] && 
while read -n1 -rs k; do case $k in 
 A) [[ $h < $t ]] && ((h++))&& n="\e[38;5;$((h / 6 + 44))m"; figg ;; 
 C) ((d++)); p="\e[38;5;$((d / 6 + 44))m"; figg ;; 
 B) [[ $h > 1 ]] && ((h--))&& n="\e[38;5;${h}m"||n="\e[41;2m END $re"; figg ;; 
 D) ((d--)); p="\e[38;5;${d}m"; figg ;; 
r|"") h=$((RANDOM%${t})); d=$((RANDOM%${b}))&& n="\e[38;5;$((h / 6))m"; figg ;; 
s) printf %b "\n${ff[$h]}" >> $figga; 
printf %b "\n\e[K\t $n\e[7m${ff[$h]}$re$dim saved to $re$figga"; sleep 2; figg ;; 
q) printf %b "\e8\e[K$n${ff[$h]}\n"; break ;; 
m) printf %b "\e8\e[K message:"; read -ep " " -i "$msg1" "msg1"; figg ;; 
esac; done; 
}; 

