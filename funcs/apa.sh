
apa() { 
local IFS=$'\n '; 
unset ny sudo; 
hash sudo 2>/dev/null && sudo=sudo; 
[ $PREFIX ] && unset sudo; 
[ $UID = 0 ] && unset sudo; 
# [[ $COLUMNS > 22 ]]&& bw="70%,right";
# pwd="${PWD}"; 
printf %b "\n.... to update run [apass] ....\n"|\
bat -ppflc --theme Dracula; 
cd $HOME/logs/apts &>/dev/null; 
aapp=($(ls|fzf --query " $1" -i -m --color \
preview-bg:0 --bind "q:abort" --preview "cat {}" \
--preview-window "wrap,8,noborder,top" \
--cycle --ansi --inline-info))||\
(printf %b "\n\n"&& cd $pwd &>/dev/null&& return 1;)||\
return 1; cd - &>/dev/null && \ 
printf %b "\n\n"; (printf %b " -- Install: "; 
printf %b "${aapp[*]}"|tr -s "\n" ","; bb="\b"; 
[[ ${#aapp[*]} == 1 ]]&& unset bb; 
printf %b "$bb ? [Y/n] ")|bat -ppflc --theme Nord; 
cd - &>/dev/null; 
read -s -n1 "ny"; if [ -z $ny ]; then 
printf %b "\e[92m OK\e[0m \n\n"; 
cd - &>/dev/null; 
$sudo apt update; $sudo apt upgrade -y; 
$sudo apt install -y ${aapp[*]}; 
$sudo apt autoremove -y; 
else cd - &>/dev/null; 
printf %b "\n\$aapp\n"; return 0; fi; 
printf %b "${aapp[*]}\n\n";
}; 
