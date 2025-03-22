#!/bin/bash 
## install config-files 
mkdir $HOME/tmp 2>/dev/null; 
mv $HOME/.inputrc $HOME/tmp/ 2>/dev/null; 
ln $HOME/start/config/inputrc $HOME/.inputrc --symbolic; 
echo 'ln $HOME/start/config/inputrc $HOME/.inputrc --symbolic; '; 
mv $HOME/.tmux.conf $HOME/tmp/ 2>/dev/null; 
ln $HOME/start/config/tmux/tmux.conf $HOME/.tmux.conf --symbolic; 
echo 'ln $HOME/start/config/tmux/tmux.conf $HOME/.tmux.conf --symbolic; '; 
mv $HOME/.tmux.conf.local $HOME/tmp/ 2>/dev/null; 
ln $HOME/start/config/tmux/tmux.conf.local $HOME/.tmux.conf.local --symbolic; 
echo 'ln $HOME/start/config/tmux/tmux.conf.local $HOME/.tmux.conf.local --symbolic; '; 
rm $HOME/.config/lf -r 2>/dev/null; 
echo 'ln $HOME/start/config/lf $HOME/.config/ --symbolic; '; 

rm $HOME/.config/htop -r 2>/dev/null; 
ln $HOME/start/config/htop $HOME/.config/htop --symbolic; 
echo 'ln $HOME/start/config/htop $HOME/.config/ --symbolic; '; 
echo -e "\n\n -- done!\n\n"
