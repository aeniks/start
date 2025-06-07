tmuxbg() { 
tmux source-file ~/.tmux.conf; 
tmux set-option -g status-style bg=colour$(printf %b "$((RANDOM%222))";); 
} 
