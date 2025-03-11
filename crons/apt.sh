#/bin/bash
[ -z "$PREFIX" ]&& sudo='sudo'; $sudo apt update 2>/dev/null|tail -n1> ~/._aptup.nfo; 
