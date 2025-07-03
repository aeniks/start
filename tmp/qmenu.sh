#!/bin/bash
## selection menu 
qmenu() { local IFS=$'\n\t ';local ops=($2);[ "$2" ]||local ops=(*); 
local prompt="$1" index="0" cur="0" count="${#ops[@]}" esc=$(echo -ne "\e");
printf "\e[?25l    -- $prompt --\n\n"; ## print prompt
while true; do local index="0"; for o in "${ops[@]}"; ## print options
do if [ "$index" == "$cur" ]; 
then printf %b "\e[0m > \e[7m $o \e[0m\e[K\n"; ## mark & highlight the current option
else printf %b "\e[0m    $o  \e[K\n"; 
fi; 
(( index++ )); 
done; ## list all options (option list is zero-based)
read -srn1 key; ## wait for user to key in arrows or ENTER
if [[ "$key" == A ]]; then (( cur-- )); (( cur < 0 ))&& (( cur = 0 )); 
elif [ "$key" == B ]; then (( cur++ )); (( cur >= count )) && (( cur = count - 1 )); 
elif [[ $key == C ]]; then mark+=(${ops[$cur]}); 
printf %b "\e[s\e[6;22H\e[K${mark[@]}\e[K\e[u"; 
elif [[ $key == "" ]]; then break; 
elif [[ $key == "q" ]]; then break; fi; # enter
echo -en "\e[${count}A"; done; # go up to the beginning to re-render

printf -v sel "${ops[$cur]}"; printf  "\e[?25h\n \e[7m $sel \e[0m\n\n"; }; 
