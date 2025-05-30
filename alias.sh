#!/bin/bash
## aaaaaa
#<<<<<<< HEAD
alias 12path='$EDITOR $HOME/.config/path.sh; '; 
alias path_change='$EDITOR $HOME/.config/path.sh; '; 
alias less='less -R --file-size --use-color  --incsearch --prompt="(%T) [/]search [n]ext-match [p]rev-match ?f%f .?n?m(%T %i of %m) ..?lt %lt-%lb?L/%L. :byte %bB?s/%s.  .?e(END)  ?x-  Next\:   %x.:?pB  %pB\%..%t "'; 
alias sd='cd /sdcard';
alias ss='cd $start; '; 
alias mm='$EDITOR '
alias qq='cd .. ; ll ';
alias rr='sudo -s';
alias ll='lsd -l --extensionsort --group-directories-first -tr'; 
alias ipme='wget https://icanhazip.com -qLO-'; 
alias quotes='fortune $s|tr -s "\t" " "'
alias reloadbash='clear; exec bash '; 
alias figz='figlist=($(figlist|batcat -pp --line-range 4:|head -n-5)) '; 
alias gpg='gpg --pinentry loopback';
alias ff='[ -e $PREFIX/bin/fastfetch ] && fastfetch || neofetch'
alias ipme4='curl https://icanhazip.com -s4'; 
alias no='printf "\e[?25h\e[0m"; tmux set mouse on 2>/dev/null; reset -I 2>/dev/null;'
alias r='ranger --choosedir=$HOME/logs/path; cd $(cat $HOME/logs/path)'; 
alias l='lf -config $HOME/.config/lf/lfrc -last-dir-path $HOME/logs/ll.log; cd $(cat $HOME/logs/ll.log); '; 
alias kat='bat -pfld|less'; 
alias kk='bat -pflzig'; 
# alias kk='bat -ppflzig $(tmux set-option mouse off; )|less; tmux set-option mouse on; '; 
alias iiii='$EDITOR $HOME/.inputrc; echo gg; exec bash; '
alias speed='speedtest --bytes --no-upload 2>/dev/null || speedtest-go --unit=decimal-bits \
--no-upload || speedtest-cli 2>/dev/null; '
########
alias 12install_nvm='. $start/config/nvm.sh'
alias 12nvm_init='export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" \
|| printf %s "${XDG_CONFIG_HOME}/nvm")"; [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"; ';

alias 12nvm_init2='[ -s "$NVM_DIR/nvm.sh" ]&& . "$NVM_DIR/nvm.sh";
[ -s "$NVM_DIR/bash_completion" ]&& . "$NVM_DIR/bash_completion"'
NVM_DIR="$HOME/.nvm"; 
#######

alias dfree2='printf %b "\e[0;2m$(df -h|head -n1|\
tr -s " " "\t"|batcat --theme=Nord -ppflc++; )\e[0;1m\n"; \
df="/dev"; [ $PREFIX ]&& df="/dev/fuse"; df -h|\
tr -s " " "\t"|grep -v "100%"|grep -v "tmpfs"|\
grep -v "none"|grep -v "run"|\
grep -v "efivars"|grep -v "boot"|grep -v loop|\
grep -e "$df"|batcat --theme=Dracula -ppflc++';
########
alias 12info='cd $start/info; qmenu && bat -pf $sel; cd -; '
alias 12info_tput='batcat -pf "$start/info/tput.nfo"; ';
alias 12info_ansi='batcat -pf "$start/info/ansi.md"; ';
alias 12info_bash='batcat -pf "$start/info/bash.md"; '; 
alias 12tmux_on='chmod 775 $HOME/.config/tmux_state; echo "on!"';
alias 12tmux_off='chmod 600 $HOME/.config/tmux_state; echo "off!"';
alias 12edit-alias='$EDITOR ~/start/alias.sh'
alias 12edit-termux='$EDITOR ~/.termux/termux.properties'
alias 12edit-input='$EDITOR ~/.inputrc'
alias 12edit-lf='$EDITOR ~/.config/lf/lfrc'
alias 12edit-bashrc='$EDITOR ~/.bashrc'
alias 12edit-tmuxlocal='$EDITOR ~/.tmux.conf.local'
alias 12edit-anews_start='$EDITOR ~/start/anew.sh'
####
alias coolors='echo; for i in $(seq --equal-width 255); do printf "\e[48;5;${i}m ${i} \e[7m\e[30m ${i} \e[0m"; done; '; 
####
alias push='git add --all; git commit --all -m $(date +%F_%H_%M); git push -v|batcat -ppflzig'
alias pp='push'
alias pull='git pull'
alias pppp='git pull|batcat -ppflzig'; 
alias uuuu='sudo apt update 2>/dev/null| \
bat -ppflzig --theme=Nord; sudo apt upgrade -y 2>/dev/null| \
bat -ppfld --theme=1337; sudo apt autoremove -y 2>/dev/null | \
bat -ppflc --theme=1337; 
sudo apt update &>/dev/null|tail -n1 > $HOME/logs/aptup.log && \
printf %b "\n -- done\n\n"; '; 
alias uu='uuuu'; 




# alias 12install_cloudpanel.io='echo; (echo; curl -sL https://cloudpanel.io/docs/v2/getting-started/other|html2text|grep -e "curl -sS" -A3 -m1; echo; )|tee $HOME/cloudpanel_installer.sh; chmod 775 $HOME/cloudpanel_installer.sh; printf %b "\n\n\n\n\e[2A"; read -e -n1 -sp "continue? [Y/n] " "ny"; [ $ny ]||. $HOME/cloudpanel_installer.sh; echo "gg"; '; 


# alias l='cd $(lf -config $HOME/.config/lf/lfrc -print-last-dir); grep -e "/" \
# "$HOME/.local/share/lf/files" 2>/dev/null'; 
