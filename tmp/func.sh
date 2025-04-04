#!/bin/bash 
## Authenticates github
12_gh_auth() { 
printf "\e[0m\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\e[22A"; 
sudo apt install gpg git gh -qqy 2>/dev/null; 
c2='\e[0m\e[36m--\e[0m'; 
printf "\n\n$c2 ants folder:"; read -rep " " -i "$ants" "ants"; 
gpg --pinentry-mode loopback -o "gh.txt" -d "$HOME/config/gpg/gh_aeniks.gpg";
gh auth login --with-token < "gh.txt"; printf "$c2 "; rm gh.txt;sleep .2;
gh auth status&& printf "\n\n     \e[42m       OK      \e[0m\n\n"; sleep 2; echo;echo;echo; 
printf "$c2 also make gh user agent? [Y/n]"; read -n1 -rep " " "yn";
[ "$yn" ]&&return; 
printf "$c2 gh username:"; 
read -rep " " -i "$(hostname)" "ghuser"; 
git config --global user.name $ghuser; 
printf "$c2 gh user mail:"; read -rep " " -i "$ghuser@" "ghmail"; 
git config --global user.email $ghuser; 
git config --global init.defaultBranch main; 
##
printf "$c2 new gh key?; "; read; 
[ "$(id -u)" -eq 0 ]&& (echo "cant be root"; read );
printf "$c2 gh email/login:"; read -rep " " -i "$ghmail" "ghmail";
printf "$c2 name for key:"; read -rep " " -i "$(hostname)" "githubs";
echo 'Host *
ForwardAgent yes
' >> ~/.ssh/config;
ssh-keygen -C $ghmail;
chmod 600 ~/.ssh/$githubs ~/.ssh/config; 
eval "$(ssh-agent -s)"; 
ssh-add ~/.ssh/$githubs;
gh ssh-key add id_ed25519.pub --type authentication --title $githubs;
sudo systemctl restart ssh;
ssh -T git@github.com;
printf "\n\n ok\n\n";
} 
#!/bin/bash
## 
halo() {
printf "\e[?25l\e[$((LINES/6))H";
for i in {1..111}; do printf "\e[38;5;${i}m\n\n\n\n"; 
figlet -f DOS_Rebel "hello!" -w $COLUMNS -c; printf "\e[14A"; read -n1 -t.1 -res x; 
[ "$x" ]&&break; done; 
for i in {111..222}; do printf "\e[38;5;${i}m\n\n\n\n"; 
figlet -f DOS_Rebel "hello!" -w $COLUMNS -c; printf "\e[14A"; read -n1 -t.1 -res x; 
printf "\e[$((RANDOM%6))A\e[$((RANDOM%2))B"
[ "$x" ]&&break; done; 
printf "\e[?25h\e[8B\n\n\n\n\n\n\e[$((COLUMNS/2-16))G";
read -n1 -srep "  ok? [Y/n]" "f"; [ "$f" ]||\
printf "\e[$((COLUMNS/2-16))G  \e[7m   ok!   \e[0m \n\n\n\n\n\n"
}



