alias kk='tee $HOME/logs/kk.log|batcat -pflzig --theme Nord $(tmux set-option mouse off; ) --pager="less --use-color --file-size --incsearc -srR --prompt="\"" [/]search [n]ext-match [N]prev-match  %lt-%lb/%L  %pB\%  [%T]"\"" "; tmux set-option mouse off;'; 
alias kkkk='bat -pflfstab|more --silent --logical'
