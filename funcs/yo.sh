yo() { 

if ! [ -x "$(command -v figlet)" ]; then read -rep "$c2 dl figlet? " -i "y" kk; 
$sudo apt install figlet -y >/dev/null||sudo apt install figlet -y >/dev/null; fi; 
[ $1 ]||(printf %b "$c2 yo "; read -re "msg"; ); figlet -c -f block "$msg$@" 2>/dev/null||figlet-figlet \
-c -f block "$msg$@"; unset mx kk; 
read -rep ">_ " "msg"; 
echo;echo;figlet -f Big_Money-ne "$msg$@"|bat -ppfl Zig;echo;echo; 
}; 



