#!/bin/bash
##
neighbours() {
test "$PREFIX"&& local alias sudo='command'; 
test -e $PREFIX/bin/nmap||sudo apt install nmap -qy; 
#sudo nmap ${iploc%.*}.0-222 -Ap 8022,22; 
echo;echo; 
sudo nmap -Ap 22,8022  ${iploc%.*}.0-255|\
grep "PORT" -C4|\
grep -iv "Service detection"|\
grep -iv "Host"|\
grep -iv "Starting"|\
sed s/Nmap.scan.report.for/\\n/g|batcat -ppflzig; 
}








