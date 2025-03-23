alias l='lf -print-selection -last-dir-path $HOME/.lfp.log; cd $(cat $HOME/.lfp.log); \
lfc=($(tail -n+2 $HOME/.local/share/lf/files|tee $HOME/.lfc.log 2>/dev/null; )); \
test -n $lfc && printf %b "\e[0mcopy-selected: \e[36m\n${lfc[*]}\e[0m\n"; 
lft=($(tail -n+2 $HOME/.local/share/lf/tags|tee $HOME/.lft.log 2>/dev/null; )); \
test -n $lft && printf %b "\e[0mtags-selected: \e[35m\n${lft[*]}\e[0m\n"; '; 
