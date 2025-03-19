## discover lan w ping & ssh 
12localan() { 
ipt=$(mktemp; ); echo -e "\nchecking:\t\t [q]uit\n\n\n\n\e[4A\n"; 
for i in {0..255}; do ping -c 1 ${iploc%.*}.${i} >/dev/null && \
printf %b "\e[K\n${iploc%.*}.$i" && \
printf %b "${iploc%.*}.$i\n" >> "$ipt"& disown; \
printf %b "\e[K\e[A\e[K"; 
read -t 0.02 -n1 -s -p "${iploc%.*}.$i " "ny"; 
[ $ny ]&& break; done; 
printf %b "\e[K\n--------\n\$iplocall\t$ipt
--------\n\n"; 
# ipends=($(cat $ipt|cut -f4 -d"."; ));
iplocall=($(cat $ipt; )); cat "$ipt"; echo; 
nmap ${iplocall[*]} --open -p 8022,22,443|\
sed 's/Nmap scan report for /\n/g'|\
grep -v 'Not shown'|\
grep -v 'Nmap'|\
grep -v 'PORT'|\
batcat -ppflc; }; 
