#!/bin/bash 
## install config-files 
instart() { 
## 
local alias mv='mv --backup'; unalias pp 2>~/x; 
p-() { p=" ${@}"; for i in $(seq ${#p}); do sleep .1; printf %b "${p:${i}:1}"; done; }; 
pp() { printf %b "${@}"; };  
##
green='\e[32m'; dim='\e[2m'; re='\e[0m'; red='\e[31m'; \
cyan='\e[36m'; yellow='\e[33m'; blue='\e[36m'; bold='\e[1m'; 
yno='\e[0m[\e[2mY\e[0m/\e[2mn\e[0m]'; c2='\e[0m\e[36m--\e[0m'; 
hash sudo 2>~/x||alias sudo=' '; local IFS=$'\n '; u="44"; 
for i in $(seq $LINES); do echo; sleep .04; done; 
mkdir $HOME/tmp 2>~/x; tmp="$HOME/tmp"; 
printf %b "\e[H\n\n $c2 "; p- "Install"; pp "$re "; p- configs; pp "\e[1m ? $yno "; 
read -rsn1 "ny"; [ $ny ]&& printf %b " OK\n\n" && return 0; 
##
#######

sleep .2; printf %b "\n\n\e[38;5;4$((u++))m"; ## newcolor 
sleep .2; printf %b "\e[38;5;4$((u++))m"; ## newcolor 
printf %b "mkdir $HOME/tmp 2>~/x && tmp="$HOME/tmp"; \n"
sleep .2; printf %b "\e[38;5;4$((u++))m"; ## newcolor 
sudo mv $PREFIX/etc/lf $tmp 2>~/x; 
sleep .2; printf %b "\e[38;5;4$((u++))m"; ## newcolor 
sudo ln $HOME/start/config/lf $PREFIX/etc/ --symbolic; 
sleep .2; printf %b "\e[38;5;4$((u++))m"; ## newcolor 
mv $HOME/.config/lf $tmp 2>~/x; 
ln $HOME/start/config/lf $HOME/.config/ --symbolic; 
sleep .2; printf %b "\e[38;5;4$((u++))m"; ## newcolor 
printf %b "ln $HOME/start/config/lf $HOME/.config/ --symbolic; "; 
########
sleep .2; printf %b "\e[38;5;4$((u++))m"; ## newcolor 
cat $HOME/.bashrc|grep -e "anew.sh"||\
printf %b "\n. $HOME/start/anew.sh; \n" >> $HOME/.bashrc && \
printf %b ". $cyan$HOME/start/anew.sh$re >>$green $HOME/.bashrc\n"; 
#######
########
conf=micro; sleep .2; printf %b "\e[38;5;4$((u++))m"; mv $HOME/.config/$conf $tmp/ -R 2>/dev/null; ln $HOME/start/config/$conf $HOME/.config/$conf --symbolic; printf %b "ln $HOME/start/config/$conf $HOME/.config/$conf --symbolic; "; ########
sleep .2; printf %b "\e[38;5;$((u++))m"; ## newcolor 
touch $HOME/._tmux 2>/dev/null; chmod 775 $HOME/._tmux; 
printf %b ''$dim'touch $HOME/._tmux 2>/dev/null; chmod 775 $HOME/._tmux; \n'; 
########
sleep .1; printf %b "\e[38;5;4$((u++))m"; ## newcolor 
mv $HOME/.inputrc $HOME/tmp/ 2>/dev/null; 
ln $HOME/start/config/inputrc $HOME/.inputrc --symbolic; 
printf %b 'ln $HOME/start/config/inputrc $HOME/.inputrc --symbolic; '; 
########
sleep 1; printf %b "\e[38;5;4$((u++))m"; ## newcolor 
mv $HOME/.tmux.conf $HOME/tmp/ 2>/dev/null; 
ln $HOME/start/config/tmux/tmux.conf $HOME/.tmux.conf --symbolic; 
printf %b 'ln $HOME/start/config/tmux/tmux.conf $HOME/.tmux.conf --symbolic; '; 
########
sleep .1; printf %b "\e[38;5;4$((u++))m"; ## newcolor 
mv $HOME/.tmux.conf.local $HOME/tmp/ 2>/dev/null; 
ln $HOME/start/config/tmux/tmux.conf.local $HOME/.tmux.conf.local --symbolic; 
########
sleep .1; printf %b "\e[38;5;4$((u++))m"; ## newcolor 
mv $HOME/.tmux_bash.sh $HOME/tmp/ 2>/dev/null; 
ln $HOME/start/config/tmux/tmux_bash.sh $HOME/.tmux_bash.sh --symbolic; 
printf %b 'ln $HOME/start/config/tmux/tmux.conf.local $HOME/.tmux.conf.local --symbolic; '; 
########
########
conf=htop; sleep 1; printf %b "\e[38;5;4$((u++))m"; mv $HOME/.config/$conf $tmp/ -R 2>/dev/null; ln $HOME/start/config/$conf $HOME/.config/$conf --symbolic; printf %b "ln $HOME/start/config/$conf $HOME/.config/$conf --symbolic; "; ########

sleep .2; 
printf %b "\n\n $c2 done!\n"
########
sleep .2; 
mkdir -p -m 775 $PREFIX/usr/share/figlet 2>/dev/null||\
sudo mkdir -p -m 775 $PREFIX/usr/share/figlet 2>/dev/null; 
cp $HOME/start/config/figlet/fonts/* $PREFIX/usr/share/figlet/ 2>/dev/null||\
sudo cp $HOME/start/config/figlet/fonts/* $PREFIX/usr/share/figlet/ 2>/dev/null; 
sudo chmod 775 $PREFIX/usr/share/figlet -R 2>/dev/null; 

printf %b "\n\n\n\n\e[4A\n $c2"; p- "Install apps"; pp "\e[1m? $yno "; 
read -esn1 "ny"; [ $ny ]&& printf %b " OK\n\n" && return 0; 
printf %b " $c2 updating system\e[2m...\n\n"; 
tput setaf 5 2>/dev/null; sudo apt update; 
tput setaf 6 2>/dev/null; sudo apt upgrade -y; 
tput setaf 4 2>/dev/null; echo ok; 
apts=(file libexif-dev openssl openssh-server sshfs \
rsync rclone w3m w3m-img googler exiftool \
mediainfo figlet lolcat lynx fortune-mod links2 ffmpeg \
toilet iproute2 net-tools nmap mpv fastfetch \
neofetch fzf ccze lf bat batcat btop htop ncdu \
bash-completion lsd tmux git gh nodejs \
nmap texinfo aha micro fortunes gnupg \
wget wget2 curl aria2 iw timg); 
for i in ${apts[*]}; do 
read -t 0.2 -rn1 -p "[ q ]" "ny"; [ $ny ]&& return 0; 
printf %b "installing \e[0;95m$i\n\e[0;2m"; 
sudo cp $HOME/start/config/ssss.sh $PREFIX/bin/ssss; 
hash $i &>~.x||printf %b "$re$i $cyan installed$green"; 
hash $i &>~.x||sudo apt install -y $i 2>/dev/null; done; 
#### 
echo; reset; exec bash; 
}; 
reset &>~.x; instart
