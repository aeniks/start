







[ -e ~/.config/tmux/plugins ] || mkdir -p ~/.config/tmux/plugins 2>/dev/null; 
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm; 
cd ~/.config/tmux/plugins/tpm; 
tmux set -g @plugin 'tmux-plugins/tpm' 
tmux set -g @plugin 'tmux-plugins/tmux-sensible' 
tmux run '~/.config/tmux/plugins/tpm/tpm' 
tmux source ~/.config/tmux/tmux.conf 
cd $OLDPWD; 
