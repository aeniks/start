#!/bin/bash
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
touch $HOME/.comfig/tmux_state 2>/dev/null; 
alias 12tmux_on='chmod 775 $HOME/.comfig/tmux_state; echo "on!"';
alias 12tmux_off='chmod 600 $HOME/.comfig/tmux_state; echo "off!"';
alias 12edit-alias='$EDITOR ~/start/alias.sh'
alias 12edit-termux='$EDITOR ~/.termux/termux.properties'
alias 12edit-input='$EDITOR ~/.inputrc'
alias 12edit-lf='$EDITOR ~/.config/lf/lfrc'
alias 12edit-bashrc='$EDITOR ~/.bashrc'
alias 12edit-tmuxlocal='$EDITOR ~/.tmux.conf.local'
alias 12edit-anews_start='$EDITOR ~/start/anew.sh'
alias 12install_cloudpanel.io='echo; (echo; curl -sL https://cloudpanel.io/docs/v2/getting-started/other|html2text|grep -e "curl -sS" -A3 -m1; echo; )|tee $HOME/cloudpanel_installer.sh; chmod 775 $HOME/cloudpanel_installer.sh; printf %b "\n\n\n\n\e[2A"; read -e -n1 -sp "continue? [Y/n] " "ny"; [ $ny ]||. $HOME/cloudpanel_installer.sh; echo "gg"; '
alias less='less -R --file-size --use-color --quit-if-one-screen \
--incsearch \
--prompt="(%T) [/]search [n]ext-match [p]rev-match \
?f%f .?n?m(%T %i of %m) ..?lt %lt-%lb?L/%L. :byte  \
%bB?s/%s.  .?e(END)  ?x-  Next\:   %x.:?pB  %pB\%..%t "'; 
alias start='cd $start; '; 
alias l='cd $(lf -config ~/.config/lf/lfrc -print-last-dir); grep -e "/" '~/.local/share/lf/files'; grep -e "/" '~/.local/share/lf/tags' --no-messages 2>/dev/null'; 
alias r='ranger --choosedir=$HOME/logs/path; cd $(cat $HOME/logs/path)'; 
