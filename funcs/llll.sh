
llll() { ls=($(ls --group-directories-first --color -trcp|fzf --tac --ansi -i -m --expect "q" --bind "right:accept" --bind "left:abort" --cycle --preview "realpath "{}"|bat -ppfljs; [ -f {} ]&& mediainfo {}|tr -s "\n" "\n"|bat -ppflc; ls --color -apltcr {}; bat -ppf {} 2>/dev/null||realpath {}" --preview-window "top,wrap"||return 1; ))||(cd .. && llll)&&cd $ls && llll; };
