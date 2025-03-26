#!/data/data/com.termux/files/usr/bin/bash
latlong=($((termux-location -p network||termux-location)|grep "latitude" -A1 -m1|cut -f4 -d " "|tr "," " ")) && (echo; date; echo "--"; wget -qLO- \
"https://maps.googleapis.com/maps/api/geocode/json?latlng=${latlong[0]},${latlong[1]}&location_type=ROOFTOP&result_type=street_address&key=AIzaSyDaCqrwXUY9E2u56IN-RWXc7X0G1CVICYg"|\
grep "formatted_address"|cut -f2 -d":"|tr -d '""'|column --table; echo "--"; echo;)
