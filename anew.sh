#!/bin/bash
## A better bash. Written by 12ants.github.io
## _do nothing if not interactive
case $- in
*i*) ;;
*) return;;
esac
if [ -z "${PREFIX}" ]; then 
if ! shopt -oq posix; 
then if [ -f /usr/share/bash-completion/bash_completion ]; 
then . /usr/share/bash-completion/bash_completion; 
elif [ -f /etc/bash_completion ]; then . /etc/bash_completion; 
fi; fi; fi; 
[ $PREFIX ]&& [ -r $PREFIX/share/bash-completion/bash_completion ]&& \
. $PREFIX/share/bash-completion/bash_completion; 	
shopt -s histappend; shopt -s histverify; export HISTCONTROL=ignoreboth; 
## append to history, don't overwrite it
[ -z $TMPDIR ]&& export TMPDIR="$HOME/tmp"; 
[ -e $HOME/.config/path.sh ]&& export PATH=$(cat $HOME/.config/path.sh); 
export tmp="$HOME/tmp" && mkdir $tmp 2>/dev/null; 
export PROMPT_COMMAND="history -a; history -n; "; 
####
#[ -e "/bin/gcalcli" ]&& (sleep 8 && timeout 6 gcalcli --calendar leonljunghorn remind 11111 "notify-send -u normal -i appointment-soon -a ""'$(date)'"" %s") 2>/dev/null & disown; 
# [ -e "/bin/gcalcli" ]&& sleep 8 && timeout 6 gcalcli remind \
# --locale='sv_SE.UTF-8' "166" "notify-send -a ""'$(date)'"" \
# -u "normal" -t "6666" ""'%s'"" " 2>/dev/null & disown; 
## COLORS -- VARIABLES ##########################
export \
red='\e[31m' green='\e[92m' yellow='\e[93m' blue='\e[94m' \
pink='\e[95m' cyan='\e[96m' white='\e[37m' rev='\e[7m' \
re='\e[0m' bold='\e[1m' dim='\e[2m' c2='\e[0m\e[36m--\e[0m' \
black='\e[30m' invis='\e[8m' c2='\e[0m\e[36m -- \e[0m' 
nyo='\e[0m[\e[2mY\e[0m/\e[2mn\e[om]' 
[ -z $USER ]&& export USER="$(id -nu)"; 
[ -z $start ]&& export start="$HOME/start"; 
######
if [ $(echo $HOME|grep -w "termux") ]; then alias sudo='command'; 
else sudo=sudo; fi; 
export TERM="xterm-256color"; 
[ -z "${EDITOR}" ]&& export EDITOR='micro';
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01' 
GREP_COLORS='ms=01;32:mc=01;34:sl=35:cx=36:fn=37:ln=95;32:bn=32:se=36' PAGER='less'; 
[ $PREFIX ]&& model=($(getprop ro.product.model; 
getprop ro.build.version.min_supported_target_sdk; 
getprop ro.build.version.sdk ro.product.abilist; 
getprop ro.product.name; getprop ro.soc.manufacturer; 
getprop ro.soc.model; getprop gsm.sim.operator.alpha;))&& \
model=($(printf %b "${model[*]}"|uniq -u; )); 
[ -z "${HOST}" ]&& HOST="$(uname --kernel-name --kernel-release);";  
[ -z "${PREFIX}" ]&& [ -e /sys/devices/virtual/dmi/id/product_family ]&& \
model=($(cat /sys/devices/virtual/dmi/id/product_sku \
/sys/devices/virtual/dmi/id/board_vendor \
/sys/devices/virtual/dmi/id/sys_vendor \
/sys/devices/virtual/dmi/id/bios_vendor 2>/dev/null\
|sort|uniq -u|tr '\n' ' '; ))
#### (systemd-analyze|batcat -ppflzig; echo;); 
###############################################
#dawd="$(date +%w)"; dadm="$(date +%d)"; damo="$(date +%m)"; daye="$(date +%y)"; dahh="$(date +%H)"; damm="$(date +%M)";
####
#alias neighbours='sudo nmap $ip0 -p 22,80,443,53,8022,5555 --open --min-rate 22|batcat -ppflgo --theme Nord|grep -v "Not"'; 
fortshort() { sleep 4; seq 12 > $HOME/logs/ff.log; 
while [ "$(cat $HOME/logs/ff.log|wc --lines)" -gt "2" ]; 
do fortune > $HOME/logs/ff.log; done; }; 
##
fortshort & disown; 
# alias vim='nano'; 
####
#apt_upgradable=(no); 
#apt_upgradable=($(sudo apt list --upgradable 2>/dev/null|cut -f1 -d"/" & disown; )); 
####
#ipgateway="$(ip -c -4 r|cut -f3 -d" "|head -n1;)"; 
sshc=($SSH_CONNECTION); 
ip4=$(timeout 1 curl https://icanhazip.com -s4 -L); 
[ "${#ip4}" -gt 22 ]&& ip4="nope"; 
#$
[ $PREFIX ]&& iploc=$(getprop vendor.arc.net.ipv4.host_address; ); 
[ -z "$iploc" ]&& iploc=$(ip -4 -brief a 2>/dev/null|grep -e UP|tr -s " " "\n"|cut -f1 -d"/"|tail -n1 2>/dev/null); 
[ -z "$iploc" ]&& iploc=$(ifconfig 2>/dev/null|grep -e "4163" -m1 -A1|tail -n1|cut -f10 -d" " 2>/dev/null); 
##
# [ -z "$iploc" ]&& iploc="$(ip -4 -brief a show scope global up|grep -v lo|tr -s " /" " "|cut -f3 -d" ")"; 
#$
[ $PREFIX ]&& ipgate="$(getprop "vendor.arc.net.ipv4.host_gateway"; )"; 
##
[ -z "$ipgate" ]&&ipgate="$(ip r 2>/dev/null|tail -n1|cut -f1 -d"/")"; 

##
#[ -z "$iploc" ]&& iploc=($(ip -4 -brief a show scope global up|tr -s "/" " "|grep "UP"|cut -f3 -d" ")); 
######
printf %b "$iploc" > $HOME/logs/iploc.log; 
printf %b "$ipgate" > $HOME/logs/ipgate.log; 
printf %b "${model[*]}" > $HOME/logs/model.log; 
# ip a --brief a show scope global|tail -c+29|tr -s " " "\n"|cut -f1 -d"/"; )); 
#iploc6="$(ip -oneline -6 a show scope global|cut -f7 -d" "|head -c-4)"; 
####
####
[ -z "$HOSTNAME" ]&& HOSTNAME="$(uname --kernel-name --kernel-release|tr ' .' '_')"; [ -z "$HOST" ]&& HOST="$(uname --kernel-name --kernel-release|tr ' .' '_')"; 
####
####
#if [ -e "${PREFIX}/bin/figlet" ]; then ff=$(figlist|shuf -n1); printf "\n\n$ff\n\n"; 
#figlet -c -f "$ff" "_Hello"|batcat -ppfl zig 2>/dev/null; printf "\n\n"; fi; 
####
####
# apts=(file libexif-dev openssl openssh-server sshfs rsync rclone w3m googler exiftool mediainfo figlet lolcat lynx links2 ffmpeg toilet iproute2 net-tools nmap \mpv fastfetch neofetch fzf ccze lf bat batcat bat ncdu bash-completion lsd tmux git gh nodejs nmap texinfo aha micro golang gnupg wget wget2 curl aria2 iw ); 
########
[ $LF_LEVEL ]&& printf %b "\n\e[7;91m LF_LEVEL = $LF_LEVEL \e[0m\n"; 
########
# mkdir $HOME/logs 2>/dev/null; 
. $HOME/.tmux_bash.sh 2>/dev/null; 
. $start/alias.sh; 
####
# alias mmwm='. $HOME/logs/mmww.log && \
# printf %b "$w >$yellow $meaning$re >$dim $def"|bat -ppflzsh --theme Dracula'; 
#battery="$(cat ~/logs/battery.log |grep -e "percentage"|tr -d 'A-z ,\":';)"; 
# [ -e $HOME/logs/gcalagenda.sh ] && \
# printf %b "$(batcat ~/logs/gcalagenda.sh \
# -ppflzig --theme Nord 2>/dev/null |\
# column|head -n4 2>/dev/null; ) \n$dots"; 
##
mod="$(echo -e "${model[*]}"|tr " " "-";)"; 
iploc=($(cat $HOME/logs/iploc.log 2>/dev/null;)); 
cpu="$(lscpu |grep "Model name"|tr -s "\t" " "|cut -f3- -d" ")"; 
aptup=($(cat $HOME/logs/aptup.log 2>/dev/null;)); 
##########
##########
# dfree() { df -h|cut -f2- -d" "|tr -s " " " "|column --table --table-columns=1|grep -v "tmpfs"|grep -v "passthrough"|grep -E 'sdcard/default|storage'|bat -ppflc++ --theme 1337; }; 
# alias mw='[ -e $HOME/logs/mmww.log ] && . $HOME/logs/mmww.log && \
# printf %b "$w >$yellow $meaning$re >$dim $def"|\
# bat -ppflzsh --theme Dracula && printf %b "$dots" '; 
alias dots='printf %b "$re\n··········${re}\n"'; 
inbash() { 
printf %b "\e[0;2m\e[48m$(date -R)"; dots; 
printf %b "$re$(cat $HOME/logs/ff.log 2>/dev/null|bat -ppflzig --theme Nord)"; dots; 
[ -e $HOME/logs/calendar.json ] && \
printf %b "$(getcal 2>/dev/null; )"; 
dots; 
printf %b "$yellow$MACHTYPE$re |$pink $(uname --kernel-release)$re | $cyan$cpu"; dots; 
grep -e "[1-9]" $HOME/logs/aptup.log &>/dev/null && \
printf %b "$red${aptup[0]}$re upgrades available$re" && dots; 
printf %b "$cyan[\e[38;5;$((RANDOM%122))m\e[1m$(tput so 2>/dev/null; printf %b "${model[*]}"; tput so 2>/dev/null; )$re${cyan}]"; dots;
wotd_m && dots; 
# printf %b "\e[0m$(wotd|bat -ppflbash --theme Dracula;)"; dots; 
printf %b "\e[38;5;2$(( $(id -u|tail -c2) * 2 ))m$USER$re@$re$cyan$HOSTNAME$re | $green$TERM$re | $cyan$0$re | $pink$TERM_PROGRAM"; dots; 
printf %b "$cyan$ip4$re | $blue$iploc$re"; 
[ -n "${SSH_CONNECTION}" ]&& \
printf %b "$re | $red${sshc}$re"; dots; 
####
dfree() { 
[ "$PREFIX" ]&& printf %b "$(df -h|grep -v "tmpfs"|grep -v "passthrough"|cut -f2- -d" "|tr -s " " " "|grep -E "sdcard/default|storage|Size"|column --table --table-columns-limit 5 --output-separator ' | '|bat -ppfljs --theme DarkNeon)"|| printf %b "$(df -h|grep -v "tmpfs"|tr -s " " " "|column --table --table-columns-limit 5 --output-separator ' | '|bat -ppfljs --theme DarkNeon)"; }
dfree; 
# dfree() { printf %b "$(df -h|cut -f2- -d" "|tr -s " " " "|grep -v "tmpfs"|grep -v "passthrough"|grep -E 'sdcard/default|storage|Size'|column --table --table-columns-limit 5 --output-separator ' | '|bat -ppfljs --theme zenburn;)"; }; 

# alias dfree2='printf %b "\e[0;2m$(df -h|head -n1|tr -s " " "\t"|batcat --theme=Nord -ppflc++; )\e[0;1m"; df="/dev"; [ $PREFIX ]&& df="/dev/fuse"; df -h|tr -s " " "\t"|grep -v "100%"|grep -v "tmpfs"|grep -v "none"|grep -v "run"|grep -v "efivars"|grep -v "boot"|grep -v loop|grep -e "$df"|batcat --theme=Dracula -ppflc++'; 
# [ "$PREFIX" ] && dfree; [ -z "$PREFIX" ] && dfree2; 
dots; 
# df -h|cut -f2- -d" "|tr -s " " " "|column --table --table-columns=4|grep -v "tmpfs"|grep -v "passthrough"|grep -E 'sdcard/default|storage|Size'|bat --theme Dracula -ppflc++; 
#timme() { while true; do sleep 1800; printf %b "\e7\e[14H\e[1J\e[4H"; figlet -f Roman -w $COLUMNS -c "$(date +%H:%M)"|bat -ppfljs; printf %b "\e[2A\e[K\e8"; done; }; timme & 
}; 


for i in $start/funcs/*.sh; do . $i; done; 
####
####
# [ ${#apt_upgradable[*]} -gt 2 ]&& \
# aptup="$(cat $HOME/logs/aptup.nfo)"; 
# error_code() { printf %b "\n\e[38;5;$1mG $1"; return $@; }; 
######## << TMUX TO BASHRC
#tmux source-file "$HOME/.tmux.conf"; 
#if [ -z "${TMUX}" ]; then [ "$SSH_CONNECTION" ]|| tmux source&& exit; 
#else tmux lock-server fi;
##################################
## PS1:s to save >>
## PS1='\e[2;40;96m\t\e[37m$(echo $PWD|bat --theme Nord -ppflr;)/\e[0m\n'
##PS1='\e[2;37m${mod:0:22}$re $cyan$me$re @ \e[45;30m\H\e[0m \e[34;40m\W/\e[0m \e[$((COLUMNS-26))G$(date +%d-%m-%y" $(printf \e[9${dawd:(-1)}m)"%^A"$re "%X)\n'
##################################
# 12_whtr 
# [ "$TMUX" ] || [ -z "$SSH_CONNECTION" ] || tmux;
# battery="$(cat ~/logs/battery.log |grep -e "percentage"|tr -d 'A-z ,\":';)"; 
####
[ -e "$HOME/.config/tmux_state" ]||touch "$HOME/.config/tmux_state"; 
# [ -x "$HOME/.config/tmux_state" ]&& [ -z "$TMUX" ]&& [ -z "$SSH_CONNECTION" ]&& #tmux; [ -n "$TMUX" ]&& inbash; [ -n "$SSH_CONNECTION" ]&& inbash; 
####
####
# [ -x "$HOME/.config/tmux_state" ]&&[ -z "$TMUX" ]&&[ -z "$SSH_CONNECTION" ]&& tmux; 
[ -z "$TMUX" ]&& tmux;
[ -n "$TMUX" ]&& inbash && . $start/config/tmux/tmuxbg.sh
# [ -z "$TMUX" ]||tmux list-panes|grep -e "1:" &>/dev/null||[ -z "$SSH_CONNECTION" ]&& inbash; 
# [ -n "$SSH_CONNECTION" ]&& inbash; 
####
####
####
if [ ${#iploc} -gt 2 ] 2>/dev/null; then \
ipp=' \e[0;2m[\e[0;95m${iploc[*]}\e[0;2m]\e[0m ';
else ipp=' \e[0;2m[\e[0;38m_\e[0;2m]\e[0m '; fi; 
####
####
# _ps1() { PS1=''$re'[\e[0;1;38;5;$((2 + $?))m$?'$re']'$re$ipp$re'['$re'\e[1m\e[38;5;$((RANDOM%88 + 88))m${mod:0:8}'$re'] ['$re$cyan'\u'$re'] '$re$(cat $HOME/logs/bat.sh 2>/dev/null)' ['$re$yellow'\w'$re']\e[25h\e[0m\n'; }; 
crond &>/dev/null; sshd &>/dev/null; 
. $start/_ps1.sh; _ps1; 
