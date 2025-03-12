#!/data/data/com.termux/files/usr/bin/bash
alias less='less --file-size --use-color --tilde -rR \
--prompt="(%T) ?f%f .?n?m(%T %i of %m) ..?lt %lt-%lb?L/%L. :byte  %bB?s/%s.  .?e(END)  ?x-  Next\:   %x.:?pB  %pB\%..%t "'
alias kk='batcat -ppld|less'
