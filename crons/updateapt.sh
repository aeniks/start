#!/bin/bash
[ "$PREFIX" ]&& alias sudo=' '; sudo apt update 2>/dev/null|tail -n1|cut -f 1 -d "."|tr -d "\n" > $HOME/..uptadeapts.nfo && printf  "[96m @[0m $(date)[0m" >> ..uptadeapts.nfo ; 

