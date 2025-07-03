
12ports-local() { 
# for i in {1..12}; do echo; sleep .02; done;  for i in {1..12}; do printf %b "\e[A"; sleep .02; done; 

printf %b "\n\e[2mscanning ..."; printf %b " \n\e[0;1;96mlocalhost\e[0m:\e[95m8000-9999\e[m \n\n"; 
nmap localhost -p 8000-9999 -q --open|grep -e 'open' --line-buffered 2>/dev/null|bat -ppfld|cut -f1 -d"/"; printf %b "\n\n"; 
}; 
