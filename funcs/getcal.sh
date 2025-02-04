getcal() { cat $HOME/logs/calendar.json|tr "+}{," "\n\n"| grep -v "description"|grep -w -A2 "summary"|sed --regexp-extended 's/-.*T/~/g'|cut -f2- -d":"|cut -f2 -d"~"|tr -s '"\n\-' "\t \n"|column --table --output-separator "  " --table-columns-limit 6 --table-hide 5|batcat -ppfld; };

