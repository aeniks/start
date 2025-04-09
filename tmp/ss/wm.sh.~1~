
wm() { [ $1 ] && w="$@"; 
ff=($(cat figz.sh|shuf)); 
while true; do printf %b "\e[H\e[J\e[?25l\n"; 
f="$(shuf -n1 $HOME/figz.sh)"; figlet -f $f -w $COLUMNS -c "$(printf %b "$w";)"|bat -ppflzig --theme Dracula ; 

printf %b "\e7\n\e[$((LINES - 4))H$f\e8"; 

read -n1 -s ll; [[ $ll ]] && printf %b "\n\nok\n\e[0m\e[?25h" && break; done; }; 
