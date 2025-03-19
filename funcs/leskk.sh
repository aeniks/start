alias less='less -R --file-size --use-color --quit-if-one-screen --incsearch --prompt="(%T) [/]search [n]ext-match [p]rev-match ?f%f .?n?m(%T %i of %m) ..?lt %lt-%lb?L/%L. :byte  %bB?s/%s.  .?e(END)  ?x-  Next\:   %x.:?pB  %pB\%..%t " --quit-at-eof'
unalias less

# $(tmux set-option -g mouse of 2>/dev/null; ); \
# tmux set-option -g mouse on 2>/dev/null;
alias kk='batcat --pager=""less -R --file-size --use-color --incsearch --prompt=' '(%T) [/]search [n]ext-match [p]rev-match ?f%f .?n?m(%T %i of %m) ..?lt %lt-%lb?L/%L. :byte  %bB?s/%s.  .?e(END)  ?x-  Next\:   %x.:?pB  %pB\%..%t' ' "" '

# $(tmux set-option -g mouse of 2>/dev/null; ) 
# tmux set-option -g mouse on 2>/dev/null; 
