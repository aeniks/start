alias l='lf -last-dir-path $HOME/.lfp.log; cd $(cat $HOME/.lfp.log); \
lfc=($(tail -n+2 $HOME/.local/share/lf/files|tee $HOME/.lfc.log; )); printf %b "\n\n${lfc[*]}\n\n"; '; 
