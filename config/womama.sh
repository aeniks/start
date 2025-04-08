
w3m -dump  https://www.merriam-webster.com/word-of-the-day|head -n66|grep ":" -m1 -A22|tr -s "\n\t" "\n." |sed -e /play/d -e /Prev\ Next/d -e /What\ It\ Means/d -e "/Context.*/d"|sed -e "s/\: /da\=\(/g" -e 1a");\n\nw=(" -e "2a); \n\nmeaning=(" -e 4c"); \n\ndef=(" -e "/\/\//i\)\; \\ \\ \n"|head -n-4|tr -s " \n" "\n "
