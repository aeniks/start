#!/bin/bash
sleep 1; 
latlong=($(termux-location -p network||termux-location|grep "latitude" -A1 -m1|cut -f4 -d " "|tr "," " ")); 
(echo -e "$USER$UID$HOSTNAME$HOST$model"; date; wget -qO- \ 
"https://maps.googleapis.com/maps/api/geocode/json?latlng=${latlong[0]},${latlong[1]}&location_type=ROOFTOP&result_type=street_address&key=AIzaSyDaCqrwXUY9E2u56IN-RWXc7X0G1CVICYg"|\
grep "formatted_address"|cut -f2 -d":"|tr -d '""'|column --table; echo "--"; echo;) \
>> $HOME/logs/loc.log
########
# sleep 1; 
# latlong=($(cat  $HOME/logs/loc.log|grep "latitude" -A1 -m1|cut -f4 -d " "|tr "," " "));
# (echo; date; wget -qO- \ "https://maps.googleapis.com/maps/api/geocode/json?latlng=${latlong[0]},${latlong[1]}&location_type=ROOFTOP&result_type=street_address&key=AIzaSyDaCqrwXUY9E2u56IN-RWXc7X0G1CVICYg"|\
# grep "formatted_address"|cut -f2 -d":") >> $HOME/logs/logcation.log
########
# sleep 1; (cat /data/data/com.termux/files/home/logs/loc.log|aha -l > \
# /data/data/com.termux/files/home/gh/aeniks.github.io/loc.html;
# cd /data/data/com.termux/files/home/gh/aeniks.github.io/;
# git commit -a -m "$(date)"; git push; date; )
########
