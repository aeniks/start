
export red='\e[31m' green='\e[92m' yellow='\e[93m' blue='\e[94m' \
pink='\e[95m' cyan='\e[96m' white='\e[37m' rev='\e[7m' \
re='\e[0m' bold='\e[1m' dim='\e[2m' c2='\e[0m\e[36m--\e[0m' \
black='\e[30m' invis='\e[8m' c2='\e[0m\e[36m -- \e[0m' 
nyo='\e[0m[\e[2mY\e[0m/\e[2mn\e[om]' 
[ -z $USER ]&& export USER="$(id -nu)"; 
[ -z $start ]&& export start="$HOME/start"; 
