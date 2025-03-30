
iploc="$(ip -4 -brief address show scope global|tail -c24|cut -f1 -d"/"|tr -d " ": )"; 
