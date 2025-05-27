# for i in $HOME/crons/*; do sleep 8 && . $i; done; 
while true; do sleep 60; date +%X >> $HOME/logs/time.sh; done; 
