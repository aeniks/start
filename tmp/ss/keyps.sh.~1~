#!/bin/bash
## get arrow keys
printf "\n\n\n\n\n\n\e[4A\e[?25l\n    >_< "; while read -rsn1 k; do 
[ "$k" = A ]&&printf "    ^   up"&& break; 
[ "$k" = B ]&&ff=$((ff++)) printf "    v   down"&& break; 
[ "$k" = C ]&&printf "    >   right"&& break; 
[ "$k" = D ]&&printf "    <   left"&& break; 
[ "$k" = q ]&&printf "    ĸ   qko"&& break; 
done; printf "\n\e[?25h\n"; 
