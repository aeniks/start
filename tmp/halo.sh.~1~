#!/bin/bash
## 
halo() {
printf "\e[?25l\e[$((LINES/6))H";
for i in {1..111}; do printf "\e[38;5;${i}m\n\n\n\n"; 
figlet -f DOS_Rebel "hello!" -w $COLUMNS -c; printf "\e[14A"; read -n1 -t.1 -res x; 
[ "$x" ]&&break; done; 
for i in {111..222}; do printf "\e[38;5;${i}m\n\n\n\n"; 
figlet -f DOS_Rebel "hello!" -w $COLUMNS -c; printf "\e[14A"; read -n1 -t.1 -res x; 
printf "\e[$((RANDOM%6))A\e[$((RANDOM%2))B"
[ "$x" ]&&break; done; 
printf "\e[?25h\e[8B\n\n\n\n\n\n\e[$((COLUMNS/2-16))G";
read -n1 -srep "  ok? [Y/n]" "f"; [ "$f" ]||\
printf "\e[$((COLUMNS/2-16))G  \e[7m   ok!   \e[0m \n\n\n\n\n\n"
}



