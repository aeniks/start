
okok() { unset -v okill; okill=($(local IFS=$'\n'; top -o "s,pid,s" -qbn1|tr -s " " " "|cut -f2- -d" "|grep -e "T";)); kill -s KILL $okill 2>/dev/null && printf %b "\ndone\n"||printf %b "\nno ok\n\n"; }; 
