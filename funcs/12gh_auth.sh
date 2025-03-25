#!/bin/bash 
## Authenticates github
12gh_auth() { 
printf "\e[0m\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\e[22A"; 
sudo apt install gpg git gh -qqy 2>/dev/null; 
c2='\e[0m\e[36m--\e[0m'; 
# printf "\n\n$c2 ants folder:"; read -rep " " -i "$ants" "ants"; 
gpg --pinentry-mode loopback -o "gh.txt" -d "$HOME/start/config/gpg/gh_aeniks.gpg";
gh auth login --with-token < "gh.txt"; printf "$c2 "; rm gh.txt;sleep .2;
gh auth status&& printf "\n\n     \e[42m       OK      \e[0m\n\n"; sleep 2; echo;echo;echo; 
printf "$c2 also make gh user agent? [Y/n]"; read -n1 -rep " " "yn";
[ "$yn" ]&&return; 
printf "$c2 gh username:"; 
read -rep " " -i "$(hostname)" "ghuser"; 
git config --global user.name $ghuser; 
printf "$c2 gh user mail:"; read -rep " " -i "$ghuser@" "ghmail"; 
git config --global user.email $ghuser; 
git config --global init.defaultBranch main; 
##
printf "$c2 new gh key?; "; read; 
[ "$(id -u)" -eq 0 ]&& (echo "cant be root"; read );
printf "$c2 gh email/login:"; read -rep " " -i "$ghmail" "ghmail";
printf "$c2 name for key:"; read -rep " " -i "$(hostname)" "githubs";
echo 'Host *
ForwardAgent yes
' >> ~/.ssh/config;
ssh-keygen -C $ghmail;
chmod 600 ~/.ssh/$githubs ~/.ssh/config; 
eval "$(ssh-agent -s)"; 
ssh-add ~/.ssh/$githubs;
gh ssh-key add id_ed25519.pub --type authentication --title $githubs;
sudo systemctl restart ssh;
ssh -T git@github.com;
printf "\n\n ok\n\n";
} 
