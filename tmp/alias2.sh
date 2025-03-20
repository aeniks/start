alias kk='tee -a|batcat -pf $(tmux set-option mouse off; ) --pager="less --use-color --file-size --incsearc -srR --prompt="\"" [/]search [n]ext-match [N]prev-match  %lt-%lb/%L  %pB\%  [%T]"\"" "; tmux set-option mouse on; '; 
#!/bin/bash

#alias kk='tee -a|batcat -pf $(tmux set-option mouse off; ) \
#" alias for bash terminal
############# _COLORS ##########
# e='echo -e '; 
# bold=$($e'\e[1m';); dim=$($e'\e[2m';); italic=$($e'\e[3m';); 
# underline=$($e'\e[44m';); blink=$($e'\e[45m';); rev=$($e'\e[47m';); invis=$($e'\e[8m';); 
# strike=$($e'\e[9m';); blank=$($e'\e[0;30m';); red=$($e'\e[0;31m';); green=$($e'\e[0;32m';); 
# yellow=$($e'\e[0;33m';); blue=$($e'\e[0;34m';); pink=$($e'\e[0;35m';); cyan=$($e'\e[0;36m';); 
# white=$($e'\e[0;37m';); re=$($e'\e[0m';); c2=$($e'\e[36m --\e[0m';); 
################################
alias sshknown='cat $HOME/.ssh/known_hosts|cut -f1 -d" "|tr -d "[]"|uniq'
alias speed='speedtest --bytes --no-upload 2>/dev/null; ||speedtest-cli 2>/dev/null; '
alias ipme='wget icanhazip.com -qLO-'
alias ipme4='curl icanhazip.com -s4'
alias sshh='[ "${TMUX}" ]&& tt="-tmux -h"; \
ssh aa@$(cat $HOME/.ssh/known_hosts|cut -f1 -d" "|\
tr -d "[]"|uniq|fzf$tt --height "~42%")'
alias tt='[ "${TMUX}" ]||tmux; [ "$TMUX" ] && tmux display-menu \
" split - V " v "split-window -v" \
" split | H " h "split-window -h" \
" open " o "display-popup gotop||btop||gotop||htop||top" \
" serch " s "display-popup lsd|fzf"';
####
####
alias kat='batcat -pfld'; 

alias aptss='for i in ${apts[*]}; do printf "\n______${cyan}${i^^}${re}______ \n"; apt show ${i} 2>/dev/null|grep -e "Description" -A12; done|batcat -p'
# alias ttmenu='
# [ "$TMUX" ] && tmux display-menu \
# " split - V " v "split-window -v" \
# " split | H " h "split-window -h" \
# " open " o "display-popup gotop||btop||gotop||htop||top" \
# " serch " s "display-popup lsd|fzf"' 
# [ "$TMUX_PANE" = "%0" ]&& (sleep 2; ttmenu)& disown; 
alias mm='micro'
alias qq='cd ..; ll';
alias ee='echo ';
alias ll='lsd -l --extensionsort --group-directories-first -tr'
alias la='lsd --extensionsort --group-directories-first -Altr'
alias psp='tput indn 12 cuu 8;'
alias 12info_ansi='batcat -pfl d $HOME/start/info/ansii.md'
alias gpg='gpg --pinentry loopback'; 
note() {
echo -e "\n\n -- syncing...\n\n"; 
gh gist edit 4b5c805719fe0855a10f9d4fbdd197e1||\
gh gist edit 4b5c805719fe0855a10f9d4fbdd197e1||\
(read -n1 -rep "-- login with token? [Y/n] " "yn"; [ "$yn" ]&& return; 
printf "\n\n$c2 ants folder:"; read -rep " " -i "$ants" "ants"; 
gpg --pinentry-mode loopback -o "~/gh.txt" -d "$ants/sh/config/gh_aeniks.gpg"; 
gh auth login --with-token < "~/gh.txt"; printf "$c2 "; rm ~/gh.txt;
gh auth status&& printf "\n\n\e[42m OK \e[0m\n\n"; 
printf "\n  try again \n\n"; )
}
# alias os_info='cat /etc/os-release|grep -v "URL"|batcat -ppfl c||getprop system.productname|kat; printf "\n$HOSTNAME : $HOSTTYPE : $MACHTYPE : $OS_TYPE\n\n"; '
# getprop ro.

