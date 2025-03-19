mac() {
mac="$(ip -c l|grep -w "link/ether "|head -n1|cut -f6-6 -d " ";)"; 
echo -e "${mac}";
}
