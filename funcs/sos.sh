
sos() { pp="${PWD}"; if [ -z $1 ]; then command cd $PREFIX/bin 2>/dev/null; printf %b "\n\n\e[A -- help:"; read -ep ' ' 'sos'; cd $pp; fi; man -c $sos|col -b|tr -s " ''" " //"|bat -pfld; cd $pp; }; 
