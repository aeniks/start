
down() { [ -z $1 ] && read -ep 'dl: ' 'dl'||dl="$@"; (printf %b "\e[A\e[K\e[S\e[?25l\e[30mmm"; for i in {1..22}; do printf %b "\e[C\e[A"; sleep .01;done;printf %b "\e[96m";)& disown; wget -L --continue "$dl"; printf %b "\n\e[?25h\e[0mdone\n"; termux-notification -c "${dl/*\//} -- $PWD" --action "termux-open ${dl/*\//}"; }; 
