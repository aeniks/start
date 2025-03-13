#!/data/data/com.termux/files/usr/bin/bash
(cat /data/data/com.termux/files/home/logs/nloc.log|aha -l > \
/data/data/com.termux/files/home/gh/aeniks.github.io/loc.html; 
cd /data/data/com.termux/files/home/gh/aeniks.github.io/; 
git commit -a -m "$(date)"; git push; date; )
