#!/bin/bah
## list of awesome apt packages
apts=(
lf 
batcat
ncdu
jp2a
tmux 
fzf
git 
gh
curl 
openssl
openssh-server
gnupg
mediainfo
chafa
micro 
figlet
ncurse
file
bash-completion
links2
hstr
lsd
nmap
nmcli
aerc
imagemagick
)



# . $HOME/kk/apts.sh; 
echo; declare -a o; o=4; for i in ${apts[*]}; do 
apt show $i &>/dev/null&& (printf %b " [ ] \e[0;38;5;${o}m$i\e[0;2m "; 
apt show $i 2>/dev/null|grep Download-Size|cut -f2- -d" "; 
printf %b "\e[A\e[22G "; apt show $i 2>/dev/null\
|grep Description:|cut -f2- -d" "\
|pr --omit-header --page-width=$(( COLUMNS - 24 ))); 
printf %b "\e[0m"; o=$(( $RANDOM%222 )); done; echo
