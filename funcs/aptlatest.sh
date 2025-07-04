
aptlatest() { (printf %b "\n\n\t\t ______ latest installed apps ______\n\t\t ----------------------------------- \n\n"; $sudo chmod 700 $PREFIX/var/log/apt/history.log; tac $PREFIX/var/log/apt/history.log | grep -v 'apt upgrade -y' | grep -e 'Commandline' -A1|cut -f2- -d "-" |cut -f2- -d " "; ) | bat -pfld; };
