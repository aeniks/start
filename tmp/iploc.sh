iploc=($(ip --brief a show scope global|tail -c+29|tr -s " " "\n"|cut -f1 -d"/"; )); 
