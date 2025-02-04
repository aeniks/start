#!/bin/bash
## aaaaaa
alias sd='cd /sdcard';
besh() { 
test -n $TMUX && return 0;  
test -n $SSH_TTY && return 0; 
export ants="/data/data/com.termux/files/home/ants"; 
. $ants/alias.sh; 
alias sd='cd /sdcard'; 
alias sshh='[ "${TMUX}" ]&& tt="-tmux -h"; shsh="$(cat $HOME/.ssh/known_hosts|cut -f1 -d" "|tr -d "[]"|uniq|fzf$tt --wrap|tail -n1|sed s/:/" -p "/g)"; 
printf %b "\n\n\n\n\n\n\n\e[6A"; printf %b "\e[0m$shsh"|batcat -pfflzig; printf %b "\e[A\e[0;92m\nuser\e[0m:"; 
read -rep " " -i "aa" "usr"; printf %b "\e[96mssh \e[0m>> \e[91m$shsh\e[0m [Y/n] "; 
unset yno; read -s -n1 yno; printf %b "\n\e[95m"; [ -z "$yno" ]&&ssh ${usr}@${shsh};'; 
uptime; id; getprop ro.system.product; 
for i in $(ls ~/start/funcs|grep -v "~"); do . ~/start/funcs/$i; done; 
. ~/start/anew.sh; 
. ~/start/mac.sh; mac; echo; 
}; 
#test -z $TMUX && tmux && besh; 
#echo besh; 
