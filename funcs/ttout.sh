ttout() { 
ttout="tt_${w_w}_${EPOCHSECONDS:(-4)}"; 
printf %b "\n  -- ok"; sleep .2; printf %b " \$ttout is $ttout -- ok"; sleep .2; 
##
printf %b "<markup>\n\n\n\n\n\n\n\n\n<tt>\n<span size="'"66444"'" fgcolor="'"black"'">\n$w_w \n</span>\n<span size="'"22444"'" fgcolor="'"darkslategray"'">\n<b>[${w_p}]</b> - <b>(${w_t}) </b>\n</span>\n<span size="'"22444"'" fgcolor="'"black"'">$(printf %b "${w_m} "|fmt -w 64; echo; for i in {4..84}; do printf %b " "; done;)\n\n\n\n</span>\n\n\n\n\n\n\n\n\n</tt></markup>\n" | \
tee $HOME/logs/${ttout}.xml; 
magick -background lightgray -gravity center pango:@$HOME/logs/${ttout}.xml \
$HOME/logs/${ttout}.jpg; 
printf %b "\n------\n$w_w $w_p $w_m "; 
##
printf %b "\n\n\n\n\e[2A  -- Open $ttout ? "; printf %b "\e[0\[\e[2mY\e[0m/\e[2mn\e[0m]"; 
read -t 4 -n1 -rsp ' ' 'yno'; [[ "$yno" == "${yno#[a-xzA-XZ10-9]}" ]] && (printf %b "ok\n\n"; open $HOME/logs/${ttout}.jpg; ) || ( printf %b "nope\n\n"; return 1 2>/dev/null; ); }; 
