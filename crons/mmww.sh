#!/bin/env bash 
time="$(date +%Y_%B_%d)"; 
w3m -dump  https://www.merriam-webster.com/word-of-the-day|head -n66|grep ":" -m1 -A22|tr -s "\n\t" "\n." |sed -e /play/d -e /Prev\ Next/d -e /What\ It\ Means/d -e "/Context.*/d"|sed -e "s/\: / printf -v da\ '\n/g" -e 1a"';\n\n printf -v w '" -e "2a';\n\n printf -v meaning '" -e 4c"'; \n\n printf -v def '" -e "/\/\//i\'\; \\ \\ \n"|head -n-4|tr -d "\n" > $HOME/logs/mmww${time}.log; cp $HOME/logs/mmww${time}.log $HOME/logs/mmww.log; 
