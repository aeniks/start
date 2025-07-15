#!/bin/bash
# IFS=$'\n\t'; 
clear; 
foff="${HOME}/fofo"; 
##
seq 12 > ${foff}/ff.log; 
##
while [ "$(cat ${foff}/ff.log | wc --lines)" -gt "4" ]; do fortune > ${foff}/ff.log; done; 
##
fofo=($(cat ${foff}/ff.log)); 
##
mv ${foff}/fofo.jpg \
${foff}/ff_$(date +%y%m%d_%H%M%S).jpg; 
##
convert -size 2000x2000 \
pango:"<span size='56000'>$(cat ${foff}/ff.log|fmt -w 40|gum style --padding 4 --margin 4|sed s/\\n/\\n\\n/g|tr "\t" "\n")</span>" ${foff}/fofo.jpg; 