#!/bin/bash
## klock
klock() {
printf "\e7\e[?25l\e[?47h"; clear;
########### variables
#figlist=($(figlist|batcat -pp --line-range 4:|head -n-5)); 
###################
figlist=(3d 4x4_offr fender contrast Electronic 4maxebbs_1__ aquaplan doh Big_Money-sw Electronic s-relief devilish Big_Money-nw poison )
figfont="$(shuf -n1 -e ${figlist[@]})"; figlength="$(figlet -f "$figfont" $(date +%T))";
###########
########### funtions
fsize() { 
sizeh=$(stty size|cut -f1 -d" "); sizew=$(stty size|cut -f2 -d" "); 
sizehh="$((${sizeh}/2-9))"
} 
fsize; 
ftime() { 
printf "\e[$((${sizeh}/2-8));$((${sizew}/2-2))H\e[1m$(date +%H:%M)"; ## print time plainly ## move to center
printf "\e[$((${sizeh}/2-4))H\e[0J";  
} 
fday() { 
dag="$(date +%#A" den"%e":de "%#B)"; daghw=$((${#dag}/2)); halfw=$((${sizew}/2)); printf "\e[2m\e[2J\e[${sizehh};$((${halfw}-${daghw}))H${dag}\e[0m"; ## print day
} 
while true; do figfont="$(shuf -n1 -e ${figlist[@]})"; figlength="$(figlet -f "$figfont" $(date +%T))"; [ "${#figlength}" -gt 8 ]&& break; done; fday; 
while true; do date="$(date +%H:%M;)"; ftime; lang='c#'; 
[ "$1" ] && figfont="$1" && key="s";
[ "$2" ] && lang="$2";
if [ "$lang" != 22 ]; then figlet -w "$sizew" -cf "$figfont" "$date"|batcat -Ppl "$lang"; ## time
else printf "\e[36m"; figlet -w "$sizew" -cf "$figfont" "$date"; fi; ## time
read -t60 -srn1 "key"||key=0; printf "$((kk++))\e[2K"; [ "$kk" -eq 44 ] && key="c" && kk="0";
if [ "$key" = "c" ]; then figfont=$(shuf -n1 -e ${figlist[@]}); fsize; fday; 
printf "\e[2m\e[${sizehh};$((${halfw}-${daghw}))H${dag}\e[0m\e[0J"; 
printf "\e[H\e[2m$lang $figfont          "; 
elif [ "$key" = "" ]; then break; 
elif [ "$key" = "q" ]; then break; 
elif [ "$key" = " " ]; then break; 
elif [ "$key" = "s" ]; then kk="45"; printf "\e[2m\e[0;${sizew}Hs"; printf "$figfont\n" >> ~/figz.sh;
elif [ "$key" = "l" ]; then fsize; fday; 
lang=$(shuf -n1 -e ${figlist[@]}); printf "\e[2m\e[H$lang $figfont       ";
fi; done; 
printf "\e[?47l\e[?25h\e[0m\e8";
}

#klock




#!/bin/bash
## /ants/functions.sh - functions for bash shell
###################
## multiselection menu for bash
menu() { 
olpwd="$PWD"; size=($(stty size)); for i in $(seq $size); do echo; done; 
echo -ne '\e[s\e[H\e[J'; green='\e[92m'; cyan='\e[36m'; re='\e[0m'; 
dim='\e[2m'; bold='\e[1m'; c2='\e[36m--\e[0m';
command=bash; [ "$2" ]&& command="$2"; hello=hello; [ $3 ]&& hello=$3; 
dots="$(for i in $(seq $(($(stty size|tail -c4) - 11))); do echo -ne .; done;)"; 
echo -e "$re -------------------  ${green}$hello${re}  --------------------------
 ------------------------------------------------------
 -- [${dim} ^ v ${re}]$dim$cyan Choose${re} ---- \
[${dim}a${re}]$dim$cyan Select all${re} ---- [${dim}h${re}]$dim$cyan Help${re} --
 -- [${dim}Enter${re}]$dim$cyan Select${re} ---- \
[${dim}c${re}]$dim$cyan Confirm${re} ------- [${dim}q${re}]$dim$cyan Exit${re} -- ";
unset OPTIONS_VALUES OPTIONS_STRING SELECTED CHECKED OPTIONS_LABELS ov1 cd; 
if [[ $1 ]]; then cd $1; OPTIONS_VALUES=($(ls -p|grep -v /)); else OPTIONS_VALUES=($(ls -p $PWD/$1)); fi; 
if [[ $4 ]]; then for i in ${OPTIONS_VALUES[@]}; do
OPTIONS_LABELS+=("\e[2m $($4 "$i";) "); done; 
else for i in ${OPTIONS_VALUES[@]}; 
do ft=$(file $i --mime-type -b|head -c4); if [[ $ft == "text" ]]; then
OPTIONS_LABELS+=("\e[2m $(sed -n 2p $i|tr -s ';()\\' ' '|cut -c-${size[1]}) "); else 
OPTIONS_LABELS+=("\e[2m $(file -b $i|cut -c-${size[1]}) "); fi; done; echo -e "\e[0J"; fi; 
for i in "${!OPTIONS_VALUES[@]}"; do 
OPTIONS_STRING+="$dots\e[6G "${OPTIONS_VALUES[$i]%/$PWD/}" \e[22G ${OPTIONS_LABELS[$i]};"; done;
OPTIONS_STRING+="\e[1K\n\e[6G\e[1m${cyan} Confirm"; 
####################
checkbox () {
## little helpers for terminal print control and key input
ESC=$( printf "\x1B")
cursor_blink_on()   { printf "$ESC[?25h"; }
cursor_blink_off()  { printf "$ESC[?25l"; }
cursor_to()         { printf "$ESC[$1;${2:-1}H"; }
print_inactive()    { printf "$2  $1 "; }
print_active()      { printf "$2 $ESC[7m $1 $ESC[27m"; }
get_cursor_row()    { IFS=';' read -sdR -p $'\E[6n' ROW COL; echo ${ROW#*[}; }
key_input()         {
local key; IFS= read -rsn1 key 2>/dev/null >&2; 
if [[ $key = "" ]]; then if [[ ${active} == $((idx - 1)) ]]; 
then echo -e "c"; else echo enter; fi; fi; 
if [[ $key = "q" ]]; then echo -e "q"; fi; if [[ $key = "h" ]]; then echo -e "h"; fi; 
if [[ $key = "c" ]]; then echo -e "c"; fi; if [[ $key = "a" ]]; then echo -e "a"; fi; 
if [[ $key = $'\x20' ]]; then echo space; fi; if [[ $key = $'\x1B' ]]; then read -rsn2 key; 
if [[ $key = [A ]]; then echo up; fi; if [[ $key = [B ]]; then echo down; fi; fi; 
 }; 
#####################
## toggler ##########
toggle_option() { arr_name=$1; eval " arr=(\"\${${arr_name}[@]}\")"; option=$2; 
if [[ ${arr[option]} == true ]]; then arr[option]=
else arr[option]=true; fi; eval $arr_name='("${arr[@]}")'; };  
retval=$1; IFS=';' read -r -a options <<< "$2"; if [[ -z $3 ]]; 
then unset defaults; else IFS=' ' read -r -a defaults <<< "$3"; fi; 
selected=(); for ((i=0; i<${#options[@]}; i++)); do
selected+=("${defaults[i]:-false}"); printf "\n"; done
## determine current screen position for overwriting the options
lastrow=$(get_cursor_row); startrow=$(($lastrow - ${#options[@]})); 
## ensure cursor and input echoing back on upon a ctrl+c during read -s
trap "cursor_blink_on; stty echo; printf '\n'; exit" 2
cursor_blink_off; active=0; while true; do idx=0;
## print options by overwriting the last lines
for option in "${options[@]}"; do prefix="\e[0m [ ]";
if [[ ${selected[idx]} == true ]]; then prefix="\e[0m [$green*$re]"; fi
cursor_to $(($startrow + $idx)); if [ $idx -eq $active ]; 
then print_active "$option" "$prefix"; else print_inactive "$option" "$prefix"; fi; ((idx++)); done;
## user key control
case `key_input` in
enter) toggle_option selected $active;;
space) toggle_option selected $active;;
a) sel_all selected $active;;
c) break;;
h) halp;;
q) cd "$olpwd"; echo -e "\e[?25h"; return 0;;
up) ((active--)); if [ $active -lt 0 ]; then active=$((${#options[@]} - 1)); fi;;
down) ((active++)); if [ $active -ge ${#options[@]} ]; then active=0; fi;;
esac; done; cursor_to $lastrow; echo; cursor_blink_on; eval $retval='("${selected[@]}")'; } 
####################
## select all ######
sel_all() { arr_name=$1; eval " arr=(\"\${${arr_name}[@]}\")"; option=$2; 
if [[ ${arr} == true ]]; then for oi in ${!arr[@]}; do arr[oi]=; done; else 
for oi in ${!arr[@]}; do arr[oi]=true; arr[-1]=""; done; fi; eval $arr_name='("${arr[@]}")'; } 
#####################
## help-section ####
halp() { echo -e '\n\n\e[6m'$cyan'--\e[37m bash-menu '$c2' \n
-- use as such: \n\nmenu "option1 option2 opt..." "command" "desc" \n
if no args are made default options are current folder contents. 
"bash" is default command. \ndefault descriotion if second line from file if readable. 
else file class is displayed.\n\n'$cyan'--'$re'\nhttps://github.com/aeniks\n'$cyan'--'$re'
enjoy!\n'$c2'\n\n\n\n['$cyan'Q'$re']uit\n\n\n\n'|less -JR --use-color --tilde --quotes=c; }; 
#####################
checkbox SELECTED "$OPTIONS_STRING"; ######## << call functions
for i in "${!SELECTED[@]}"; do if [ "${SELECTED[$i]}" == "true" ]; 
then CHECKED+=("${OPTIONS_VALUES[$i]}"); fi; done; 
## confirm ##########
if [ -z $CHECKED ]; then 
echo -e "\n \e[4;32mYou chose:\e[0m nothing"; cd "$olpwd";
echo -ne "\n $c2 Try again? \e[2m[\e[0my\e[2m/\e[0mN\e[2m]\e[0m "; 
read -n1 -ep "" "yn"; 
if [ "$yn" != "${yn#[Yy]}" ]; 
then menu "$1" "$2" "$3" "$4"; return 0; 
else cd "$olpwd"; echo -e "\e[?25h\n Nope\n"; return 0; fi
else
echo -e "\n \e[4;32mYou chose:\e[0m${CHECKED[@]/#/\\n" "}";
#echo -ne "\n $c2 Current command to execute is: $cyan$command$re "
echo -ne "\n $c2 Do you wish to proceed? \e[2m[\e[0mY\e[2m/\e[0mn\e[2m]\e[0m "; 
read -n1 -ep "" "yn"; if [ "$yn" != "${yn#[Nn]}" ]; then 
cd "$olpwd"; echo -e "\e[?25h\n Nope\n"; 
return 0; else 
echo -e "\n $c2 OK"; 
## after ############
## EXECUTE ##########
printf " $c2 Command to execute:"; read -rep " " -i "$command" "command";
for i in "${CHECKED[@]}"; do echo -e "\e[0m $c2 Installing $i \e[2m"; sleep 0.1; 
#[ "$2" ]|| bash $i; [ "$2" ]&& 
$command $i; 
echo -e "\e[0m $c2 $i$green Installed$re \e[2m"; done; cd $olpwd; echo -e "\n Done"; fi; 
echo -e "\e[0m"; fi; 
}; ## END MENU ##
#################
## 12_ menu #####
#################
note() {
echo -e "\n\n -- syncing...\n\n"; 
gh gist edit 4b5c805719fe0855a10f9d4fbdd197e1||gh gist edit 4b5c805719fe0855a10f9d4fbdd197e1||
(read -n1 -rep "-- login with token? [Y/n] " "yn"; [ "$yn" ]&& return; 
printf "\n\n$c2 ants folder:"; read -rep " " -i "$ants" "ants"; 
gpg --pinentry-mode loopback -o "~/gh.txt" -d "$HOME/config/gpg/gh_aeniks.gpg"; 
gh auth login --with-token < "~/gh.txt"; printf "$c2 "; rm ~/gh.txt;
gh auth status&& printf "\n\n\e[42m OK \e[0m\n\n"; 
printf "\n  try again \n\n"; )
}
#!/bin/bash
## selection menu 
qmenu() { local IFS=" \n";local ops=($2);[ "$2" ]||local ops=(*); 
local prompt="$1" index="0" cur="0" count="${#ops[@]}" esc=$(echo -ne "\e");
printf "\e[?25l    --$prompt--\n"; ## print prompt
while true; do local index="0"; for o in "${ops[@]}"; ## print options
do if [ "$index" == "$cur" ]; then echo -e " > \e[7m $o \e[0m"; ## mark & highlight the current option
else echo -e "    $o  "; fi; (( index++ )); done; ## list all options (option list is zero-based)
read -srn1 key; ## wait for user to key in arrows or ENTER
if [[ $key == A ]]; then printf %b "\e[Kk"; (( cur-- )); (( cur < 0 ))&& (( cur = 0 )); \
elif [ "$key" = B ]; then (( cur++ )); (( cur >= count ))&& (( cur = count - 1 )); 
elif [[ $key == "" ]]; then break; \
elif [[ $key == "q" ]]; then break; fi; # enter
echo -en "\e[${count}A"; done; # go up to the beginning to re-render
printf -v sel "${ops[$cur]}"; printf  "\e[?25h\n \e[7m $sel \e[0m\n\n"; }; 



rs() {
printf "\e[A\e[2K\e[7m rsync reciever: \e[0m\n"; 
rsto="$(ls $ants/sh/config/ssh|fzf --margin 0,12,0,12 --border rounded --preview 'cat $ants/sh/config/ssh/{}' --preview-window border-left  --info=inline --height='~22%' --scroll-off=12 --header '-- ssh to: --')"; 

printf "\e[A\e[2K\e[7m rsync files: \e[0m\n"; 
rs=("$(ls -ptr|grep -v '/'|fzf --height='~42%' --scroll-off=12 -m --info=inline --margin 0,12,0,12 --border rounded --preview 'cat {}' --preview-window border-left)"); 
printf "\n${rs[*]}\n\n"; 
printf "\e[A\e[2K\n -- to: \t"; 
[ "${rsto}" = "new" ] && read -rep " " -i "192.168.0.10" 'rsto'; 
read -rep " " -i "$rsto" 'rsto'; 
printf " -- user: \t"; 
read -rep " " -i 'aa' 'rsuser'; 
printf " -- folder: \t"; 
read -rep " " -i '~/rs/' 'rsfold'; 
rsync -a --info=name1 ${rs[*]} ${rsuser}@${rsto}:${rsfold} ; 
printf "\n\e[7m$rsuser@$rsto:$rsfold\e[0m\n";
ssh "$rsuser"@"$rsto" 'printf "\e[35m$HOME'"${rsfold/\~/}"'\n\e[0m"; ls -ptcr '"$rsfold"'|tail -n12'
} 



#fzf --margin 0,12,0,12 --height ~12% --preview "cat {}" --border rounded
