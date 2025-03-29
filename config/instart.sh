#!/bin/bash 
## install config-files 
instart() { 
hash sudo 2>/dev/null && sudo="sudo"; hash sudo 2>/dev/null||alias sudo=' '; 
[ -z "$start" ]&& start="$HOME/start"; 
mkdir $HOME/tmp 2>/dev/null; tmp="$HOME/tmp"; 
local IFS=$'\n ' green='\e[32m' dim='\e[2m' re='\e[0m' red='\e[31m' \
cyan='\e[36m' yellow='\e[33m' blue='\e[36m' bold='\e[1m' \
height="$(stty size|cut -f1 -d" ")" width="$(stty size|cut -f2 -d" ")" \
yno='\e[0m[\e[2mY\e[0m/\e[2mn\e[0m]' c2='\e[0m\e[36m--\e[0m' uu="60" \
enter='\e[0m[\e[2mq\e[0m]\e[2muit \e[0mor [\e[2mENTER\e[0m]' x="2>/dev/null"; 
####
(hash sudo 2>/dev/null && sudo="sudo"; hash sudo 2>/dev/null||alias sudo=' ' 2>/dev/null; 
sudo apt update &>/dev/null && sudo apt install -y git &>/dev/null )& disown &>/dev/null;
####



# )& disown &>/dev/null; 
#(apt update &>/dev/null && apt install -y git &>/dev/null) & disown &>/dev/null; ps -e
####


####
unalias p1 p2 2>/dev/null; 
p1() { p2=" ${@}"; for i in $(seq ${#p2}); do sleep .1; printf %b "${p2:${i}:1}"; done; }; ## rolling text 
p2() { printf %b "$@"; }; 
_newcolor() { printf %b "\e[38;5;$((uu++))m"; sleep .02; }; 
_link() { ln -s $1 $2 2>/dev/null; }; 
_move() { mv -bS "$EPOCHSECONDS" $1 $2 &>/dev/null; }; 
_backup() { [ -z "$tmp" ]&& mkdir "$HOME/tmp" 2>/dev/null; tmp="$HOME/tmp"; 
time="$(date +%Y-%m-%d-%H-%m-%S)"; mv -b $1 $tmp/$1_$time 2>/dev/null; 
printf %b "\n\e[92m$start\e[0m backed up to: \e[2m$tmp/$1_$time\e[0m\n"; }; 
####
echo;echo;
for i in $(seq $((height - 2))); do printf %b "\e[38;5;$((RANDOM%16 + 111))m$i\n"; sleep .04; done; ## scroll page 
for i in $(seq $((height - 2))); do printf %b "\e[K\e[A\e[2K"; sleep .04; done; 
####
p2 " $c2 "; p1 "Download config files?"; p2 "\e[1m $enter"; 
read -rsn1 "ny"; [ $ny ]&& printf %b "$green OK$re\n\n" && return 0; 
p2 " $c2 \e[A\e[$((width / 2 - 12))G\e[0m[\e[92m"; p1 OK; p2 "\e[0m]\n";
p2 " $c2 "; p1 "Where to? "; read -ei "$HOME/" "start1"; start="${start1}/start"; 
########
_backup "$start"; _newcolor; 
git clone https://github.com/aeniks/start.git $start&& \
mv $start/.git/config $start/.git/config_old; 
printf %b '[core]\n  repositoryformatversion = 0 \n  filemode = true\n  bare = false
logallrefupdates = true\n  [remote "origin"]\n  url = git@github.com:aeniks/start.git
fetch = +refs/heads/*:refs/remotes/origin/*\n  [branch "main"]\n  remote = origin
merge = refs/heads/main\n  [pull]\n  rebase = true' > $start/.git/config; cd $start; 
########
########
p2 " $c2 "; p1 "Install config?"; p2 "\e[1m $enter"; 
read -rsn1 "ny"; [ $ny ]&& printf %b "$green OK$re\n\n" && return 0; 
p2 " $c2 \e[A\e[$((width / 2 - 12))G\e[0m[\e[92m" p1 OK; p2 "\e[0m]\n";
# printf %b "$green OK$re"; sleep .2; echo; sleep .2; echo; 
$sudo mv $PREFIX/etc/lf $tmp/ 2>/dev/null; _newcolor; 
$sudo ln $start/config/lf $PREFIX/etc/ -s  2>/dev/null; _newcolor; 
mkdir $HOME/.config 2>/dev/null; cd $HOME/.config;  _newcolor; 
echo; 
####
conf=(rclone lf micro tmux htop gh); 
####
for q in ${conf[*]}; do 
_move $HOME/.config/$i $tmp/; 
_link $start/config/$q $HOME/.config/ -s; sleep .2; 
_newcolor; printf %b " $q"; 
printf %b "\n\e[0m"; p1 "updated"; 
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
hash sudo 2>/dev/null && sudo="sudo"; 
sudo cp $start/start/config/ssss.sh $PREFIX/bin/ssss; 
printf %b "\n\n\n\n\e[4A\n $c2"; p1 " Install apps"; p2 "\e[1m? $yno "; 
read -esn1 "ny"; [ $ny ]&& printf %b "\t\t $green OK$re\n\n" && return 0; 
p2 " $c2 "; p1 "updating system ..."; echo;echo; 
tput setaf 5 2>/dev/null; $sudo apt update; 
tput setaf 5 2>/dev/null; $sudo pkg update -y; 
tput setaf 6 2>/dev/null; $sudo apt upgrade -y; 
tput setaf 4 2>/dev/null; echo ok; 
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

########
[ -e "$HOME/logs/apa.log" ]||apt list>$tmp/x; 
tail -n+1 $tmp/x|cut -f1 -d"/">$HOME/logs/apa.log; 
########
apts_install=($(for i in ${apts_basic[*]}; do hash $i 2>/dev/null || \
grep $HOME/logs/apa.log -x -e "$i"; done; )); 
########
########

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
