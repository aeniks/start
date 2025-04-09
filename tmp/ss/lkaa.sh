



IFS=$'\n\t '; ff=($(cat ./figz.sh|shuf)); h=55; fn=1; 
printf %b "\e[$((LINES - 2));$((COLUMNS / 4))H\e7"; 
while read -n1 -s k; do case $k in 
 A) [[ $fn < 99 ]]&& n="\e[38;5;$((h++))m"; printf %b "\e8\e[K$n 	${ff[$h]} " ;; 
 C) [[ $fn < 99 ]]&& n="\e[38;5;$((h++))m"; printf %b "\e8\e[K$n 	${ff[$h]} " ;; 
 B) [[ $fn > 1 ]] || n="\e[0;2m";((h--));   printf %b "\e8\e[K$n 	${ff[$h]} " ;; 
 D) [[ $fn > 1 ]] || n="\e[0;2m";((h--));   printf %b "\e8\e[K$n 	${ff[$h]} " ;; 
"") printf %b "\e8\e[A\e[1J\e[2H"; figlet -f "${ff[$h]}" -w $COLUMNS -c "${ff[$h]}"|bat -ppflzig; ((h++)) ;; 
 q) printf %b "\e8\e[K$n ${ff[$h]} \n"; break;; 

esac; done; 


 # *) printf %b "enter 	$fn " 		;;


# 
#       B ) ((fn--)); printf %b "\e8\e[K down     0";;
#       C ) printf %b "\e8\e[2K$((fn++)) right $fn    2"; #break; 
#       ;;
#       D ) printf %b "\e8\e[1K$((fn--)) left $fn   1" #break; 
