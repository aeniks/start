
apa() { 
local IFS=$'\n\t '; 
unset ny sudo; 
hash sudo 2>/dev/null && sudo=sudo; 
bw=18,top; [[ $COLUMNS > 22 ]]&& bw="70%,right";
pwd="${PWD}"; printf %b "\n.... to update run [apass] ....\n"|bat -pflc --theme Dracula; 
cd $HOME/logs/apts &>/dev/null; aapp=($(ls|fzf -i -m --color preview-bg:0 --bind "q:abort" --preview "tac {}|tail -c+2|bat -ppflzig" --preview-window "wrap,${bw},noborder" --border none --cycle --ansi --inline-info))||(printf %b "\n\n"&& cd $pwd &>/dev/null&& return 1;)||return 1; cd $pwd &>/dev/null&& 
printf %b "\n\n"; (printf %b " -- Install: "; 
printf %b "${aapp[*]}"|tr -s "\n" ","; bb="\b"; 
[[ ${#aapp[*]} == 1 ]]&& unset bb; 
printf %b "$bb ? [Y/n] ")|bat -pflc --theme Nord; 
cd $pwd &>/dev/null; 
read -s -n1 "ny"; if [ -z $ny ]; then 
printf %b "\e[92m OK\e[0m \n\n"; 
cd $pwd &>/dev/null; 
$sudo apt install -y ${aapp[*]}; 
else cd $pwd &>/dev/null; 
printf %b "\n\n"; return 0; fi; 
}; 
