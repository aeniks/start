calget() {
(echo; echo -ne "xx_"; cat $HOME/logs/calendar.json)|\
tr "{," "\n"|\
grep -v "description"|\
grep -v "call"|\
grep "summary" -A2 --group-separator="_"| sed 's/"/ /g'|cut -f2- -d":"|\
tr -s "\n_" " \n"|cut -f2- -d" "| \
batcat -ppfld;
}
