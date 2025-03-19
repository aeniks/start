alias less='tee|less --file-size --use-color --quit-if-one-screen --incsearch
 --prompt="(%T) [/]search [n]ext-match [p]rev-match ?f%f .?n?m(%T %i of %m) ..?lt %lt-%lb?L/%L. :byte  %bB?s/%s.  .?e(END)  ?x-  Next\:   %x.:?pB  %pB\%..%t " $(tmux set-option -g mouse of 2>/dev/null; ); tmux set-option -g mouse on 2>/dev/null; '; 
alias kk='batcat -ppf|less'; 
