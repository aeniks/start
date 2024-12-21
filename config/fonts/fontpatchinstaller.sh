#!/bin/bash
## font patcher
sudo apt install -y node python3 python3-fontforge fontforge argparse 2>/dev/null; 
npm i devicons -g;
fontforge --script ./fontpatcher/font-patcher  ./fontpatcher/HackNerdFontMono-Regular.ttf 
fontforge --script ./fontpatcher/font-patcher  /usr/share/fonts/truetype/liberation/LiberationMono-Regular.ttf
