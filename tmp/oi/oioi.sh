
##
##
oicolors=(lightslategray steelblue lightsteelblue dodgerblue cornflowerblue ghostwhite lavender royalblue darkgray dimgray gainsboro gray lightgray silver white whitesmoke darkslateblue slateblue mediumslateblue midnightblue blue darkblue mediumblue navy mediumpurple rebeccapurple blueviolet indigo darkorchid darkviolet mediumorchid thistle plum violet orchid darkmagenta fuchsia purple mediumvioletred hotpink lavenderblush deeppink); 
##
##
oicolor="$(shuf -en1 ${oicolors[*]})"; 
##
##
#Do nothing unless you must, and when you must act -- hesitate.
oioi=($(fortune -s)); 
oif="/home/aa/oi"; 
oi="${EPOCHSECONDS}"; 
##
##
convert -size 2000x2000 -background ${oicolor} -gravity center \
pango:'<tt><span size="80000">\n\n\n\n'"'${oioi[*]}'"'\n\n${oicolor}</span></tt>' ${oif}/img/${oi}.jpg; 
##
##
