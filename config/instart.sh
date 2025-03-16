#!/bin/bash 
## install config-files 
mkdir $HOME/tmp 2>/dev/null; 
mv $HOME/.inputrc $HOME/tmp/ 2>/dev/null; 
ln $HOME/start/config/inputrc $HOME/.inputrc --symbolic; 
mv $HOME/.tmux.conf $HOME/tmp/ 2>/dev/null; 
ln $HOME/start/config/tmux/tmux.conf $HOME/.tmux.conf --symbolic; 
mv $HOME/.tmux.conf.local $HOME/tmp/ 2>/dev/null; 
ln $HOME/start/config/tmux/tmux.local.conf $HOME/.tmux.local.conf --symbolic; 
mv $HOME/.config/lf $HOME/tmp/ 2>/dev/null; 
ln $HOME/start/config/lf $HOME/.config/ --symbolic; 
