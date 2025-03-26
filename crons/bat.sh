termux-battery-status > ~/logs/battery.log; 
bat="$(cat ~/logs/battery.log |grep -e "percentage"|tr -d 'A-z ,\":';)"; 
b="$(seq -w 000 $((bat - 1))|tail -n1|cut -c2)"; 
bc=6; cat ~/logs/battery.log|grep -e "CHARGHING" && bc=4
printf %b "\e[0m\e[3${bc}m(\e[9${b}m${bat}\e[3${bc}m)\e[0m" > ~/logs/bat.sh; 
