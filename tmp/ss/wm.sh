
wm() { [ $1 ] && w="$@"; 
ff=($(cat figz.sh|shuf)); 
while true; do printf %b "\e[H\e[J\e[?25l\n"; 
f="$(shuf -n1 $HOME/figz.sh)"; figlet -f $f -w $COLUMNS -c "$(printf %b "$w";)"|bat -ppflzig --theme Dracula ; 

printf %b "\e7\n\e[$((LINES - 4))H$f\e8"; 

read -n1 -s ll; [[ $ll ]] && printf %b "\n\nok\n\e[0m\e[?25h" && break; done; }; 
#!/bin/bash
## get arrow keys
printf "\n\n\n\n\n\n\e[4A\e[?25l\n    >_< "; 

while read -rsn1 k; do 
[ "$k" = A ]&&printf "    ^   up"&& break; 
[ "$k" = B ]&&ff=$((ff++)) printf "    v   down"&& break; 
[ "$k" = C ]&&printf "    >   right"&& break; 
[ "$k" = D ]&&printf "    <   left"&& break; 
[ "$k" = q ]&&printf "    ĸ   qko"&& break; 
done; printf "\n\e[?25h\n"; 



# while 
# do 


read -rsn1 k; 
    case $k in
      A ) echo up; break; 
      ;;
      B ) echo down; break; 
      ;;
      C ) echo right; break; 
      ;;
      D ) echo left; break; 
      ;;
      q ) echo quit; break; 
      ;;
      "" ) printf "ENTER"
      ;;
      * ) printf "/ q /"
      ;;
    esac
