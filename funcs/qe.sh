#!/data/data/com.termux/files/usr/bin/bash
qe() { unset qq; qq="$@"; cd $PREFIX/bin; 
[ -z "$qq" ] && printf %b "\n\n\n\n\e[2A" && read -ep "$PREFIX/bin/" "qq"; 
( echo -e "\e[4;95m"; 
apropos "${qq} " 2>/dev/null|tr -s " " " "|grep --color -C1 "$qq " && echo "--"; 
echo -ne "\e[96mTYPE_IS\e[0m: "; 
type ${qq} 2> /dev/null|grep "$qq" --color && echo "--"; 
echo -ne "\e[92mWHAT_IS\e[0m: "; 
whatis ${qq} 2> /dev/null | tr -s " " " "|grep "$qq" --color; ); 
cd $OLDPWD; }
#qe() { unset qe; qe="$@"; [ -z "$qe" ]&& cd $PREFIX/bin&& printf %b "/bin/"&& read -e "qe"; (apropos ${qe} && echo "--"; echo -ne "\$TYPE: "; type ${qe} 2>/dev/null && echo "--"; echo -ne "\$WHATIS: "; whatis 2>/dev/null ${qe}|tr -s " " " ";)|batcat -ppfld; }; 
