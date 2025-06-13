ssh aa@192.168.0.14 "mariadb-dump -u aaaa --password="oioioioi" aeae > /home/aa/bb/aeae$(date +%y%m%d%H%M%S).sql" && rsync aa@192.168.0.14:./bb ~/ -a; 
