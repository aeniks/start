latlong=($(cat  $HOME/logs/loc.log|grep "latitude" -A1 -m1|cut -f4 -d " "|tr "," " "));
(echo; date; wget -qO- \
"https://maps.googleapis.com/maps/api/geocode/json?latlng=${latlong[0]},${latlong[1]}&location_type=ROOFTOP&result_type=street_address&key=AIzaSyDaCqrwXUY9E2u56IN-RWXc7X0G1CVICYg"|\
grep "formatted_address"|cut -f2 -d":") >> $HOME/logs/logcation.log
