

torsearch() { printf %b "\n\n\n\n\n\n\e[4A$c2 torrent search:"; read -e -p " " -i "${*}${rtorrent[*]}" "rtorrent";

lynx -dump -listonly "https://thepiratebay10.info/search/${rtorrent[*]}/1/99/0" -width=9999 -nonumbers|grep -e "magnet" -B1|command less --raw-control-chars --pattern="--" --use-color



#links2 "https://thepiratebay10.info/search/${rtorrent[*]}/1/99/0";


};
