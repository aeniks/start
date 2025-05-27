#!/bin/bash 
## install config-files 
instart() { 
hash sudo 2>/dev/null && sudo="sudo"; hash sudo 2>/dev/null || alias sudo=' '; 
[ $PREFIX ]&& unset sudo; [[ $UID -eq 0 ]]&& unset sudo; 
mkdir $HOME/tmp 2>/dev/null; mkdir $HOME/logs 2>/dev/null; 
mkdir $HOME/gh 2>/dev/null; mkdir $HOME/.config 2>/dev/null; 
export tmp=$HOME/tmp; 
#####
#####
local IFS=$'\n\t ' green='\e[32m' dim='\e[2m' re='\e[0m' red='\e[31m' \
cyan='\e[36m' yellow='\e[33m' blue='\e[36m' bold='\e[1m' \
height="$(stty size|cut -f1 -d" ")" width="$(stty size|cut -f2 -d" ")" \
yno='\e[0m[\e[2mY\e[0m/\e[2mn\e[0m]' c2='\e[0m\e[36m--\e[0m' uu="60" \
enter='\e[0m[\e[2mq\e[0m]\e[2muit \e[0mor [\e[2mENTER\e[0m]' x="2>/dev/null"; 
####
####
_loader() { 
unset kill; 
printf %b "\e[A\e[?25l\e[46G${re}"; 
# printf "    [   [${dim}a${re}] to abort"; 
pid="$!"; spin='-\|/'; i=0; while kill -0 $pid 2>/dev/null; 
do i=$(( (i+1) %4 )); 
printf "${re} \e[46G [${dim}${spin:$i:1} \b${re}] "; 
read -t 0.1 -s -n1 kill; [ $kill ]&& kill $pid; 
# tail -c21 $tmp/in.log; printf %b "\e[u"; 
done; 
printf "${re} \e[46G [${dim}done \b${re}] "; 
printf %b "\n"; 
}; 
####
# $sudo apt install -y bat iproute2 nmap lf git \
# gh fzf wget micro bash-completion \
# ssh openssh-server &>/dev/null & disown;
apts_basic=(\
gh git rsync file openssl openssh-sftp-server openssh \
micro gnupg fzf mediainfo lf bat batcat runsv htop wget \
bash-completion lsd tmux cron texinfo iproute2 mandoc \
fortunes fortune fortune-mod figlet w3m nmap net-tools \
termux-tools termux-api termux-api cronie mpvb curl \
); 
apts_sec=(\
btop htop ncdu figlet lynx iproute2 net-tools nmap \
links2 fastfetch neofetch wget wget2 curl aria2 iw timg rclone \
); 
apt_termux=(\
termux-tools termux-api termux-api cronie \
); 
apts_more=(\
toilet rclone w3m w3m-img googler exiftool aha \
); 
####
apts_extra=(ffmpeg mpv);
########
####
####
####
unalias p1 p2 2>/dev/null; 
p1() { p2=" ${@}"; for i in $(seq ${#p2}); do sleep .04; printf %b "${p2:${i}:1}"; done; }; ## rolling text 
p2() { printf %b "$@"; }; 
# _move() { mv -S "$EPOCHSECONDS" $@ &>/dev/null; }; 
_link() { ln -s $@ 2>/dev/null; }; 
########
_newcolor() { printf %b "\e[38;5;$((uu++))m"; sleep .02; }; 
########
_backup() { mkdir $HOME/tmp 2>/dev/null; tmp=$HOME/tmp; time=$(date +%y%m%d%H%m%S); 
mv -fb --suffix="$time" $@ -t $tmp 2>/dev/null; 
}; 
_yno() { 
printf %b ""; 
_ok() { 
printf %b "\e[40G     \e[8D  "; 
p2 "\e[0;1m [\e[0;92m"; p1 "OK"; p2 "\e[0;1m]  \e[0m\n"; }; 
p1() { p2=" ${@}"; for i in $(seq ${#p2}); do sleep .04; printf %b "${p2:${i}:1}"; done; }; ## rolling text 
p2() { printf %b "$@"; }; 
yno='\e[0m[\e[2mY\e[0m/\e[2mn\e[0m]' 
[[ "$1" ]]&& ny=${1}; printf %b "\e[40G\b\b\b\b\b\b\b\b$yno "; 
printf -v _yno_${1} "false"; read -rsn1 ny; 
[[ -z $ny || $ny = y ]] && printf -v _yno_${1} "true"; _ok; 
# printf %b "\n_yno_$1 = $_yno_${1} \n"; 
}; 

# printf %b "$green OK$re\n" && \
####
for i in $(seq $((height / 2))); do printf %b "\e[38;5;$((RANDOM%16 + 111))m$i\n"; sleep .04; done; ## scroll page 
for i in $(seq $((height / 2 + 2))); do printf %b "\e[K\e[A\e[2K"; sleep .04; done; 
echo; sleep .04; echo; sleep .04; 
####
#### Update system? 
_update() {
p2 " $c2 "; p1 "Update system? "; _yno update; if [[ $_yno_update == true ]]; then _newcolor; printf %b "\e7"; _newcolor; $sudo apt update 2>/dev/null;  _newcolor; 
printf %b "\e8\e[J"; $sudo apt upgrade -y 2>/dev/null; _newcolor;  printf %b "\e8\e[J"; 
hash fzf git gh lf gnupg curl micro 2>/dev/null||$sudo apt install -y curl fzf git gh lf gnupg micro 2>/dev/null; _newcolor; printf %b "\e8\e[J"; 
printf %b "\e8\e[A${re} \e[46G [${dim}done \b${re}] \n"; fi; 
}; 
####
#### Install apps? 
_apt_installer() { 
p2 " $c2 "; p1 "Install apps? "; _yno aptins; if [[ $_yno_aptins == true ]]; then \
printf %b "\e7"; for ap in ${apts_basic[*]}; do  _newcolor; 
printf %b "\n"; $sudo apt install -y $ap --assume-yes 2>/dev/null && \
printf %b "\e[2K\b\b\b\b installed";  _newcolor; printf %b " $ap\e8\e[J"; done; 
printf %b "\e8\e[A${re} \e[46G [${dim}done \b${re}] \n"; sleep .2; 
fi; 
}; 
####
#### Download config files? 
_download() {
p2 " $c2 "; p1 "Download config files? "; _yno download; 
if [[ $_yno_download == true ]]; then \
p2 " $c2 "; p1 "Where to? "; read -ei "$HOME/" "hstart"; printf %b "\e[A"; 
start="${hstart}/start"; sleep .2; export start="${start/\/\///}"; 
_backup $start; _newcolor; 
git clone https://github.com/aeniks/start.git $start 2>/dev/null & _loader; 
cd $start; git config remote.origin.url git@github.com:aeniks/start.git; 
####
####
#cd $start; git config set remote.origin.url git@github.com:aeniks/start.git; 
#gh config set git_protocol ssh 2>/dev/null; cd -; 
fi; 
# 
# mv $start/.git/config $start/.git/config_old 2>/dev/null; printf %b '\
# [core]\n  repositoryformatversion = 0 \n  filemode = true\n  bare = false
# logallrefupdates = true\n  [remote "origin"]\n  url = git@github.com:aeniks/start.git
# fetch = +refs/heads/*:refs/remotes/origin/*\n  [branch "main"]\n  remote = origin
# merge = refs/heads/main\n  [pull]\n  rebase = true\
# ' > $start/.git/config; 2>/dev/null; cd $start; 
# 
####
}; 
_install_conf() { 

mkdir $HOME/logs/apts -m 775 2>/dev/null; touch $HOME/logs/bp.log $HOME/logs/aptup.log 2>/dev/null; 
mkdir $HOME/crons -m 775 2>/dev/null; 
ln -s $start/crons/* -t $HOME/crons/ 2>/dev/null; 
$sudo rm $PREFIX/etc/motd -fr 2>/dev/null; ## remove motd 
p2 " $c2 "; p1 "Install config? "; _yno in_conf
if [[ $_yno_in_conf == true ]]; then \
# $sudo mv $PREFIX/etc/lf $tmp/ 2>/dev/null; _newcolor; 
# $sudo ln $start/config/lf $PREFIX/etc/ -s  2>/dev/null; _newcolor; 
mkdir $HOME/.config 2>/dev/null; _newcolor; 
####
#### 
_newcolor; printf %b "\e[0m\t\t"; 
touch $HOME/.bashrc; cat $HOME/.bashrc|grep -e "anew.sh" &>/dev/null||\
printf %b "\n. $start/anew.sh;"&>/dev/null >> $HOME/.bashrc 2>/dev/null; 
touch $HOME/.config/tmux_state 2>/dev/null; chmod 775 $HOME/.config/tmux_state; echo; 
####
_backup $HOME/.inputrc; _newcolor; 
_link $start/config/inputrc $HOME/.inputrc; _newcolor; 
##########
_backup $HOME/.tmux.conf $HOME/.tmux.conf.local; _newcolor; 
_link $start/config/tmux/tmux.conf $HOME/.tmux.conf; _newcolor; 
_link $start/config/figlet/figz.sh $HOME/; _newcolor; 
########
_backup $HOME/.tmux_bash.sh; _newcolor; 
_link $start/config/tmux/tmux_bash.sh $HOME/.tmux_bash.sh; _newcolor; 
#########
_backup $HOME/.termux/termux.properties; _newcolor; 
_link $start/config/termux/termux.properties $HOME/.termux/; _newcolor; 
######
_backup $HOME/.config/micro/settings.json; _newcolor; 
_backup $HOME/.config/micro/bindings.json; _newcolor; 
ln -s $start/config/micro/settings.json $start/config/micro/bindings.json -t $HOME/.config/micro/; _newcolor; 
######
###### batcat config 
if [ -n $PREFIX ]; then apt install bat -y 2>/dev/null; 
ln --symbolic $PREFIX/bin/bat $PREFIX/bin/batcat; else $sudo apt install bat -y 2>/dev/null; 
$sudo ln --symbolic $PREFIX/bin/batcat $PREFIX/bin/bat 2>/dev/null; fi; _newcolor; 
######
###### github & ssh - config files 
$sudo apt install -y openssh gh git 2>/dev/null; 
[ -z $HOME/.ssh/*.pub ] && ssh-keygen -N "" -f $HOME/.ssh/id_ed25519; gh ssh-key add $HOME/.ssh/*.pub; printf %b "\e[96m\u990 \e[0m"; ssh -T git@github.com; printf %b "\n"; 
###### link config files to home 
conf=(newsboat bat lf tmux htop); 
for q in ${conf[*]}; do 
mkdir -p $HOME/.config/$q 2>/dev/null; 
_backup $HOME/.config/$q/*; _newcolor; 
ln -s $start/config/$q/* -t $HOME/.config/$q/; sleep .2; 
printf %b "\n\e[0m"; p1 "updated"; _newcolor; printf %b " $q"; 
done; echo; cd; _newcolor; 
printf %b "$PATH" > $HOME/.config/path.sh; chmod 775 $HOME/.config/path.sh; _newcolor; 
printf %b "\n -- added "$PATH" to $HOME/.config/path.sh \n\n "; _newcolor; 
####
$sudo apt install -y figlet 2>/dev/null; 
######## 
. $start/config/figlet/install_fonts.sh 2>/dev/null; 
mkdir -p -m 775 $PREFIX/share/figlet 2>/dev/null||\
$sudo mkdir -p -m 775 $PREFIX/share/figlet 2>/dev/null; 
cp $HOME/start/config/figlet/fonts/* -t $PREFIX/usr/share/figlet/ 2>/dev/null||\
$sudo cp $HOME/start/config/figlet/fonts/* -t $PREFIX/share/figlet/ 2>/dev/null; 
$sudo chmod 775 $PREFIX/share/figlet -R 2>/dev/null; 
####
mkdir -m 775 -p $HOME/.local/bin 2>/dev/null; 
$sudo cp $start/config/ssss.sh $HOME/.local/bin/ssss 2>/dev/null; 
export PATH=${PATH}:~/.local/bin:$PREFIX/usr/games; 

# cat $HOME/.bashrc|grep 
printf %b "$PATH" > $PREFIX/.config/path;
cat ~/.bashrc | grep -e "PATH" || printf %b '\n export $(cat ${HOME/.config/path}) \n' >> ~/.bashrc; 
chmod 775 $PREFIX/.config/path; 
cat $HOME/.config/path|grep "~/.local/bin" || \
printf %b "${PATH}:~/.local/bin" >> $HOME/.config/path; 
fi; 
####
## crons
}; 
####
#### Authenticates github
_login_gh() {
p2 " $c2 "; p1 "Login to github? "; _yno gh; 
if [[ $_yno_gh == true ]]; then \
$sudo apt install -y ssh gpg gnupg git gh &>/dev/null; 
####
ghuser="$(id -nu)"; ghmail="$(id -nu)@$(hostname)";  gh_aeniks="$start/config/gpg/gh_aeniks.gpg"; 
####
gpg --pinentry-mode loopback -o "gh.txt" -d "$gh_aeniks"; 
gh auth login --with-token < "gh.txt"; printf "$c2 "; rm gh.txt; sleep .2;
gh auth status && \
printf %b "\e[60G      \e[8D  "; p2 "\e[0;1m [\e[0;92m"; p1 "OK"; p2 "\e[0;1m]  \e[0m\n"; sleep .2; 
git config --global user.name $ghuser; 
git config --global user.email $ghmail; 
git config --global init.defaultBranch main; 
# printf %b "\nHost *\nForwardAgent yes\n" >> $HOME/.ssh/config;
ssh-keygen -N "" -f ll_${USER}_${HOSTNAME}_ll; 
gh config set git_protocol ssh; gh ssh-key add $HOME/.ssh/*.pub; 
cd $start; git config remote.origin.url git@github.com:aeniks/start.git;  2>/dev/null; 
cd -; 
ssh -T git@github.com; fi; 
_link $PREFIX/var/spool/cron $HOME/ 2>/dev/null; 
}; 
####
#### Install apps?
_install_apps() {
p2 " $c2 "; p1 "Install apps? "; _yno in_apps
if [[ $_yno_in_apps == true ]]; then \
p2 " $c2 "; p1 "updating system ..."; echo; echo; _newcolor; 
$sudo apt update; _newcolor; $sudo apt upgrade -y; _newcolor; echo; 
####
[ -e $HOME/logs/apa.log ] || $sudo apt list > $HOME/logs/apa_1.log; 
tail -n+1 $HOME/logs/apa_1.log|cut -f1 -d"/" > $HOME/logs/apa.log; 
####
apts_install=($(for i in ${apts_basic[*]}; do hash $i 2>/dev/null || \
grep $HOME/logs/apa.log -x -e "$i"; done; )); 
####
for i in ${apts_install[*]}; do 
hash $i 2>/dev/null && printf %b "\n$reSkipping $cyan $i$re already installed$green"; 
printf %b "\e[38;5;$((uu++))m\n"; 
hash $i 2>/dev/null || (printf %b "\nInstalling $i \e[0;1m"; p1 " ..."; 
printf %b "\n\e[0;2m"; )&& \
hash $i 2>/dev/null || $sudo apt install -y $i &>/dev/null; done; 
for i in {1..6}; do echo; sleep .2; done; 
printf %b "\e[0m\e[4A"; p1 Installation complete!; 
for i in {1..6}; do echo; sleep .2; done; 
fi; 
}; 
apts() { 
IFS=$'\n '; mkdir -p -m 775 $HOME/logs/apts_basic 2>/dev/null; 
printf %b "\n \e[96m--\e[0m Updating apts..."; $sudo apt update &>/dev/null; 
for i in ${apts_basic[*]}; do $sudo apt show $i 2>/dev/null|grep -e "Installed-Size" -e "Description" > $HOME/logs/apts_basic/_$i; 
cat  $HOME/logs/apts/_$i 2>/dev/null|cut -f2- -d" " > $HOME/logs/apts_basic/$i; 
[ $(wc -l $HOME/logs/apts_basic/_$i|cut -b1-2) -eq 0 ] 2>/dev/null && rm $HOME/logs/apts_basic/$i; 
done; rm $HOME/logs/apts_basic/_*; 
printf %b "\n \e[96m--\e[0m DONE\n"
}; 
####
####
_update; 
_apt_installer; 
_download; 
_install_conf; 
_login_gh; 
_install_apps; 
cd; echo; sleep 1; exec bash; 
}; 
instart
