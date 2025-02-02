mac() {
mac="$(ip -c l|grep -w "link/ether "|cut -f6-6 -d " ";)"; 
echo -e "${mac}";
}
