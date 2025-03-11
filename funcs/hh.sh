
alias hh='echo -e " --\e[7m $HISTFILE \e[0m -- "; cat $HOME/.bash_history|fzf --height 48% --tac --inline-info --expect "q" -m -i|tee $HOME/._hist_last.sh; printf %b "\nsaved to: $dim$HOME/._hist_last.sh$re\n\n\n\n\n\e[4Aopen? [Y/n]? "; read -sn1 "ny"; [ -z $ny ]&& mm $HOME/._hist_last.sh; echo;'; 
