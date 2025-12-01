#!/bin/bash
uuoo() { local IFS=$'\n\t '; unset ll; declare -a ll; ll=($(for i in $(tmux list-panes | cut -c1 | rev; ); do tmux capture-pane -Jqpt$i|\
grep -Eo "(http|https)://[a-zA-Z0-9./?=_%:-].*.*"|tr -s " " " "; done; sort -u;));

# tr "; " "\n" |grep -oE "(http?[s]://)?([\da-z\.-]+)\.([a-z\.]{0,12})([/\w?=.-].*)"|sed -e "s/\ /\n/g"|tr -s " " " "; done|sort -u;)); 

uuoo=$(printf %b "${ll[*]}"|fzf --tmux "center,98%,$(($(printf %b "${ll[*]}"|wc -l)+4))" --sync; ); 
[ $uuoo ] || return 0; 
# printff %b "uuoo"|grep -E 'http://|https://' || hh='https://'; 
termux-open-url $uuoo 2>/dev/null || \
termux-open $uuoo 2>/dev/null || \
xdg-open $uuoo 2>/dev/null || \
open $uuoo 2>/dev/null || \
(printf %b "\n\n\n\n\e[A4A\n"; read -p' -- open with: ' -r "op"; printf %b "  ok\n"; $op $uuoo; ); };
uuoo
