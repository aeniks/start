
wordd() { lynx  "http://www.thefreedictionary.com/_/WoD/rss.aspx" -dump -width 800   -force_empty_hrefless_a|tr "<>/" "\n"|grep -e "Definition"|cut -f2 -d" " --complement > ~/logs/words/dd$EPOCHSECONDS.log; }; 