# less (){
# 
# }
alias ss='ssss -l'
alias iiii='$EDITOR $HOME/start/config/inputrc; echo gg; exec $0'
#alias sl='ssh aaaa@ants.ftp.sh'; 
###############################
# alias 12='menu $ants/12'
# alias qqqq='cd $ants/sh/q;'
###############################
# alias m11='ssh -p 8022 192.168.0.105||(read -rep "$c2 open findmydevice? [Y/n] " "gf"||open https://www.google.com/android/find/;)'
# alias 1111='kdeconnect-cli -d "fb1c649a_3a0c_4297_ae12_b0cf5cb558b8" --ring||open https://www.google.com/android/find/;'
# alias 11='ssh -p 8022 u0_a428@192.168.0.105 "termux-media-player play ~/music/money.mp3"||ping 192.168.0.105 -c5||nmap 192.168.0.105 -sL -W1||nmap 192.168.0.105 -sn -W1 &&
# ssh -p 8022 u0_a428@192.168.0.105 "termux-media-player play ~/music/money.mp3"'; 
alias pp='printf'
alias sl='ssh aa@ants.ftp.sh'
alias sl_send='
printf "\n\n\n\n\n\n\e[4A
 -- send: "; 

read -rep " " "slsend"
read -rep " " "slto"

ssh "aa@ants.ftp.sh"; 
'
##alias sl='sshs="aa@ants.ftp.sh"; read -rep "-- ssh: " -i "${sshs}" "sshs"; ssh ${sshs}; '
# alias hhhh='batcat -pfl sh ~/.bash_history' 
###############################
# info() { (printf "\ninfo $@\n\n"; whatis $@; echo; whereis $@; command info $@)|batcat -ppf||man $@; }
# man() { man $@|batcat -ppf||whatis $@; help $@; } 
# help() { printf "$cyan ------ $green$1 $red$2 $blue$3 $green$4 $re \n"; command help $@|batcat -ppfld||apropos $@; }   
#### wrangler stuff ###########
alias wrangler_server='wrangler pages dev ./||npm i -g wrangler'
alias wrangler_deploy='wrangler pages deploy ./ \
--commit-dirty=true --project-name="${PWD##*/}"'
alias wrangler_list='wrangler pages project list'
alias deploy='wrangler pages deploy ./ \
--commit-dirty=true --project-name="${PWD##*/}"'
###############################
###############################
# apt() { apt $@||(printf "\n\n\e[1;32m  Going no sudo! \e[0m\n\n"; sudo apt $@;)  }
###############################
# cd() { builtin cd "$@" && lsd --hyperlink always -htr --color=always --group-directories-first||ls -pltcr; echo -e '\e[36m'; pwd; }
############################
######## LF ################
# LFRC="$ants/sh/config/lf/lfrc"; 
qe() { 
type $@; whatis $@; 
apt show $@ 2>/dev/null|grep -wi "description" -A12; type
} 

alias l='cd $(lf -config ~/.config/lf/lfrc -print-last-dir)'; 
#############################
alias infobash='batcat -pf "$ants/sh/info/cmd.sh"'
# alias o='/home/aa/go/bin/o'
alias kkkk='sudo batcat -Ppfl c --line-range 1:88
 "/home/aa/.local/share/klipper/history2.lst"'
