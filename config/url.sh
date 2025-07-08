#!/bin/bash
url() { url=($(tmux capture-pane -Jp | grep -oE '(https?):\/\/.*[^>]' 2>/dev/null || return 1)) || return 0; 
[ $url ] && printf %b "${url[*]}"\
|fzf --height "~12%" || return 0; 
xdg-open $url || termux-open-url $url ; }; 
url
