termux-battery-status > ~/logs/battery.log; 
bat="$(cat ~/logs/battery.log |grep -e "percentage"|tr -d 'A-z ,\":';)"; 
b="$(seq -w 000 $((bat - 1))|tail -n1|cut -c2)"; 
bc="\e[2;36m"; cat ~/logs/battery.log|grep -e "CHARGING" &>/dev/null && bc="\e[1;92m";
printf %b "${bc}[\e[0m\e[9${b}m${bat}${bc}]\e[0m" > ~/logs/bat.sh; 