###############################
################ _functions
alias sl_cc='ssh cc@192.168.0.105'
alias key-bindings='batcat $ants/sh/info/emacs.sh -p'
alias sizec='sizec="$(stty size|cut -f2 -d" ")"; printf "$sizec"'
alias sizel='sizel="$(stty size|cut -f1 -d" ")"; printf "$sizel"'
alias nvm_init='export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" \
|| printf %s "${XDG_CONFIG_HOME}/nvm")"; [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"; ';
# export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'  
###############################
###############################
alias 12local_portscan='nmap localhost|batcat -pP --language c++; 
printf %b "\n\nuse ss to do more\n\n"; '
# alias lan_neighbours='sudo nmap 192.168.0.1 192.168.0.100-122 -sn &>>/tmp/x; sudo nmap 192.168.0.1 192.168.0.100-122 -sL &>>/tmp/x; sudo ip -c n|grep -v "FAILED"'
# alias 12_it_portscan='portscan'
# alias 12_it_neighbours='neighbours'
# klockan="$ants/12/klockan.sh"
###############################
###############################
# quotes() {
# bath=($(batcat --list-themes|cut -f1 -d:|tr ' ' '_')); 
# batl=($(batcat --list-languages|grep ','|tr "," "\n"|grep -v "*"|cut -f2 -d ":"));
# batn=$(shuf -en1 ${batl[@]}); 
# bathb=$(shuf -en1 ${bath[@]});
# echo -e "\n  --------------------\n$dim  -- $cyan$dim${batn}$re
# $dim  -- $pink$dim${bathb}$re \e[0m\n  --------------------\n"; 
# fortune|batcat --style numbers --theme "${bathb//_/ }" --language ${batn};
# } 
# alias rrrrch='$EDITOR $ants/functions/rrrr.sh'; 
alias quotes='fortune $s|tr -s "\t" " "'


# kl() {
# batlist=($(batcat --list-languages|grep ','|grep -v " "|tr "," "\n"|cut -f2 -d ":"));
# batn=$(shuf -e -n1 ${batlist[@]})
# printf "$cyan${batn}$re\n"; 
# date +%A|figlet -f $(shuf -e $HOME/ff.sh)|batcat -ppfl $batn; echo; 
# }
################################
# hhhhhh() {
# linesh=222; 
# [ -n "${1} "]&& linesh="${1}";
# tail ~/.bash_history -n${linesh}|batcat -ppl c;
# }
# alias kk='batcat -ppf $(tmux set-option mouse off; )|\
# less --use-color --file-size --incsearc -FE -rR --prompt="[/]search [n]ext-match [N]prev-match ?f%f .?n?m(%T %i of %m) ..?lt %lt-%lb?L/%L. :byte  %bB?s/%s.  .?e(END)  ?x-  Next\:   %x.:?pB  %pB\%..%t [%T] "; tmux set-option mouse on; '
# alias kat='batcat -pfld'
# kat() {
# unset -v kat; 
# if [ "${1}" = "help" ] 2>/dev/null; then 
# batcat -h|batcat -fp --language d;
# return 0; fi; 
# [ $2 ]&& lng="${2}"; [ $2 ]|| lng="sh"; 
# [ $1 ] 2>/dev/null||ls -p --color --group-directories-first --hyperlink; 
# [ $1 ] 2>/dev/null||read -rep "$c2 katfile: " -i "$PWD/" kat;
# [ $2 ]&& batcat -Ppf $kat  $1 --language $lng||batcat -Ppf $kat $1;
# 
# }
alias ipip='echo;echo -ne "$c2$c2 "; hostname; echo -ne "$c2$c2 "; id; echo -e "\n$c2 IPS$c2\n$(timeout 2 hostname --all-fqdn; timeout 1 hostname -I;) \n\n$c2 PUBLIC IPS$c2 "; timeout 2 curl ip.me; timeout 2 curl ip.me -4; echo -e "\n$c2 ROUTES$c2"; ip -c r; echo -e "\n$c2 ADRESSES$c2"; ip -c a; echo -e "\n$c2 NEIGHBOURS$c2"; ip -c n; ' 
alias fill='hash lolcat && seq -s " " 2222';
alias 12_nuke_ants='
read -rep "$c2$red nuke$re old ant-folder: " -i "$ants" "ok"; 
read -rep "$c2$red nuke$re new ant-folder: " -i "$ants" "nk"; 
read "$nk${cyan} ok${re}? " "okok" 2>/dev/null;
sudo rm $ok -R;  git clone https://github.com/aeniks/ants /tmp/ants; 
sudo mv /tmp/ants $nk 2>/dev/null; cd $nk/ants; exec bash;'
alias 12make_admin='
if [ -e != /etc/sudoers.d/admins ]; 
then sudo touch /etc/sudoers.d/admins; fi; 
sudo chmod 775 /etc/sudoers.d/admins && 
read -rep " $c2 Add as admin-user: " "newsudo" && sudo echo -e "
$newsudo ALL=(ALL) NOPASSWD:ALL
%"$newsudo" ALL=(ALL) NOPASSWD:ALL \n" >> "/etc/sudoers.d/admins"'

