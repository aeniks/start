#!/bin/bash 
## install config-files 
instart() { 
printf %b "\n\n\n\n\n\n\e[4A\n -- Install apps/conf? [Y/n] "; 
cat $HOME/.bashrc|grep '. $HOME/start/anew.sh'||printf %b '\n. $HOME/start/anew.sh; \n' >> $HOME/.bashrc; 
printf "install conf? [Y/n] "; read -srn1 "ny"; [ $ny ]&& printf %b "\n\n\e[A" && return 0; 
for i in ${apts[*]}; do sudo apt install -qqy $i; done; 
mkdir $HOME/tmp 2>/dev/null; 
touch $HOME/._tmux 2>/dev/null; chmod 775 $HOME/._tmux; 
########
mv $HOME/.inputrc $HOME/tmp/ 2>/dev/null; 
ln $HOME/start/config/inputrc $HOME/.inputrc --symbolic; 
echo 'ln $HOME/start/config/inputrc $HOME/.inputrc --symbolic; '; 
########
mv $HOME/.tmux.conf $HOME/tmp/ 2>/dev/null; 
ln $HOME/start/config/tmux/tmux.conf $HOME/.tmux.conf --symbolic; 
echo 'ln $HOME/start/config/tmux/tmux.conf $HOME/.tmux.conf --symbolic; '; 
########
mv $HOME/.tmux.conf.local $HOME/tmp/ 2>/dev/null; 
ln $HOME/start/config/tmux/tmux.conf.local $HOME/.tmux.conf.local --symbolic; 
echo 'ln $HOME/start/config/tmux/tmux.conf.local $HOME/.tmux.conf.local --symbolic; '; 
########
rm $HOME/.config/lf -r 2>/dev/null; 
ln $HOME/start/config/lf $HOME/.config/ --symbolic; 
echo 'ln $HOME/start/config/lf $HOME/.config/ --symbolic; '; 
########
rm $HOME/.config/htop -r 2>/dev/null; 
ln $HOME/start/config/htop $HOME/.config/htop --symbolic; 
echo 'ln $HOME/start/config/htop $HOME/.config/htop --symbolic; '; 
########
echo -e "\n\n -- done!\n\n"
########
printf "install apps? [Y/n] "; read -srn1 "ny"; [ $ny ]&& printf %b "\n\n\e[A" && return 0; 
[ "$PREFIX" ]&& alias sudo=' '; oi=140; 
printf %b "\n\e[0;105;30m UPTADING SYSTEM \e[0m\e[2m\n\n"; 
sudo apt update 2>/dev/null && sudo apt upgrade -y 2>/dev/null; 
for i in ${apts[*]}; do printf %b "\e[0minstalling \e[38;5;$((oi++))m$i\n\e[2m"; 
sudo apt install -y $i 2>/dev/null; done; 
sudo apt autoremove -y; 
sudo apt full-upgrade -y; 

}; 

