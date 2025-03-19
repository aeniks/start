#!/data/data/com.termux/files/usr/bin/bash
## A better bash. Written by 12ants.github.io
## _do nothing if not interactive
case $- in
*i*) ;;
*) return;;
esac
if [ -z "${PREFIX}" ]; 
then if ! shopt -oq posix; 
then if [ -f /usr/share/bash-completion/bash_completion ]; 
then . /usr/share/bash-completion/bash_completion; 
elif [ -f /etc/bash_completion ]; 
then . /etc/bash_completion; 
fi; fi; fi; 
shopt -s histappend; ## append to history, don't overwrite it
[ -z $TMPDIR ]&& \
export TMPDIR="$HOME/tmp" && mkdir $TMPDIR; 
export PROMPT_COMMAND="history -a; history -n; " NVM_DIR="$HOME/.nvm"; 
alias me='id; echo; id -un'; 
alias ffff='fastfetch'
alias nvm_initzz='\
[ -s "$NVM_DIR/nvm.sh" ]&& \
. "$NVM_DIR/nvm.sh"; [ -s "$NVM_DIR/bash_completion" ]&& \
. "$NVM_DIR/bash_completion"'
####
[ -e "/bin/gcalcli" ]&& [ "$me" = "aa" ]&& \
timeout 6 gcalcli remind \
--locale='sv_SE.UTF-8' "166" "notify-send -a ""'$(date)'"" \
-u "normal" -t "6666" ""'%s'"" " 2>/dev/null & disown; 
## COLORS -- VARIABLES ##########################
export \
red='\e[31m' green='\e[92m' yellow='\e[93m' blue='\e[94m' \
pink='\e[95m' cyan='\e[96m' white='\e[37m' rev='\e[7m' \
re='\e[0m' bold='\e[1m' dim='\e[2m' c2='\e[0m\e[36m--\e[0m' \
black='\e[30m' invis='\e[8m' me="$(id -nu)"; 
######
[ $(echo $HOME|grep -w "termux") ]&& alias sudo='command'; 
export TERM="xterm-256color"; 
[ -z "${EDITOR}" ]&& export EDITOR='micro';
export PAGER='less' GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01' GREP_COLORS='ms=01;32:mc=01;34:sl=35:cx=36:fn=37:ln=95;32:bn=32:se=36'! 
# qqkrel="$(uname --kernel-release)"; qqkvers="$(uname --kernel-version)"; # qqkname="$(uname --kernel-name)"; qqos="$(uname --operating-system)"; # qqarch="${BASH_VERSINFO[-1]}"; qqterm="${TERM}"; sep='\e[0m -\e[2m';
#[ -z "${ants}" ]&& read -rp "ants: " -i "$PWD" "ants"; 
#[ -z "${ants}" ]&& ( printf "export ants=$ants >> ~/.bashrc; "; 
#printf %b "export ants=$ants\n" ) >> ~/.bashrc; 
# . $ants/alias.sh; 
# [ -e $ants/func/func.sh ]&& 
for i in ~/start/funcs/*.sh; do . $i; done; 
# qqshell="${SHELL/*\//}"; qqshell="$(printf "${qqshell^^}$sep $BASH_VERSION")"; 
# printf "$dim$qqkvers \n$qqshell$sep $qqarch\n$qqkname $qqkrel$sep $qqos$sep $re$red$qqterm\n"; 
# model="$(getprop ro.product.model ro.product.model ro.build.version.min_supported_target_sdk ro.build.version.sdk ro.product.abilist ro.product.name ro.soc.manufacturer ro.soc.model gsm.sim.operator.alpha 2>/dev/null )"; 
# [ -e "/etc/os-release" ]&& OOSS=($(cat "/etc/os-release"|tr " " "_"|tr -d '""'));
# for i in ${!OOSS[@]}; do printf -v "OS_${OOSS[i]/=*}" "${OOSS[i]/*=}"; done 
# printf "$green${OS_ID_LIKE^} ${OS_ID^} ${OS_VERSION}\n";
[ -n "${PREFIX}" ]&& model=($(getprop ro.product.model))&& \
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
alias fortshort='seq 12 > $HOME/.ff.sh; 
while [ "$(cat $HOME/.ff.sh|wc --lines)" -gt "4" ]; 
do fortune > $HOME/.ff.sh; done; cat $HOME/.ff.sh'; 
# alias vim='nano'; 
####
####
sshc=($SSH_CONNECTION); 
ipgateway="$(ip -c -4 r|cut -f3 -d" "|head -n1;)"; 
ip4=$(timeout 1 curl icanhazip.com -s4 -L); [ "${#ip4}" -gt 22 ]&& ip4="nope"; 
ip0="$(ip r 2>/dev/null|tail -n1|cut -f1 -d"/")-12"; 
[ -n "$PREFIX" ]&& iploc="$(getprop "vendor.arc.net.ipv4.host_wifi_address")"; 
[ -n "$iploc" ]|| iploc="$(ifconfig 2>/dev/null|grep -v "lo"|\
grep -w "4163" -A1|tail -n1|cut -f10 -d" ";)"; 
[ -n "$iploc" ]|| iploc="$(ip -4 -brief address show scope global|grep -e "UP"|tail -c24|cut -f1 -d"/"|tr -d " ")"; 
# iploc="$(ip a|grep -v "lo" -A8|grep -w "inet" -m1|tr -s "inet/" "_"|cut -f2 -d"_"|tr -d " ")"; 
printf %b "$iploc" > $HOME/.iploc.sh; 
iploc6="$(ip -oneline -6 a show scope global|cut -f7 -d" "|head -c-4)"; 
####
####
[ -z "$HOSTNAME" ]&& HOSTNAME="$(uname --kernel-name --kernel-release|tr " ." "_")"; 
[ -z "$HOST" ]&& HOST="$(uname --kernel-name --kernel-release|tr " ." "_")"; 
####
####
#if [ -e "${PREFIX}/bin/figlet" ]; then ff=$(figlist|shuf -n1); printf "\n\n$ff\n\n"; 
#figlet -c -f "$ff" "_Hello"|batcat -ppfl zig 2>/dev/null; printf "\n\n"; fi; 
####
####
. $HOME/start/config/tmux/tmuxbashcompletions.sh; 
. $HOME/start/alias.sh; 
inbash() { 
dots="${re}··········\n"; 
printf %b "$pink$HOSTNAME\e[1;37m - \e[0m\e[40m$(uptime) $re\n$dots"; 
printf %b "$re$pink$dim$(fortshort 2>/dev/null)\n$dots"; 
cat ~/logs/gcalagenda.sh 2>/dev/null|grep " " && \
printf %b "$(batcat ~/logs/gcalagenda.sh -ppflzig --theme Nord 2>/dev/null |\
column|head -n4 2>/dev/null; )\n$dots"; 
printf %b "$(dfree)$re\n$dots"; 
printf %b "$(getcal 2>/dev/null; )\n$dots"
printf %b "$yellow$MACHTYPE$re | $cyan$HOST$re \n$dots"
test -e "~/._aptup.nfo" 2>/dev/null &&\ 
cat ~/._aptup.nfo 2>/dev/null|grep -e '[0-9]' --color && \
printf %b "$re$dots"; 
printf %b "$green$rev ${model[*]} $re | $dim$mod$re \n$dots";  
printf %b "$cyan$me$re@$pink$HOSTNAME$re | $green$TERM$re | $cyan$0$re | $pink$TERM_PROGRAM$re \n$dots"; 
[ "${SSH_CONNECTION}" ] && printf "$re$red${sshc}$re >> "; 
printf %b "$cyan$ip4$re | $blue$iploc$re | $red$iploc6$re\n$dots"; 
printf %b "$dim$(date -R)$re | $re$dim$(uptime)\n$dots"; 
####
####
# error_code() { printf %b "\n\e[38;5;$1mG $1"; return $@; }; 
mod="$(echo -e "${model[*]}"|tr " " "-";)"; 
[ "${LF_LEVEL}" ]&& \
printf "\n\e[7;91m -- LF_LEVEL \e[92m = $LF_LEVEL  \e[0m\n"; 
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
apts=(\
openssl openssh-server sshfs rsync \
rclone googler figlet lolcat \
toilet iproute2 net-tools nmap \
nmtui fastfetch neofetch \
fzf ccze lf batcat \
bat ncdu bash-completion lsd \
tmux git gh nodejs \
texinfo aha micro \
wget curl aria2 python \
)
}; 
# [ "$TMUX" ] || [ -z "$SSH_CONNECTION" ] || tmux;
[ -f "$HOME/._tmux" ]|| touch "$HOME/_.tmux"
[ -x "$HOME/._tmux" ]&& [ -z "$TMUX" ]&& [ -z "$SSH_CONNECTION" ]&& tmux; 
[ -n "$TMUX" ]&& inbash; 
[ -n "$SSH_CONNECTION" ]&& inbash; 
[ -x "$HOME/._tmux" ]&& echo "$HOME/_.tmux" is execetuble!; 
PS1=''$re$dim'[\e[0;1;38;5;$((2 + $?))m$?'$re$dim'] \
['$re''$white'\t'$re$dim'] ['$re$pink'$iploc'$re$dim'] \
['$re''$green'${mod:0:29}'$re$dim'] ['$re$cyan'\u'$re$dim'] \
['$re$yellow'\w'$re$dim']'$re'\e[0m >_ \n'; 
	
