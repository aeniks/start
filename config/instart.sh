#!/bin/bash 
## install config-files 
instart() { 
green='\e[32m'; dim='\e[2m'; re='\e[0m'; red='\e[31m'; cyan='\e[36m'; 
yno='\e[0m[\e[2mY\e[0m/\e[2mn\e[0m]'; c2='\e[0m\e[36m--\e[0m'; 
for i in $(seq $LINES); do echo; sleep .04; done; 
printf %b "\e[H\n\n $c2 Install \e[0mconf\e[1m? $yno "; 
read -rsn1 "ny"; [ $ny ]&& printf %b " OK\n\n" && return 0; 
#######
sleep .4; 
[ $PREFIX ]&& alias sudo=' '; 
printf %b "\n\n$green"; 
sudo rm $PREFIX/etc/lf -r 2>/dev/null; 
sudo ln $HOME/start/config/lf $PREFIX/etc/ --symbolic; 
rm $HOME/.config/lf -r 2>/dev/null; 
ln $HOME/start/config/lf $HOME/.config/ --symbolic; 
sleep 1; 
echo 'ln $HOME/start/config/lf $HOME/.config/ --symbolic; '; 
########
sleep 1; 
cat $HOME/.bashrc|grep -e "anew.sh"||\
printf %b '\n. $HOME/start/anew.sh; \n' >> $HOME/.bashrc; 
printf %b '. '$cyan'$HOME/start/anew.sh'$re' >>'$green' $HOME/.bashrc\n' 
#######
sleep 1; 
mkdir $HOME/tmp 2>/dev/null; 
printf %b ''$green'mkdir $HOME/tmp\n'; 
########
sleep 1; 
touch $HOME/._tmux 2>/dev/null; chmod 775 $HOME/._tmux; 
printf %b ''$dim'touch $HOME/._tmux 2>/dev/null; chmod 775 $HOME/._tmux; \n'; 
########
sleep 1; 
mv $HOME/.inputrc $HOME/tmp/ 2>/dev/null; 
ln $HOME/start/config/inputrc $HOME/.inputrc --symbolic; 
echo 'ln $HOME/start/config/inputrc $HOME/.inputrc --symbolic; '; 
########
sleep 1; 
mv $HOME/.tmux.conf $HOME/tmp/ 2>/dev/null; 
ln $HOME/start/config/tmux/tmux.conf $HOME/.tmux.conf --symbolic; 
echo 'ln $HOME/start/config/tmux/tmux.conf $HOME/.tmux.conf --symbolic; '; 
########
sleep 1; 
mv $HOME/.tmux.conf.local $HOME/tmp/ 2>/dev/null; 
ln $HOME/start/config/tmux/tmux.conf.local $HOME/.tmux.conf.local --symbolic; 
########
sleep 1; 
mv $HOME/.tmux_bash.sh $HOME/tmp/ 2>/dev/null; 
ln $HOME/start/config/tmux/tmux_bash.sh $HOME/.tmux_bash.sh --symbolic; 
echo 'ln $HOME/start/config/tmux/tmux.conf.local $HOME/.tmux.conf.local --symbolic; '; 
########
mkdir -p -m 775 $PREFIX/usr/share/figlet 2>/dev/null||\
sudo mkdir -p -m 775 $PREFIX/usr/share/figlet 2>/dev/null; 
cp $HOME/start/config/figlet/fonts/* $PREFIX/usr/share/figlet/ 2>/dev/null||\
sudo cp $HOME/start/config/figlet/fonts/* $PREFIX/usr/share/figlet/ 2>/dev/null; 
sudo chmod 775 $PREFIX/usr/share/figlet -R 2>/dev/null; 
########
sleep 1; 
rm $HOME/.config/htop -r 2>/dev/null; 
ln $HOME/start/config/htop $HOME/.config/htop --symbolic; 
echo 'ln $HOME/start/config/htop $HOME/.config/htop --symbolic; '; 
########
sleep 1; 
printf %b "\n $c2 done!\n"
########
sleep 1; 
printf %b "\n\n\n\n\e[4A\n $c2 Install \e[0mapps\e[1m? $yno "; 
read -rsn1 "ny"; [ $ny ]&& printf %b " OK\n\n" && return 0; 
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
sudo cp $HOME/start/tmp/ssss.sh $PREFIX/bin/ssss; 
hash $i &>~.x||printf %b "$re$i $cyan installed$green"; 
hash $i &>~.x||sudo apt install -y $i 2>/dev/null; done; 
echo; reset; exec bash; 
}; 
reset &>~.x; instart