12admins() {
## make new sudo user 
read -rep "$c2 new admin user: " -i "$1" "newsudo"; 
[ -e /etc/sudoers.d/admins ]|| sudo touch /etc/sudoers.d/admins; 
sudo echo -e "\n $newsudo ALL=(ALL) NOPASSWD:ALL
%"$newsudo" ALL=(ALL) NOPASSWD:ALL \n" | tee -a "/etc/sudoers.d/admins"
}
##### << make this a function
mkd() {
psp read -rep "$c2 new folder?$re " -i "$PWD/$1" "folder"; 
mkdir -p $folder -m 775; 
chown "$SUDO_USER":"$USER" "$folder"; 
cd $folder; echo -e "\n\t $cyan$bold> $pink$PWD$cyan <$re\n\t * * * *\n"; ls -caklhuptr --group-directories-first; 
}
alias goto='echo -e "\n\n\n\n"; tput cuu 2; echo -ne "\t $c2 goto: "; read -ep "" -i "$PWD/" "pwd"; cd $pwd; ll; echo; '

#alias apt='sudo apt'
alias gmail='open gmail.com'
alias no='echo -e "\e[?25h"; printf "\e[0m"'
alias 12_info_ansi='batcat -p $ants/sh/info/ansi.md'
alias 12_tard='lo="$(jp2a $ants/media/tard.jpg --chars="_oooo" --term-width)";
echo -e "\e[?25l\e[36m"; for i in $(seq ${#lo}); 
do echo -ne "\e[3$(shuf -en1 2 4 6)m${lo:$i-1:1}"|tr "_o" " ."; done; echo -ne "\e[?25h";'
alias tard='lo="$(jp2a $ants/media/tard.jpg --chars="_oooo" --term-width)";
echo -e "\e[?25l\e[36m"; for i in $(seq ${#lo}); 
do echo -ne "\e[3$(shuf -en1 2 4 6)m${lo:$i-1:1}"|tr "_o" " ."; done; echo -ne "\e[?25h";'
#alias pick='height="$(stty size|head -c3)"; tput indn $((height/4)) cuu $((height/4-2)); gum choose * --no-limit --cursor=" > " --height $((height/2))'
#alias staticants=''
alias figz='figlist=($(figlist|batcat -pp --line-range 4:|head -n-5)); 
nn=; for i in ${figlist[*]}; do printf "\n\n\e[0m --\t\e[7;46m $i\e[0m \e[38;5;$((nn++))m\n\n"; figlet -f "$i" "$i"; done; '; 
alias reloadbash='exec bash'
#alias norm=' echo -e '\e[0m'; tput cnorm 2>/dev/null;' 
alias aa='[ -z "$ants" ]&& (read -rep "antspath: " -i "$PWD" "ants"; echo -e "\nants=${ants} \nexport ants=${ants}" >> ~/.bashrc; exec bash); cd $ants'
alias aaaa="$EDITOR "$ants/alias.sh"; read -ep 'update $ants/alias.sh? '; exec bash;"
alias bbbb="$EDITOR "$ants/bash.sh"; read -ep 'update $ants/bash.sh? '; exec bash;"
# alias cccc="$EDITOR "$ants/functions.sh"; read -ep 'update $ants/functions.sh? '; exec bash;"
alias cccc="crontab -e"
####
alias bgbg='tput cup 0 setab $((RANDOM%222 + 44)); for i in $(seq $((LINES * COLUMNS))); 
do echo -n " "; done; tput cup 0'
#alias 12_fillscreen='seq -s "-" 2222|lolcat -p .8 -s 2'
## $($e'\e[2m') invis $($e'\e[0m') 	## $($e'\e[9m') strike $($e'\e[0m')
## $($e'\e[2m') blank $($e'\e[0m') 	## $($e'\e[31m') red$($e'\e[0m')
## $($e'\e[32m') green $($e'\e[0m') 	## $($e'\e[33m') yellow $($e'\e[0m')
## $($e'\e[34m') blue $($e'\e[0m') 	## $($e'\e[35m') pink $($e'\e[0m')
## $($e'\e[36m') cyan $($e'\e[0m') 	## $($e'\e[37m') white $($e'\e[0m')
## $($e'\e[0m') re $($e'\e[0m') 	## $($e'\e[36m --\e[0m') c2 $($e'\e[0m')'"
#shost="aeniks.mooo.com"; suser="aaaa";
alias 12_serve_folder_with_wrangler='read -n1 -ep  "$c2 serve $PWD/? "; npx wrangler pages dev . 2>/dev/null'
#alias wrangler='npx wrangler pages'
#alias 12_iplocal='ip route; cat ~/iplog; ' 
#alias 12_12_ants_dl_installer='read -ep "$c2 get ants? " ""; wget -O /tmp/in.sh git.new$ants; . /tmp/in.sh;'
#alias lenoo='read -t 8 -rep "$c2 update ants.swe.net to lenoos cmp? " "kndfkd"; curl -k https://freedns.afraid.org/dynamic/update.php?OHJNTjc5SWZsRGZoZm1Nanhtek06MjI1MjY0NTM='
# alias 12_rainbow='echo;echo;echo; tput cuu 2; read -ep "$c2 " "rainbow"; rb "$rainbow";'
# alias 12_fortune="rrf; fortune; tput sgr0;"
alias rr="sudo -s"
# alias 12_edit_etc_besh="$EDITOR /etc/bash.bashrc"
# alias 12_randomword="wotd"
alias zipit='
read -rep "$c2 what to zip: " -i "$PWD"  "zipf"; 
read -rep "$c2 output file: " -i "${zipf}.zip" "zipz";
zip -r "${zipz}" -i "${zipf}"; 
zipinfo -l "${zipz}"; printf "\e[36m"; 
zipinfo -h "${zipz}"; printf "\e[0m"; ' 
##
# alias hiztory='command -v glow||(sudo apt install glow -y &>/dev/null||apt install glow -y&>/dev/null); 
# history -a; echo -e "## $(tty; date;) ## " >> ~/.bash_history; tail -n22 ~/.bash_history|glow; read -rep " $c2 lines: " -i "$lo" "lo"; \
# tail -n${lo} ~/.bash_history|glow; '
alias qq='cd ..; ' 
#alias ww='cd $OLDPWD; '

alias bb="[ "$TMUX" ]&& tm="display-popup"; ${tm} sudo btop --utf-force||gotop||atop||htop||top"
alias emojis='cat $ants/sh/emojis.sh|tr "\n" "\t";';
alias 12_emojis=emojis;
############################################
#### GITHUB ################################
alias 12_write_gist_kk='read -ep ">_ " 'kl'; printf "$kl"|gh gist create -f $(date +%A_%y_%m_%d_%__0k_%M.sh);'
alias kf='guf=$(ls|fzf);echo -e "\n\n\n\n\n"; tput cuu 2; read -ep "$c2 title: $cyan" -i "$(date +%A%y%m%d%0k%M.sh)" "ttll";cat $guf|gh gist create -f $ttll - '
############################################
#### SSH ###################################
############################################
#### ANTS ##################################
#alias ali='tilde /alias.sh && read -t2 -n1 -ep "update /alias.sh? " ab && source /alias.sh'ions.sh'
alias uu='sudo apt update && sudo apt upgrade -y && sudo apt -y autoremove; sudo apt full-upgrade -y && sudo snap refresh 2>/dev/null;  && jp2a $HOME/start/media/tard.jpg|pv --rate-limit=2222 --quiet'
alias rb='sudo wall "gg"; sleep 1; sudo systemctl reboot'
##
alias www='www-browser'
############################################
#### WEATHER ###############################
# vv='curl -sm2 http://wttr.in/sthlm?format=%l:+%c+%f'
alias 12_weather='curl http://wttr.in/stockholm '
alias 12_whtr='tput sc; tput cup 4 $((COLUMNS-28)) el; tput cup 5 $((COLUMNS-28)) el; tput cuf 2; 
curl -sm2 http://wttr.in/sthlm?format=%l:+%c+%t+/+%f++; tput cup 6 $((COLUMNS-28)) el; tput sgr0 rc'
#curl http://wttr.in/Stockholm?format=%l:+%c%t+-+%C++-++Feels+like:+%f++H:+%h; 
############################################
## MISC_STUFF ##############################
alias 12_fill='seq -s " # " 4444|lolcat'
alias 12_info_tput='less /sh/info/tputhelp.txt'
alias coolors='printf "\e[38;5;211m [code] m >> \n\n"; 
for i in $(seq --equal-width 255); do 
printf "\e[48;5;${i}m ${i} \e[7m\e[30m ${i} \e[0m"; done; ' 
alias pathh='read -rep "  --  " -i "$PATH" "PATH"; export $PATH  ';

############################################
## RANDOM_STUFF ############################
# export rnd1="(($RANDOM%99))"
# alias rnd1="(shuf 0-222 -n1)"
#alias rr1='(echo $SRANDOM|tail -c2)'
#alias rr2='(echo $RANDOM|tail -c2)'
#alias rrf='tput setaf $(rr1)'
#alias rrb='tput setab $(rr2)'
############################################
#### IP_STUFF ##############################
############################################
############################################
# alias hhhhhh='
# printf "\e[0m\e[A\e[K\e[7m ------- \n $HISTFILE $re"; 
# kk=($(tac $HISTFILE|fzf -m --no-sort --height ~62%)); printf "\n$dim --$re variable${dim} = ${re}kk\n$dim --$re SELECTED$dim --$re   \n${kk[@]}$re\n"; 
# printf "\n -- save ${kk[@]} ? [Y/n] "; read -sren1 yno; [ -z "${yno}" ]&& read -rep "to:" -i "$PWD/" kkll&& echo "${kk[@]}" >> $kkll;
# printf " -- run $kk ? [Y/n] "; read -sren1 yno; [ -z "${yno}" ]&& ${kk};
# printf "gg"; 
# '
# alias hh='printf "\e[A\e[0K \e[7m--\e[0m\n\n"; tac $HISTFILE|fzf -m --no-sort --height ~62% --header " -- $ss --"|tee -a ~/histcmd.sh'

alias search_history='printf "\e[0m\e[A\e[K\e[7m ---- $HISTFILE ---- $re\n"; \
hm="$(tac $HISTFILE|fzf -m --no-sort --height ~66% --inline-info --expect q --hscroll --no-literal)"; \
printf "$cyan ---- $re\n";  \
[ "$hm" = "q" ] && printf "\n\noq\n\n"; \
if [ "$hm" ]; then echo "\${hm[@]} -- $hm"; printf "$cyan ----$re\n[_] break \n[1] write to file \n[2] run command  \n";\ 
read -sren1 "run"; \
if [ -z "$run" ]; then printf "hm$cyan --$re $hm\n\n"; break 2>/dev/null; fi; \
if [ "$run"  = 1 ]; then printf "\n${hm}\n -- write to: "; \
read -rep " " -i "$PWD/" "ht"; ht=${ht/ /}; printf "\n${hm}\n" >> "${ht}"; fi; \
if [ "$run"  = 2 ]; then $hm; fi; history -s "$hm"; else printf "\nnothing new....\n"; fi ' 



# alias hh='search_history'
# alias searcl='printf "\e[0m\e[A\e[K\n\n\n\n\e[4A\e[7m -------- ${re} search folder: "; read -re  -i "$PWD" "ss"; kk=($(ls $ss|fzf -m --height ~44% --header " -- $ss --")); printf "\n$dim --$re variable${dim} =${re}kk\n$dim --$re SELECTED$dim --$re   \n\n${kk[*]}\n" '; 

cmdss() { 
kk=($(cat $ants/sh/cmds.sh|fzf -m --height ~44% --header '[TAB] - choose  ||  [ENTER] = confirm')); printf "\n$dim --$re variable${dim}${re}kk\n$dim ------$re   \n\n${kk[*]}\n"; }; 
alias ff='timeout .2 fastfetch & disown||neofetch||hostnamectl||id'
alias serch='
info=" -- [TAB]_mark choice(s)     -- [ENTER]_confirm     -- [C-q] quit "
printf "\e[0m\e[A\e[2K\n\n\n\n\e[4A\e[7m -------- ${re} search folder: "; 
kk=($(ls --group-directories-first -tp $ss|fzf --inline-info --preview "file -ibs {}" --preview-window noborder --tac -m --height ~42% --header "$PWD $info")); 
printf "${kk[*]}\n"; filist=($(for i in ${kk[*]}; do realpath $i; done));
printf " ----\n${filist[*]}\n ----\nvar=\${filist[@]} " '; 


#alias fakta='neofetch 2>/dev/null '

export www_display='google-chrome'
export www_cli='links2'
c2="$(printf "\e[36--\e[0m";)"; 
alias calw='gcalcli calw --monday --military --locale=sv_SE.UTF-8'
alias agenda='gcalcli agendaq --military --locale=sv_SE.UTF-8'
# alias zz="ranger 2>/dev/null" 
#alias pp='echo ____pinging_moto8____; for i in {1..18}; do sleep 1; 
#kdeconnect-cli -n "moto g(8)" --ping-msg "  >_<  "; sleep 1; done'
# echo; read -ep "to: " -i "$PWD/" "folder"; mkdir -p $folder -m 775 2>/dev/null; 
alias git_clone='echo; read -rep " -- clone a repo to dir: " -i "$HOME/gh/" "ghhome"; mkdir -pm 765 $ghhome; cd $ghhome; pwd; read -rep " -- gh - user: " -i "aeniks" "ghcloneuser"; [ -z "/bin/gh" ]||gh repo list $ghcloneuser; read -rep " -- gh - repo" "ghclonerepo"; git clone https://github.com/${ghcloneuser}/${ghclonerepo}'; 
alias github_clone_aeniks='read -rep "git to CLONE: https://github.com/aeniks/" -i "" "clone"; 
git clone https://github.com/aeniks/$clone; cd $clone; '
# alias ww='ee;ee "$cyan";w;ee;ee "$blue"; ps all;ee "$re $PWD"'
alias 12_last_logins='echo;echo "  LAST LOGINS"; echo -e "$pink"; sudo lastb -axdwn 4;echo -e "$white"; echo "       = = = = = = == ";echo; sudo last -wxdFan4;echo;landscape-sysinfo; echo;echo "    = = = = = =   ";echo'
alias 12_choose_logins_screen='read -n1 -ep "  $c2  g/t  $(systemctl get-default)  " "gt"; if [ $gt == t ]; then sudo systemctl set-default multi-user.target; else sudo systemctl set-default graphical.target; fi ; echo gg'
alias xx='startx'
alias g_t='12_choose_logins_screen' 
#alias an12='bash <(wget -O- dub.sh12)'
#alias aeniks='wget -Ok dub.sh/aeniks; . k;'
alias greet='echo -ne "\t$c2 Welcome back $blue $USER,$re today is:$blue "; date; echo'
####
alias uuuu='cd /uuuu; echo; pwd|pr --omit-header --indent=4|\
lolcat -p 2; echo;  echo -e "$cyan$dim --------$re"; ls -Alhkct; echo -e "$cyan$dim --------$re \n"'
if [ -x /usr/games/cowsay ]; then cows=($(ls /usr/share/cowsay/cows|sed s/.cow//g)); fi; 
alias 12_quote="/usr/games/fortune"
alias push='git add --all; git commit --all -m $(date +%F_%H_%M); git push'
alias pull='git pull'
alias yno='read -n1 -p "$re$c2$dim ["$re$bold"Y$dim/"$re$bold"n$dim]$re " "yn"; if [ "$yn" == "${yn#[Nn]}" ]; then echo yes; fi;'
alias cm2'=cat $ants/sh/cmd.sh'
# alias yno='read -n1 -p "$re$c2$dim ["$re$bold"Y$dim/"$re$bold"n$dim]$re " "yn"; if [ "$yn" == "${yn#[Nn]}" ]; then echo yes; fi;'
################################
alias hello='ff=$(figlist|shuf -n1);printf "\n\n$ff\n\n"; figlet -c -f "$ff" "_Hello"|batcat -ppfl zig; printf "\n\n"'
alias pub='curl ip.me -4'
alias tttt='popo=8686; ttyd -c aa:aa -p $popo -W bash& disown; sleep 1; echo -e "\n >_<\n";	echo -e "\n -- http://"$ip_loc":"$popo" \n"; '
alias pppp='pp "$re"; cd /ants; push; cd -; pp "$red"; ssh aa@ants.ftp.sh "cd ants; git pull"; pp "$green"; mo "cd ants; git pull"; pp "$re"; ' 
alias apa='sudo apt install'
alias less='less -Rr --use-color --no-histdups --incsearch --file-size --chop-long-lines'; 
alias save_as_alias='printf "\n\n\n\n\n\n\22B
\e[25A\e[J\n\n\e[0m -- choose \e[36;1mcommand\e[0m to save as alias: [up/down]\n --\e[36m command:\n"; 
read -p " " -re "qq"; 
printf "\e[0m -- choose \e[1;35malias-name:\e[0m\n --\e[35m alias:\n";
read -p " " -re "ii"; 
printf "\nalias $ii=$(quote "$qq")\n" | tee -a $ants/alias.sh'
alias s4='byobu-layout restore 1'
alias mo='ssh -p 8022 qq.ftp.sh'
alias momo='ssh -p 8022 qq.ftp.sh "termux-media-player play ~/ants/media/money.mp3"'
alias h='search_history'; 
alias allias='cat $HISTFILE|tac|fzf -m --no-sort --height 16|tee -a $ants/alias.sh; '
gh_new() { 
read -rep " $c2 New repo name: " "ghreponame";
read -rep " $c2 New repo dir: " -i "$PWD/$ghreponame" "ghsource";
mkdir -p -m 775 $ghsource; cd $ghsource; 
git init; gh repo create --add-readme --public \
--source "$ghsource" --disable-issues --disable-wiki; 
####
printf "hello from $(date)" >> "README.md";
git branch -M main; git add -A; 
git commit -m "initial commit"; 
git push -u origin main; 
 } 
alias 12_new_github_repo='gh_new';
alias gpg='gpg --pinentry-mode loopback'
fffff() { fzf --height ~12 --preview "(batcat -pfld {})" --preview-window=border-none --info inline --scrollbar --scroll-off 12 --hscroll; }; 
alias calle='printf "\n$(it -)\nleonljunghorn@gmail.com - gcal\n$(it -)"; gcalcli --default-calendar leonljunghorn@gmail.com agenda  --details description --details location; printf "\n$(it -)\n\n"; ' 
alias cdd='dd=(*/); cd $(for df in ${dd[@]}; do echo $df; done|fzf --height ~22)'
alias ttserc='ls -pt|fzf-tmux --no-sort -h'
gg() { 
printf "\n\e[8m$(seq 12)\e[0m\e[12A\e[96m\n --\e[0m google:"; read -rp " " "gg"; 
gs="https://www.google.com/search?q=${gg// /+}"; 
if [ -z "/bin/googler" ]; then googler "$gs" 2>/dev/null||[ -e "/bin/$www_cli" ]&& $www_cli "${gs}"||$BROWSER_CLI "${gs}"; fi; 
open ${gs[*]}; 

} 


alias aantslog='sl "sudo tail -f /home/ants/logs/nginx/access.log"|batcat -ppfld'

