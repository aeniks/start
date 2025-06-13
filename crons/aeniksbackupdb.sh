ssh aa@192.168.0.14 "cd ~/bb; sudo -u aeniks -i wp db export --path=/home/aeniks/htdocs/www /home/aeniks/bb/ae$EPOCHSECONDS.sql" && rsync aa@192.168.0.14:/home/aeniks/bb ./ -avP; 
