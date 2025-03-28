#!/bin/bash 
## install config-files 
instart() { 
mkdir $HOME/tmp 2>/dev/null; tmp="$HOME/tmp"; 
[ $start ]||start="$HOME/start"; hash sudo 2>/dev/null||alias sudo=' '; 
local IFS=$'\n ' green='\e[32m' dim='\e[2m' re='\e[0m' red='\e[31m' \
cyan='\e[36m' yellow='\e[33m' blue='\e[36m' bold='\e[1m' \
height="$(stty size|cut -f1 -d" ")" width="$(stty size|cut -f2 -d" ")" \
yno='\e[0m[\e[2mY\e[0m/\e[2mn\e[0m]' c2='\e[0m\e[36m--\e[0m' uu="60" \
enter='\e[0m[\e[2mq\e[0m]\e[2muit \e[0mor [\e[2mENTER\e[0m]' x="2>/dev/null"
####
unalias p1 p2 2>/dev/null; 
p2() { printf %b "$@"; }; 
p1() { p2=" ${@}"; for i in $(seq ${#p2}); do sleep .08; \
printf %b "${p2:${i}:1}"; done; }; ## rolling text 
####
for i in $(seq $height); do printf %b "\n\e[K"; sleep .04; done; ## scroll page 
for i in $(seq $((height - 2))); do printf %b "\e[A"; sleep .04; done; 
####
p2 " $c2 "; p1 "Install config?"; p2 "\e[1m $enter"; p1 " to continue ";
read -rsn1 "ny"; [ $ny ]&& printf %b "$green OK$re\n\n" && return 0; 
printf %b "$green OK$re"; sleep .2; echo; sleep .2; echo; 
####
_newcolor() { tput setaf $((RANDOM%6 + 1)) 2>/dev/null; 
printf %b "\e[38;5;$((uu++))m"; sleep .02; }; 
_move() { mv -bS "$EPOCHSECONDS" $1 $2 &>/dev/null; }; 
_link() { ln -s $1 $2 2>/dev/null; }; 
$sudo mv $PREFIX/etc/lf $tmp/ 2>/dev/null; 		_newcolor; 
$sudo ln $start/config/lf $PREFIX/etc/ -s  2>/dev/null; _newcolor; 
mkdir $HOME/.config 2>/dev/null; cd $HOME/.config;  _newcolor; 
echo; 
####
conf=(rclone lf micro tmux htop gh); 
####
for q in ${conf[*]}; do _move $HOME/.config/$i $tmp/; 
_link $start/config/$q $HOME/.config/ -s; sleep .2; 
printf %b "\n\e[0m"; p1 "Updated"; _newcolor; printf %b " $q"; 
done; echo; cd; 
# _move "rclone lf micro tmux htop gh" $tmp/; _newcolor; 
# cd $start/config/;  	_newcolor; 
# _link "rclone lf micro tmux htop gh" $HOME/.config/; _newcolor; 
##### 
_newcolor; printf %b "\e[0m\t\t"; 
cat $HOME/.bashrc|grep -e "anew.sh" &>/dev/null||\
printf %b "\n. $start/anew.sh;"&>/dev/null >> $HOME/.bashrc 2>/dev/null; 
#printf %b "\n. $cyan$/start/anew.sh$re >> $green$HOME/.bashrc\n"; 
touch $HOME/._tmux 2>/dev/null; chmod 775 $HOME/._tmux; echo; 
#######
########
########
_move "$HOME/.inputrc" $tmp/;  	_newcolor; 
_move "$HOME/.tmux.conf $HOME/.tmux.conf.local" $tmp/; 	_newcolor; 
_link $start/config/inputrc $HOME/.inputrc;  	_newcolor; 
########
#mv $HOME/.tmux.conf $HOME/tmp/ 2>/dev/null; 
#ln $HOME/start/config/tmux/tmux.conf $HOME/.tmux.conf --symbolic; 
########
#sleep .1; printf %b "\e[38;5;4$((u++))m"; ## newcolor 
#mv $HOME/.tmux.conf.local $HOME/tmp/ 2>/dev/null; 
#ln $HOME/start/config/tmux/tmux.conf.local $HOME/.tmux.conf.local --symbolic; 
########
#sleep .1; printf %b "\e[38;5;4$((u++))m"; ## newcolor 
_move "$HOME/.tmux_bash.sh" $tmp/;  	_newcolor; 
_link "$start/config/tmux/tmux_bash.sh" $HOME/.tmux_bash.sh;  	_newcolor; 
########
########
sleep .2; printf %b "\n $c2\e[2m [\e[0mDONE\e[2m]\e[0m!\n"; sleep .2;  	_newcolor; 
mkdir -p -m 775 $PREFIX/usr/share/figlet 2>/dev/null||\
$sudo mkdir -p -m 775 $PREFIX/usr/share/figlet 2>/dev/null; 
cp $HOME/start/config/figlet/fonts/* $PREFIX/usr/share/figlet/ 2>/dev/null||\
$sudo cp $HOME/start/config/figlet/fonts/* $PREFIX/usr/share/figlet/ 2>/dev/null; 
$sudo chmod 775 $PREFIX/usr/share/figlet -R 2>/dev/null; 
####
printf %b "\n\n\n\n\e[4A\n $c2"; p1 " Install apps"; p2 "\e[1m? $yno "; 
read -esn1 "ny"; [ $ny ]&& printf %b "\t\t $green OK$re\n\n" && return 0; 
p2 " $c2 "; p1 "updating system ..."; echo;echo; 
tput setaf 5 2>/dev/null; $sudo apt update; 
tput setaf 6 2>/dev/null; $sudo apt upgrade -y; 
tput setaf 4 2>/dev/null; echo ok; 
$sudo cp $start/start/config/ssss.sh $PREFIX/bin/ssss; 
####
apts_basic=(file libexif-dev openssl openssh-server \
rsync rclone w3m w3m-img googler exiftool \
mediainfo figlet lolcat lynx fortune-mod links2 \
toilet iproute2 net-tools nmap fastfetch \
neofetch fzf fortune fortune-mod fortunes \
ccze lf bat batcat btop htop ncdu \
bash-completion lsd tmux git gh nodejs \
nmap texinfo aha micro fortunes gnupg \
wget wget2 curl aria2 gh git rclone rsync iw timg); 
########
apts_extra=(ffmpeg mpv);
########
hash sudo 2>/dev/null && sudo="sudo"; 
########
[ -e "$HOME/logs/apa.log" ]||apt list>$tmp/x; 
tail -n+1 $tmp/x|cut -f1 -d"/">$HOME/logs/apa.log; 
########
apts_install=($(for i in ${apts_basic[*]}; do hash $i 2>/dev/null || \
grep $HOME/logs/apa.log -x -e "$i"; done; )); 
########
#### ####
for i in ${apts_install[*]}; do 
hash $i 2>/dev/null && printf %b "\n$reSkipping $cyan $i$re already installed$green"; 
printf %b "\e[38;5;$((uu++))m\n"; 
hash $i 2>/dev/null || (printf %b "\nInstalling $i \e[0;1m"; p1 " ..."; 
printf %b "\n\e[0;2m"; )&& \
hash $i 2>/dev/null || $sudo apt install -y $i &>/dev/null; done; 
for i in {1..6}; do echo; sleep .2; done; 
printf %b "\e[0m\e[4A"; p1 Installation complete!; 
for i in {1..6}; do echo; sleep .2; done; 
cd; echo; sleep 1; exec bash; 
}; 
instart
