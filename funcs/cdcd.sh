
cdcd() { ls --group-directories-first --color -tp|fzf -i --ansi --cycle --bind q:abort --border none --preview-window top --preview "ls --color -dl $(realpath {}; ); batcat -ppf {} 2>/dev/null||ls --color --group-directories-first --no-group -laptr {}; "; }; 
