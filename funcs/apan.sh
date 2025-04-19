apan() { 
local IFS=$'\n '; unset sudo; [ -z $PREFIX ] && sudo=sudo; 
[ -d $HOME/logs/apts ] && [[ $(wc -l $HOME/logs/apa.log 2>/dev/null) < 22 ]] && \
($sudo apt update 2>/dev/null && $sudo apt list 2>/dev/null|cut -f1 -d"/" > $HOME/logs/apa.log); 
apap=($(cat $HOME/logs/apa.log|\
fzf -m -i --bind q:abort --inline-info --cycle --preview \
"$sudo apt show {} 2>/dev/null|bat -ppflzig" --preview-window "wrap"))
[ -z $apap ] && printf %b "\n $c2 OK\n\n" && return 0; 
######
######
printf %b "\n\n\n\n\e[2A $c2 Install:"; for a in ${apap[*]}; do printf %b " $a ,"; done 
printf %b "\b? [Y/n] "; 
read -n1 -rs "ny"; if [ -z $ny ]; then 
printf %b "\e[5;38;${LINES}m"; 
$sudo apt update && $sudo apt upgrade -y;
for i in ${apap[*]}; do $sudo apt install -y $i; 
printf %b "\n$i -- Installed \n"; sleep 1; done; 
$sudo apt autoremove; 
fi; printf %b "\n $c2 OK\n\n"; 
}; 

