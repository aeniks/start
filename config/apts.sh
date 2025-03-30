#!/bin/bash
## apts 
##########
apts_basic=(
file libexif-dev openssl openssh-server rsync rclone w3m w3m-img googler exiftool mediainfo figlet lolcat lynx fortune-mod links2 toilet iproute2 net-tools nmap fastfetch neofetch fzf fortune fortune-mod fortunes ccze lf batcat btop htop ncdu bash-completion lsd tmux git gh nodejs nmap texinfo aha micro fortunes gnupg wget wget2 curl aria2 gh git rclone rsync iw timg topgrade gnupg)
####
####
apts_termux=(
termux-api termux-tools 
)
####
####
apts_extra=(
ffmpeg mpv golang clang 
)
####
####
apts() { 
IFS=$'\n '; mkdir -p -m 775 $HOME/logs/apts 2>/dev/null; 
for i in ${apts_basic[*]}; do $sudo apt show $i 2>/dev/null|grep -e "Installed-Size" -e "Description" > $HOME/logs/apts/_$i; 
cat  $HOME/logs/apts/_$i 2>/dev/null|cut -f2- -d" " > $HOME/logs/apts/$i; 
[ $(wc -l $HOME/logs/apts/_$i|cut -b1-2) -eq 0 ] 2>/dev/null && rm $HOME/logs/apts/$i; 
done; rm $HOME/logs/apts/_*; 
}; 

