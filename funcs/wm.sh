
wm() { [ $1 ] && w="$@"; while true; do printf %b "\e[H\e[J\e[?25l\n\n\n\n\n\n"; f="$(shuf -n1 $HOME/figz.sh)"; figlet -f $f -w $COLUMNS -c "$(printf %b "$w";)"|bat -ppflzig --theme Dracula ; printf %b "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n$f"; 
read -n1 -s ll; [[ $ll ]] && printf %b "\n\nok\n\e[0m\e[?25h" && break; done; }; 
