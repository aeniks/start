oiwo() {
#!/bin/bash 
oiwo_fold="$HOME/oioi";
oiwo_file="$HOME/oioi/files/wo";
oiwo_form="$HOME/oioi/files/wo_$(date +%F_%H%M%S)";
[ -e $HOME/oioi/files ]||mkdir $HOME/oioi/files;
[ -e $HOME/oioi/img ]||mkdir $HOME/oioi/img; 
command lynx -dump "https://www.dictionary.com/e/word-of-the-day" | \
grep -m 1 -e "Learn More" -B12 > ${oiwo_form}.log; 
chmod 775 ${oiwo_form}.log; local IFS=$'\n';
oiwo=($(sed -e s/Show.*//g -e s/\.\ .// -e /*/d -e s/[][]\ /\\n/g -e 1,4c\\ ${oiwo_form}.log)); 
printf %b "${oiwo[*]:1}" > ${oiwo_file}_${oiwo[1]}.log; 
##
##
oics=(black palevioletred pink lightpink snow rosybrown lightcoral crimson indianred mistyrose brown salmon firebrick maroon tomato darkred red darksalmon orangered coral lightsalmon sienna chocolate saddlebrown sandybrown darkorange seashell peru peachpuff orange linen burlywood bisque tan antiquewhite navajowhite darkgoldenrod blanchedalmond goldenrod moccasin papayawhip wheat oldlace floralwhite gold cornsilk khaki darkkhaki olive yellow palegoldenrod lemonchiffon lightgoldenrodyellow lightyellow beige ivory olivedrab yellowgreen darkolivegreen greenyellow chartreuse lawngreen darkgreen green lime limegreen forestgreen palegreen lightgreen darkseagreen honeydew springgreen seagreen mediumseagreen mediumspringgreen mintcream mediumaquamarine aquamarine turquoise lightseagreen mediumturquoise aqua darkcyan teal darkslategray paleturquoise darkturquoise lightcyan azure cadetblue powderblue lightblue skyblue deepskyblue lightskyblue aliceblue slategray lightslategray steelblue lightsteelblue dodgerblue cornflowerblue ghostwhite lavender royalblue darkgray dimgray gainsboro gray lightgray silver white whitesmoke darkslateblue slateblue mediumslateblue midnightblue blue darkblue mediumblue navy mediumpurple rebeccapurple blueviolet indigo darkorchid darkviolet mediumorchid thistle plum violet orchid darkmagenta fuchsia purple mediumvioletred hotpink lavenderblush deeppink); 
##
##
oicolor1="$(shuf -en1 ${oics[*]})"
oicolor2="$(shuf -en1 ${oics[*]})"
##
##
convert \
-size 1000x1000 \
-background white \
-gravity center \
pango:"\
<tt>
<span size='12000' color='darkslategray'><b>\n\n\n\n\n\n\n\n\
$(figlet -W -f Roman "${oiwo[0]}")\n</b></span>\n\
<span size='22000' color='slategray'>(${oiwo[3]})</span>\n\
<span size='22000' color='darkgray'>\
<b>[</b>$(printf %b "${oiwo[2]}"|tr -d " ")<b>]</b>\n</span>\
<span size='22000' color='lightgray'>\
·····················
</span>\
<span size='22000' color='darkslategray'>\
$(printf %b "${oiwo[4]}"|fmt -w 22)\n\n\
</span>\
</tt>" \
${oiwo_fold}/img/oi_${oiwo}.jpg; 
##
##
printf %b "\n\
${oiwo[0]}\n\n\
${oiwo[3]}\n\
[${oiwo[2]}]\n\
${oiwo[4]}\n\n\
${oiwo[5]}\n\n\
${oicolor}\n"; 
# ${oiwo[1]}\n\
# | \
# grep -v ']' | \
# tr -s "\n" " " | \
# column --output-separator ' > ' --table --table-columns-limit 3 --output-width 88 > $oiwo_file;
# oiwo=($(sed -e s/Show.*//g -e s/\.\ .// -e /*/d ${oiwo_form}.log));
# cat $oiwo_file;
# fi; 
}; 
oiwo; 
