tmuxbg() { 
tmux source-file ~/.conf/tmux/tmux.conf; 
tmux set-option -g status-style bg=colour$(printf %b "$((RANDOM%222))";); 
} 
