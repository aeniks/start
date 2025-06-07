## BASH shell
# printf '\n\tInternet speed test:  '

# http://stackoverflow.com/questions/12498304/using-bash-to-display-a-progress-working-indicator
spin() { 

spin[0]="-"
spin[1]="\\"
spin[2]="|"
spin[3]="/"

unset qq; 
# http://stackoverflow.com/questions/20165057/executing-bash-loop-while-command-is-running

# (for i in {1..42}; do printf %b "\e[38;5;${i}m kk $i $((RANDOM)) "; sleep .2; done )
$@ &> .st.txt & disown 2>/dev/null;           ## & : continue running script
pid=$!                          ## PID of last command
printf %b "\e[A\e[K\e[A\e[9G \e[0J\e[0m\e[2m[\e[0m\e[s \e[2m]\e[0m\e[K \n\n\e[?25l"; 
# If this script is killed, kill 'speedtest':
trap "kill $pid &>/dev/null" EXIT
# While 'speedtest' is running:
printf %b "\e[0m"; 
while kill -0 $pid &>/dev/null; do
for i in "${spin[@]}"
do
printf %b "\e[u\e[0m$i"
read -e -s -t 0.1 -n 1 "qq" 2>/dev/null; 
[[ "$qq" == "q" ]] 2>/dev/null && printf %b "\b\e[?25h" && break; done; 
[[ "$qq" == "q" ]] 2>/dev/null && printf %b "\b\n\e[?25h" && return 0; 
printf %b "\e[u\e[$((LINES - 1))H$(tail -c $((COLUMNS - 4)) .st.txt|tr -d "\n"|pr --omit-header --page-width=$((COLUMNS - 2)))\e[K\e[0m\e[u"; 
done; 
printf %b "\n\e[?25h"


# Disable the trap on a normal exit:
trap - EXIT

rm -f .st.txt
} 
