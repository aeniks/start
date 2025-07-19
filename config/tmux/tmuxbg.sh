tmuxbg() { 
tmux set-option -g status-style bg=colour$(printf %b $((RANDOM%22 + 88))); 
tmux source-file ~/tmux/tmux.conf; 
}; 
tmuxbg; 
