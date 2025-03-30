#!/bin/bash 
## Authenticates github
12gh_auth() { 
hash sudo 2>/dev/null && sudo="sudo"; 
printf "\e[0m\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\e[22A"; 
$sudo apt install -y gpg git gh &>/dev/null; c2='\e[0m\e[36m--\e[0m'; 
ghuser="$(id -nu)"; ghmail="$(id -nu)@$(hostname)"; 
gh_aeniks="$start/config/gpg/gh_aeniks.gpg"; 
[ -e != "$start/config/gpg/gh_aeniks.gpg" ] && \
printf %b "\nwhere is key?: \n" && read -ei "$gh_aeniks" "gh_aeniks"
####
gpg --pinentry-mode loopback -o "gh.txt" -d "$gh_aeniks"; 
gh auth login --with-token < "gh.txt"; printf "$c2 "; rm gh.txt; sleep .2;
gh auth status && printf "\n\n     \e[42m       OK      \e[0m\n\n"; sleep 2; echo;echo;echo; 
gh config set git_protocol ssh; 
git config --global user.name $ghuser; 
git config --global user.email $ghmail; 
git config --global init.defaultBranch main; 
printf %b "\nHost *\nForwardAgent yes\n" >> $HOME/.ssh/config;
gh ssh-key add echo $HOME/.ssh/*.pub; 
exec bash; ssh -T git@github.com; printf "\n\n ok\n\n"; 
# printf "$c2 also make gh user agent? [Y/n]"; read -n1 -rep " " "yn"; [ "$yn" ]&&return; 
# printf "\n$c2 gh username:"; 
# read -rep " " -i "$ghuser" "ghuser"; 
# printf "$c2 gh user mail:"; read -rep " " -i "$ghuser@" "ghmail"; 
##
# printf "$c2 new gh key?; "; read; 
# [ "$(id -u)" -eq 0 ]&& (echo "cant be root"; read );
# printf "$c2 gh email/login:"; read -rep " " -i "$ghmail" "ghmail";
# printf "$c2 name for key:"; read -rep " " -i "$(hostname)" "githubs";
# ssh-keygen -C $ghmail;
# chmod 600 ~/.ssh/$githubs ~/.ssh/config; 
# eval "$(ssh-agent -s)"; 
# ssh-add ~/.ssh/$githubs;
# gh ssh-key add id_ed25519.pub --type authentication --title $githubs;
# hash sudo 2>/dev/null||alias sudo=' '; 
# sudo systemctl restart ssh;
} 
