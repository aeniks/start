
wohtml() { 
mkdir -p $HOME/logs/wotd 2>/dev/null; 
wohtml="$HOME/logs/wotd/wo_$(date +%Y_%m_%d).html"; wotd_m &>/dev/null; printf %b "$(figlet -f Roman $w_w|bat --theme Nord -ppfljava)\n$(printf %b " $w_m    "|bat --theme Nord -ppflzig)\n\e[2m\n [\e[0m$(printf %b "$w_p"|bat -ppflr)\e[2m] > \e[96m$w_t    \e[2m\n\n\n\n"|aha -b -y 'margin:0;width:100%;overflow-x:hidden;font:400 2vw monospace;text-align:center;padding-top:2vh;' > $wohtml; sed -i '6i<meta name="viewport" content="width=device-width, initial-scale=1.0" />' $wohtml; }; 

