#!/bin/bash
## apts 
##########

####
####
12apts() { 
####
unalias p_ 2>/dev/null; p_() { sleep .02; printf %b "."; }; 
####
#apts_basic=(file libexif-dev openssl openssh-server rsync rclone w3m w3m-img googler exiftool mediainfo figlet lolcat lynx fortune-mod links2 toilet iproute2 net-tools nmap fastfetch neofetch fzf fortune fortune-mod fortunes ccze lf batcat btop htop ncdu bash-completion lsd tmux git gh nodejs nmap texinfo aha micro fortunes gnupg wget wget2 curl aria2 gh git rclone rsync iw timg topgrade gnupg); 
####
####
#apts_termux=(termux-api termux-tools)
####
####
#apts_extra=(ffmpeg mpv golang clang)
####
####

IFS=$'\n '; mkdir -p -m 775 $HOME/logs/apts_basic 2>/dev/null; 
hash sudo 2>/dev/null && sudo=sudo; hash fzf 2>/dev/null||apt install fzf -y &>/dev/null; 
printf %b "\n\n\n\n\n\e[4A \e[96m--\e[0m Update apts? [${dim}Y${re}/${dim}n${re}] "; 
read -rsn1 "ny"; [ $ny ]&& echo && echo && return 0; 
echo; 
#printf %b " \e[96m--\e[0m Updating "; p_; p_; p_; p_;  
## LOADING_ANIMATIONS

loader() {
BLA_metro=( 0.1 '       ' '=      ' '==     ' '===    ' ' ===   ' '  ===  ' '    ===' '     ==' '      =' '       ' '       ' '       ' '       ' '       ' )
BLA_passing_dots=( 0.25 '.  ' '.. ' '...' ' ..' '  .' '   ' )
printf %b "\e7\e[0;37m [       ] "; 
printf %b "\e[0K\e[2mLoading ... $1 $2 $3 $4"|tee $HOME/logs/load.log &>/dev/null; 
printf %b "\e[0K\e[2m$(tail -n1 $HOME/logs/load.log 2>/dev/null)\e[0K\e8"; 
declare -a BLA_active_loading_animation; size=($(stty size));
BLA::play_loading_animation_loop() {
while true; do for frame in "${BLA_active_loading_animation[@]}"; do
printf %b "\e8\e7"; printf %b "$(printf %b "\e[0;37m[ \e[0;3$((RANDOM%6+1))m")${frame}$(echo -e "\e[0;37m]$re ")"; 
sleep "${BLA_loading_animation_frame_interval}"; done; printf %b "\e[0K\e[2m$(tail -n1 $HOME/logs/load.log 2>/dev/null)\e[0K\e8"; done; 
}; 

BLA::start_loading_animation() { BLA_active_loading_animation=( "${@}" ); 
BLA_loading_animation_frame_interval="${BLA_active_loading_animation[0]}"; 
unset "BLA_active_loading_animation[0]"; printf %b "\e[0m"; tput civis;
BLA::play_loading_animation_loop & disown; printf %b "\eM"; 
# printf %b "\r\e[$((size/2-1));$((size[1]/2-8))H
# printf %b "\e[2;5;39mloading${re}... "; 
BLA_loading_animation_pid="${!}"; }; 
BLA::stop_loading_animation() { kill "${BLA_loading_animation_pid}" &>/dev/null; 
# printf "\r\e[$((size/2-1));$((size[1]/2-8))H"
printf %b "\e8\e[0m[\e[0;32m  done  \e[0m]\n\n"; 
# echo -e "\e[0m\e[0K\n\eM\e[0K";
tput cnorm 2>/dev/null; 
}
trap BLA::stop_loading_animation SIGINT
BLA::start_loading_animation "${BLA_metro[@]}"
# printf %b "\b $1 "; 
$@ 2>/dev/null|tee -a $HOME/logs/load.log &>/dev/null; 
# sleep 1; printf %b " almost ... \e[0K"; 
# sleep .2; printf %b "$green done!$re \e[0K"; 
BLA::stop_loading_animation
}; 
####
####

# apts_basic=($(command ls --color=none -1 $HOME/start/config/apts)); 
loader $sudo apt update; 
# &>/dev/null; 
[ $tmp ]||tmp=$HOME; tmep="${EPOCHSECONDS}"; tput civis 2>/dev/null; 
printf %b "\n\n\e[4A"; printf %b " \e[96m--\e[0m Updating: "; 
$sudo apt update &>$tmp/$tmep.log; 
$sudo apt upgrade -y &>$tmp/$tmep.log; 
cd $HOME/start/config/apts; apts_basic=($(fzf -m -i --cycle --bind "q:abort,a:toggle-all" --info inline --header "$(printf %b '\e[96m[a]\e[0mll  \e[96m [q]\e[0muit  \e[96m [tab]\e[0mchoose  \e[96m[enter]\e[0mconfirm')" --preview 'cat {}|grep -E "Description: |Download-Size: " -C1|bat -ppfljava --theme Nord' --preview-window 'top,14,wrap')); cd $OLDPWD; 
for i in ${apts_basic[*]}; do 
printf %b ".\e7"; loader $sudo apt install -y $i 2>/dev/null >$tmp/$tmep.log; 
printf %b "\e[18G\e[38;5;$((RANDOM%66 + 98))m\e[0K $i \e[0m\e8"; 
#[ $(wc -l $HOME/logs/apts_basic/$i|cut -b1-2) -eq 0 ] 2>/dev/null && rm $HOME/logs/apts_basic/$i; 
done; 
tput cnorm 2>/dev/null; 
printf %b "\e[K\n\e[K \e[96m--\e[0m DONE\n\n"; 
}; 


# $sudo apt show $i 2>/dev/null > $HOME/logs/apts_basic/_$i; $sudo apt show $i 2>/dev/null > $HOME/logs/apts_basic/_$i; cat $HOME/logs/apts_basic/_$i 2>/dev/null|grep -e "Description" -A 12 > $HOME/logs/apts_basic/$i; cat $HOME/logs/apts_basic/_$i 2>/dev/null|grep -e "Installed-Size" >> $HOME/logs/apts_basic/$i; rm $HOME/logs/apts_basic/_* 2>/dev/null; 

