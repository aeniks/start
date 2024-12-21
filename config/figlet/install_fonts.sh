#!/bin/bash
## cp fonts - fig
read -rep "copy font-files from: " -i "$ants/sh/config/figlet/fonts" "from";
read -rep "to: " -i "$PREFIX/usr/share/figlet" "to";
cp ${from}/* ${to}/||sudo cp ${from}/* ${to}/
