#!/data/data/com.termux/files/usr/bin/bash
(cp /data/data/com.termux/files/home/logs/nloc.log \
/data/data/com.termux/files/home/gh/aeniks.github.io/loc.html --update; 
cd /data/data/com.termux/files/home/gh/aeniks.github.io/; 
git commit -a -m "$(date)"; git push; date; )
