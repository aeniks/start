#!/bin/bash
url() { urler=($(tmux capture-pane -J -p | \
grep -oE '(https?):\/\/.*[^>]' | \
fzf-tmux --height "~22%" -d20 --multi --bind alt-a:select-all,alt-d:deselect-all)); 
xdg-open $urler || termux-open-url $urler ; }; 
