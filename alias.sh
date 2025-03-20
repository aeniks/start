#!/data/data/com.termux/files/usr/bin/bash
## aaaaaa
#<<<<<<< HEAD
alias sd='cd /sdcard';
alias dfree='\
printf %b "\e[0;2m$(df -h|head -n1|\
tr -s " " "\t"|batcat --theme=Nord -ppflc++; )\e[0;1m\n"; \
df="/"; [ $PREFIX ]&& df="/dev/fuse"; df -h|\
tr -s " " "\t"|grep -v '100%'|\grep -v "tmpfs"|\
grep -v "efivars"|grep -v "boot"|grep -v loop|\
grep -e "$df"|batcat --theme=Dracula -ppflc++';
# (df -h|head -n1|tr -s " " "\t"; df -h|\
# grep /dev/fuse --color|tr -s " " "\t")|batcat --theme Dracula -ppflc++
 #=======
# alias diskspace='echo;df -h|head -n2|batcat -ppflc; echo;'; 
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
alias 12edit-alias='$EDITOR ~/start/alias.sh'
alias 12edit-termux='$EDITOR ~/.termux/termux.properties'
alias 12edit-input='$EDITOR ~/.inputrc'
alias 12edit-lf='$EDITOR ~/.config/lf/lfrc'
alias 12edit-bashrc='$EDITOR ~/.bashrc'
alias 12edit-tmuxlocal='$EDITOR ~/.tmux.conf.local'
alias 12edit-anews_tart='$EDITOR ~/start/anew.sh'
alias 12install_cloudpanel.io='echo; (echo; curl -sL https://cloudpanel.io/docs/v2/getting-started/other|html2text|grep -e "curl -sS" -A3 -m1; echo; )|tee $HOME/cloudpanel_installer.sh; chmod 775 $HOME/cloudpanel_installer.sh; printf %b "\n\n\n\n\e[2A"; read -e -n1 -sp "continue? [Y/n] " "ny"; [ $ny ]||. $HOME/cloudpanel_installer.sh; echo "gg"; '
alias less='less -R --file-size --use-color --quit-if-one-screen --incsearch --prompt="(%T) [/]search [n]ext-match [p]rev-match ?f%f .?n?m(%T %i of %m) ..?lt %lt-%lb?L/%L. :byte  %bB?s/%s.  .?e(END)  ?x-  Next\:   %x.:?pB  %pB\%..%t " --quit-at-eof'

