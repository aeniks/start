#!/bin/bash
## font patcher
sudo apt install -y node python3 python3-fontforge fontforge argparse 2>/dev/null; 
# nodejs python 
npm i devicons -g;
fontforge --script $start/config/fonts/fontpatcher/font-patcher  ./fontpatcher/hack.ttf 
fontforge --script $start/config/fonts/fontpatcher/font-patcher  /usr/share/fonts/truetype/liberation/LiberationMono-Regular.ttf
