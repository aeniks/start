#!/bin/bash
#### installer 



intro12() {
size=($(stty size)); 
s=sudo; [ "$SUDO_UID" ]&& s=' ';
dots="$(for i in $(seq $(($(stty size|tail -c4) - 11))); do echo -ne "·"; done;)";
c2='\e[36m--\e[0m'; re='\e[0m'; dim='\e[2m'; bold='\e[1m'; green='\e[92m'; cyan='\e[36m'; 
[ -z "$LINES" ]&& LINES="${size}"; [ -z "$COLUMNS" ]&& COLUMNS="${size[1]}"; 
dl="${PWD}"; 
qq="${HOME}/qq"; 
####
ynoo() { printf '[Y/n]'; read -rsn1 "ynoo"; [ -z "$ynoo" ]&& break 2>/dev/null|| return 2>/dev/null; } 
alias br='printf "\n"'; alias pp='printf'
roll() { prompt=" ${@}"; for i in $(seq ${#prompt}); do printf "${prompt:${i}:1}"; sleep .04; done; sleep .4; } 
printf "\e[0m -- hello ! \n"; 
rollups() { 
printf "\e[8m"; 
ruru=$((LINES-8)); 
[ "${1}" ]&&ruru="${1}"; 
for i in $(seq "${ruru}"); do printf "\n"; sleep 0.1; done; 
printf "\e[0m"; 
}; 
rolldowns() { 
printf "\e[8m"; 
ruru=$((LINES-8)); 
[ "${1}" ]&&ruru="${1}"; 
for i in $(seq "${ruru}"); do printf "\e[A"; sleep 0.1; done; 
printf "\e[0m"; 
}; 

rollups
unset qq_up qq_bash qq_dl; sleep 1;
printf "\n\e[12;8H"; roll "hello! "; 
printf "\n\e[8G"; roll 'update system? '; printf ' \t'&& ynoo&& qq_up=y; 
printf "\n\e[8G"; roll 'download qq? '; printf ' \t'&& ynoo&& qq_dl=y&&
printf "\n\e[8G"&& roll 'whereto dl? '&& printf ' \t'&&read -rep "" -i "$HOME" "dl"&& qq="${dl}/qq";
printf "\n\e[8G"; roll 'qq folder?: '&& printf ' \t'&&read -rep "" -i "$qq" "qq"; 
printf "\n\e[8G"; roll 'auto start? '&& printf ' \t'&&ynoo&& qq_bash=y; 
printf "\n\n\n\n"; rollups 8; 
[ "$qq_up" = y ]&& $s apt update; apt -y upgrade; 
[ "$qq_up" = y ]&& $s apt install -y git wget curl openssl; 
[ "$qq_dl" = y ]&& git clone https://github.com/aeniks/qq "${dl}/qq"; 
[ "$qq_bash" = y ]&& printf "\nexport qq="'"'${qq}'"'"  \nqq_hf="'"'${dl}'"'"\n" >> "${HOME}/.bashrc"; 
# $s cp $qq /etc/ -R; 
# printf "\nexport qq=/etc/qq\n" >> /etc/bash.bashrc; 
##[ "${qq:(-1)}" = '/' ] last /
##[ "${qq/#*\/" = "qq" ] last qq 
rollups 
printf "\e[0mgg"; 
rolldowns 
cd "$qq"; . start.sh; 

}
#
#
intro12 
printf "\n\ngg\n\n"; 
#
#
return 2>/dev/null; 
break 2>/dev/null; 
##
###################
#
