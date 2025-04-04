## discover lan w ping & ssh 
12localan() { 
#ipt=$(mktemp; ); 
mkdir -p $HOME/logs/iplocal/ 2>/dev/null; rm $HOME/logs/iplocal/* 2>/dev/null;  
printf %b "\e[?25l\n $c2 checking:\t\t [q]uit\n\n\n\n\e[4A\n"; 
for i in {0..255}; do ping -c 1 ${iploc%.*}.${i} &>/dev/null && \
printf %b "$i" && 
touch $HOME/logs/iplocal/${iploc%.*}.$i & disown; 
# printf %b "\e[K\n${iploc%.*}.$i" && 
printf %b "\e[K\e[A\e[K"; 
read -t 0.02 -n1 -s -p "${iploc%.*}.$i " "ny"; 
[ $ny ]&& printf %b "\e[?25h"&& break; done; 
# printf %b "${iploc%.*}.$i\n" >> "$ipt"& disown; \

printf %b "\e[?25h";  
printf %b "\e[K\n--------\n\$iplocal\t$ipt
--------\n\n"; 
# ipends=($(cat $ipt|cut -f4 -d"."; ));
rm $HOME/logs/iplocal/$iploc 2>/dev/null; 
iplocal=($(command ls $HOME/logs/iplocal; )); 
# iplocall=-($iploc);
command ls "$HOME/logs/iplocal"; echo; 
for i in ${iplocal[*]}; do \
nmap --open $i -p 22,8022|grep -e "open"|cut -f1 -d"/" >> \
$HOME/logs/iplocal/$i; done; 

lomenu
echo
read -rep "user:" -i "aa" "user"; echo; 
ssh -p $(cat $sel) $sel -l $user; 

}; 
printf %b "\e[?25h"; 
## selection menu 
lomenu() { 
local IFS=$'\n' ops=($2); [ "$2" ]||local ops=($(command ls -1 $HOME/logs/iplocal)); 
# local desc=()
local prompt="$1" index="0" cur="0" count="${#ops[@]}" esc=$(echo -ne "\e") logs=$HOME/logs/iplocal;
printf "\e[?25l    --$prompt--\n"; ## print prompt
while true; do local index="0"; for o in "${ops[@]}"; ## print options
do if [ "$index" = "$cur" ]; then echo -e " > \e[7m $o -p $(cat $logs/$o) \e[0m"; ## mark & highlight the current option
else echo -e "    $o -p $(cat $logs/$o) "; fi; (( index++ )); done; ## list all options (option list is zero-based)
read -srn1 key; ## wait for user to key in arrows or ENTER
if [ $key = A ]; then (( cur-- )); (( cur < 0 ))&& (( cur = 0 )); elif [ $key = B ]; then (( cur++ )); (( cur >= count ))&& (( cur = count - 1 )); 
elif [ -z "${key}" ]&>/dev/null; then break; elif [ $key = "q" ]; then break; fi; # enter
echo -en "\e[${count}A"; done; # go up to the beginning to re-render
printf -v sel "${ops[$cur]}"; 
printf  "\e[?25h\n connect to: \e[7m $sel -p $(cat $logs/$o) \e[0m"; 
for i in {1..4}; do 
read -t0.4 -sren1 "ok"; [ "${ok}" ]&>/dev/null && return 0 2>/dev/null; printf "."; done;  printf ".\n\n"; 
}; 
