function apap () { 
read -ep " update ? " "ok"; [ -z $ok ]||return 0; 
local IFS=$'\n '; printf %b "\n\n\n\n\n\n\e[8A $c2 Update apt list ...  \e[0;2m[\e[0mY\e[2m/\e[0mn\e[2m]\e[0m "; 
printf %b "\n\e[A\e[28G\e[92mOK\e[0m\n $c2 Updating... \n\n\n\n\e[4A\n"; 
####
cd $HOME/logs/apts; 
apa=apa4.log; [ -z $PREFIX ] && sudo=sudo; mkdir -p $HOME/logs/apts 2>/dev/null;  
####

_ap0() { 
echo 0; 
for b in $(shuf $apa); do 
echo $b|grep -e "lib" -e "static" &>/dev/null && _ap$((RANDOM%5)); 
[ -e $b ]||apt show $b &>/dev/null > $b && echo -ne "\e[4G${b:2:8}";  done; }; 

_ap1() { echo -n "1"; 
for c in $(shuf $apa); do 
if (echo $c|grep -e "lib" -e "static" &>/dev/null; ); then echo -n "4" && _ap4; 
else [ -e $c ]||apt show $c &>/dev/null > $c && echo -ne "\e[4G${b:2:8}";  fi; done; }; 

_ap4() { echo -n "4"; 
for b in $(shuf $apa); do 
echo $b|grep -e "lib" -e "static" &>/dev/null && _ap$((RANDOM%5));  
[ -e $b ]||apt show $b &>/dev/null > $b && echo -ne "\e[4G${b:2:8}";  done; }; 

_ap5() { echo -n "5"; 
for u in $(shuf $apa); do 
echo $u|grep -e "lib" -e "static" &>/dev/null && _ap$((RANDOM%5)); 
[ -e $u ]||apt show $u &>/dev/null > $u && echo -ne "\e[4G${b:2:8}";  done; }; 

_ap3() { echo -n "3"; 
for k in $(shuf $apa); do 
echo $k|grep -e "lib" -e "static" &>/dev/null && _ap$((RANDOM%5));  
[ -e $k ]||apt show $k &>/dev/null > $k && echo -ne "\e[4G${b:2:8}"; done; }; 

_ap2() { echo -n "2"; 
for z in $(shuf $apa); do 
echo $z|grep -e "lib" -e "static" &>/dev/null && _ap$((RANDOM%5)); 
[ -e $z ]||apt show $z &>/dev/null > $z && echo -ne "\e[4G${b:2:8}";  done; }; 
####

for a in $(shuf $apa); do echo $a|grep -e "lib" &>/dev/null && echo -n "0" && _ap0; echo $a|grep -e "static" &>/dev/null && echo -n "1" && _ap1; 
[ -e $a ]||apt show $a &>/dev/null > $a; done; 
####

printf %b "\e[0m\n";                                      
echo;                                                         
cd $HOME/logs/apts;                                           
apas=($(cat $apa | fzf --bind "q:abort" -i -m --border none --preview "cat "{}" 2>/dev/null|batcat -ppflc" --preview-window right,wrap --scroll-off=22 --inline-info));              
[ "$apas" = "q" ] && echo ok && return 0;                                                                                                                                                    
apas=(${apas[*]/q/});                                                                                                                                                    
printf %b "\n\n\n\n\n\e[7A \e[96m--\e[0m Install: ";                                                                                                                     
unset mn;                                                                                                                                                                
mn=66;                                                                                                                                                                
for i in ${apas[*]};                                                                                                                                                  
do                                                                                                                                                                    
printf %b "\e[38;5;"$((mn++))"m$i\e[0m, ";   
done;                                            
[ -z "$apas" ] && echo && echo && cd - && return 0;
printf %b "\b\b\e[2;96m? \e[0;2m[\e[0mY\e[2m/\e[0mn\e[2m]\e[0m ";
read -sn1 "ny";                                                  
echo;                                                  
echo;                                                  
[ "$ny" ] || $sudo apt install ${apas[*]}              
} 
