wordfig() { 
[[ $1 ]]&& ww=($@); 
figlet -w $COLUMNS -f Roman -o "$ww"|bat -ppfljava --theme DarkNeon; printf %b "\e[2A${ww[1]}\n"|bat -ppfll --theme DarkNeon ; printf %b "\n${ww[*]:2}\n"|tr "\n" " "|bat -ppf --language d --theme Visual\ Studio\ Dark+ ; printf %b "\n"; 
}; 

