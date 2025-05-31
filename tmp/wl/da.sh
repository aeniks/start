
ll=shelf; dict -d trans $ll --raw|grep $ll -m1; dict -d wn $ll --raw|grep -e '1: ' -A1
