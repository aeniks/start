







[ -e ~/tmux/plugins ] || mkdir -p ~/tmux/plugins 2>/dev/null; 

git clone https://github.com/tmux-plugins/tpm ~/tmux/plugins/tpm; 
cd ~/tmux/plugins/tpm; 
tmux set -g @plugin 'tmux-plugins/tpm' 
# tmux set -g @plugin 'tmux-plugins/tmux-sensible' 
tmux run "~/.config/tmux/plugins/tpm/tpm"
tmux source ~/tmux/tmux.conf 
cd $OLDPWD; 
