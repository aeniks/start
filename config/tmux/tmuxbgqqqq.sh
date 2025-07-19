#!/bin/bash
unset tmuxbg; 
tmuxbg() { 
unset -v cl; 
bash -c printf -v "cl" %b "$((RANDOM%200))"; 
tmux set-option -g status-style bg=colour${cl}; 
tmux source-file ~/tmux/tmux.conf 
}; 
tmuxbg; 
unset tmuxbg; 

