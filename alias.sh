#!/data/data/com.termux/files/usr/bin/bash
## aaaaaa
#<<<<<<< HEAD
alias sd='cd /sdcard';

 #=======
alias diskspace='echo;df -h|head -n2|batcat -ppflc; echo;'; 
#>>>>>>> f29ca82 (2025-02-09_11_28)
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


alias tmuxon='chmod 775 $HOME/._tmux; echo "on!"';
alias tmuxoff='chmod 600 $HOME/._tmux; echo "off!"';
