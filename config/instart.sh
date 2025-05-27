#!/bin/bash 
## install config-files 
instart() { 
hash sudo 2>/dev/null && sudo="sudo"; hash sudo 2>/dev/null || alias sudo=' '; 
[ $PREFIX ]&& unset sudo; [[ $UID -eq 0 ]]&& unset sudo; 
mkdir $HOME/tmp 2>/dev/null; mkdir $HOME/logs 2>/dev/null; 
mkdir $HOME/gh 2>/dev/null; mkdir $HOME/.config 2>/dev/null; 
export tmp=$HOME/tmp; 
#####
#####
local IFS=$'\n\t ' green='\e[32m' dim='\e[2m' re='\e[0m' red='\e[31m' \
cyan='\e[36m' yellow='\e[33m' blue='\e[36m' bold='\e[1m' \
height="$(stty size|cut -f1 -d" ")" width="$(stty size|cut -f2 -d" ")" \
yno='\e[0m[\e[2mY\e[0m/\e[2mn\e[0m]' c2='\e[0m\e[36m--\e[0m' uu="60" \
enter='\e[0m[\e[2mq\e[0m]\e[2muit \e[0mor [\e[2mENTER\e[0m]' x="2>/dev/null"; 
####
####
_loader() { 
unset kill; 
printf %b "\e[A\e[?25l\e[46G${re}"; 
# printf "    [   [${dim}a${re}] to abort"; 
pid="$!"; spin='-\|/'; i=0; while kill -0 $pid 2>/dev/null; 
do i=$(( (i+1) %4 )); 
printf "${re} \e[46G [${dim}${spin:$i:1} \b${re}] "; 
read -t 0.1 -s -n1 kill; [ $kill ]&& kill $pid; 
# tail -c21 $tmp/in.log; printf %b "\e[u"; 
done; 
printf "${re} \e[46G [${dim}done \b${re}] "; 
printf %b "\n"; 
}; 
####
# $sudo apt install -y bat iproute2 nmap lf git \
# gh fzf wget micro bash-completion \
# ssh openssh-server &>/dev/null & disown;
apts_basic=(\
gh git rsync file openssl openssh-sftp-server openssh \
micro gnupg fzf mediainfo lf bat batcat runsv htop wget \
bash-completion lsd tmux cron texinfo iproute2 mandoc \
fortunes fortune fortune-mod figlet w3m nmap net-tools \
termux-tools termux-api termux-api cronie mpvb curl \
); 
apts_sec=(\
btop htop ncdu figlet lynx iproute2 net-tools nmap \
links2 fastfetch neofetch wget wget2 curl aria2 iw timg rclone \
); 
apt_termux=(\
termux-tools termux-api termux-api cronie \
); 
apts_more=(\
toilet rclone w3m w3m-img googler exiftool aha \
); 
####
apts_extra=(ffmpeg mpv);
########
####
####
####
unalias p1 p2 2>/dev/null; 
p1() { p2=" ${@}"; for i in $(seq ${#p2}); do sleep .04; printf %b "${p2:${i}:1}"; done; }; ## rolling text 
p2() { printf %b "$@"; }; 
# _move() { mv -S "$EPOCHSECONDS" $@ &>/dev/null; }; 
_link() { ln -s $@ 2>/dev/null; }; 
########
_newcolor() { printf %b "\e[38;5;$((uu++))m"; sleep .02; }; 
########
_backup() { mkdir $HOME/tmp 2>/dev/null; tmp=$HOME/tmp; time=$(date +%y%m%d%H%m%S); 
mv -fb --suffix="$time" $@ -t $tmp 2>/dev/null; 
}; 
_yno() { 
printf %b ""; 
_ok() { 
printf %b "\e[40G     \e[8D  "; 
p2 "\e[0;1m [\e[0;92m"; p1 "OK"; p2 "\e[0;1m]  \e[0m\n"; }; 
p1() { p2=" ${@}"; for i in $(seq ${#p2}); do sleep .04; printf %b "${p2:${i}:1}"; done; }; ## rolling text 
p2() { printf %b "$@"; }; 
yno='\e[0m[\e[2mY\e[0m/\e[2mn\e[0m]' 
[[ "$1" ]]&& ny=${1}; printf %b "\e[40G\b\b\b\b\b\b\b\b$yno "; 
printf -v _yno_${1} "false"; read -rsn1 ny; 
[[ -z $ny || $ny = y ]] && printf -v _yno_${1} "true"; _ok; 
# printf %b "\n_yno_$1 = $_yno_${1} \n"; 
}; 

# printf %b "$green OK$re\n" && \
####
for i in $(seq $((height / 2))); do printf %b "\e[38;5;$((RANDOM%16 + 111))m$i\n"; sleep .04; done; ## scroll page 
for i in $(seq $((height / 2 + 2))); do printf %b "\e[K\e[A\e[2K"; sleep .04; done; 
echo; sleep .04; echo; sleep .04; 
####
#### Update system? 
_update() {
p2 " $c2 "; p1 "Update system? "; _yno update; if [[ $_yno_update == true ]]; then _newcolor; printf %b "\e7"; _newcolor; $sudo apt update 2>/dev/null;  _newcolor; 
printf %b "\e8\e[J"; $sudo apt upgrade -y 2>/dev/null; _newcolor;  printf %b "\e8\e[J"; 
hash fzf git gh lf gnupg curl micro 2>/dev/null||$sudo apt install -y curl fzf git gh lf gnupg micro 2>/dev/null; _newcolor; printf %b "\e8\e[J"; 
printf %b "\e8\e[A${re} \e[46G [${dim}done \b${re}] \n"; fi; 
}; 
####
#### Install apps? 
_apt_installer() { 
p2 " $c2 "; p1 "Install apps? "; _yno aptins; if [[ $_yno_aptins == true ]]; then \
printf %b "\e7"; for ap in ${apts_basic[*]}; do  _newcolor; 
printf %b "\n"; $sudo apt install -y $ap --assume-yes 2>/dev/null && \
printf %b "\e[2K\b\b\b\b installed";  _newcolor; printf %b " $ap\e8\e[J"; done; 
printf %b "\e8\e[A${re} \e[46G [${dim}done \b${re}] \n"; sleep .2; 
fi; 
}; 
####
#### Download config files? 
_download() {
p2 " $c2 "; p1 "Download config files? "; _yno download; 
if [[ $_yno_download == true ]]; then \
p2 " $c2 "; p1 "Where to? "; read -ei "$HOME/" "hstart"; printf %b "\e[A"; 
start="${hstart}/start"; sleep .2; export start="${start/\/\///}"; 
_backup $start; _newcolor; 
git clone https://github.com/aeniks/start.git $start 2>/dev/null & _loader; 
cd $start; git config remote.origin.url git@github.com:aeniks/start.git; 
####
####
#cd $start; git config set remote.origin.url git@github.com:aeniks/start.git; 
#gh config set git_protocol ssh 2>/dev/null; cd -; 
fi; 
# 
# mv $start/.git/config $start/.git/config_old 2>/dev/null; printf %b '\
# [core]\n  repositoryformatversion = 0 \n  filemode = true\n  bare = false
# logallrefupdates = true\n  [remote "origin"]\n  url = git@github.com:aeniks/start.git
# fetch = +refs/heads/*:refs/remotes/origin/*\n  [branch "main"]\n  remote = origin
# merge = refs/heads/main\n  [pull]\n  rebase = true\
# ' > $start/.git/config; 2>/dev/null; cd $start; 
# 
####
}; 
_install_conf() { 

mkdir $HOME/logs/apts -m 775 2>/dev/null; touch $HOME/logs/bp.log $HOME/logs/aptup.log 2>/dev/null; 
mkdir $HOME/crons -m 775 2>/dev/null; 
ln -s $start/crons/* -t $HOME/crons/ 2>/dev/null; 
$sudo rm $PREFIX/etc/motd -fr 2>/dev/null; ## remove motd 
p2 " $c2 "; p1 "Install config? "; _yno in_conf
if [[ $_yno_in_conf == true ]]; then \
# $sudo mv $PREFIX/etc/lf $tmp/ 2>/dev/null; _newcolor; 
# $sudo ln $start/config/lf $PREFIX/etc/ -s  2>/dev/null; _newcolor; 
mkdir $HOME/.config 2>/dev/null; _newcolor; 
####
#### 
_newcolor; printf %b "\e[0m\t\t"; 
touch $HOME/.bashrc; cat $HOME/.bashrc|grep -e "anew.sh" &>/dev/null||\
printf %b "\n. $start/anew.sh;"&>/dev/null >> $HOME/.bashrc 2>/dev/null; 
touch $HOME/.config/tmux_state 2>/dev/null; chmod 775 $HOME/.config/tmux_state; echo; 
####
_backup $HOME/.inputrc; _newcolor; 
_link $start/config/inputrc $HOME/.inputrc; _newcolor; 
##########
_backup $HOME/.tmux.conf $HOME/.tmux.conf.local; _newcolor; 
_link $start/config/tmux/tmux.conf $HOME/.tmux.conf; _newcolor; 
_link $start/config/figlet/figz.sh $HOME/; _newcolor; 
########
_backup $HOME/.tmux_bash.sh; _newcolor; 
_link $start/config/tmux/tmux_bash.sh $HOME/.tmux_bash.sh; _newcolor; 
#########
_backup $HOME/.termux/termux.properties; _newcolor; 
_link $start/config/termux/termux.properties $HOME/.termux/; _newcolor; 
######
_backup $HOME/.config/micro/settings.json; _newcolor; 
_backup $HOME/.config/micro/bindings.json; _newcolor; 
ln -s $start/config/micro/settings.json $start/config/micro/bindings.json -t $HOME/.config/micro/; _newcolor; 
######
###### batcat config 
if [ -n $PREFIX ]; then apt install bat -y 2>/dev/null; 
ln --symbolic $PREFIX/bin/bat $PREFIX/bin/batcat; else $sudo apt install bat -y 2>/dev/null; 
$sudo ln --symbolic $PREFIX/bin/batcat $PREFIX/bin/bat 2>/dev/null; fi; _newcolor; 
######
###### github & ssh - config files 
$sudo apt install -y openssh gh git 2>/dev/null; 
[ -z $HOME/.ssh/*.pub ] && ssh-keygen -N "" -f $HOME/.ssh/id_ed25519; gh ssh-key add $HOME/.ssh/*.pub; printf %b "\e[96m\u990 \e[0m"; ssh -T git@github.com; printf %b "\n"; 
###### link config files to home 
conf=(newsboat bat lf tmux htop); 
for q in ${conf[*]}; do 
mkdir -p $HOME/.config/$q 2>/dev/null; 
_backup $HOME/.config/$q/*; _newcolor; 
ln -s $start/config/$q/* -t $HOME/.config/$q/; sleep .2; 
printf %b "\n\e[0m"; p1 "updated"; _newcolor; printf %b " $q"; 
done; echo; cd; _newcolor; 
printf %b "$PATH" > $HOME/.config/path.sh; chmod 775 $HOME/.config/path.sh; _newcolor; 
printf %b "\n -- added "$PATH" to $HOME/.config/path.sh \n\n "; _newcolor; 
####
$sudo apt install -y figlet 2>/dev/null; 
######## 
. $start/config/figlet/install_fonts.sh 2>/dev/null; 
mkdir -p -m 775 $PREFIX/share/figlet 2>/dev/null||\
$sudo mkdir -p -m 775 $PREFIX/share/figlet 2>/dev/null; 
cp $HOME/start/config/figlet/fonts/* -t $PREFIX/usr/share/figlet/ 2>/dev/null||\
$sudo cp $HOME/start/config/figlet/fonts/* -t $PREFIX/share/figlet/ 2>/dev/null; 
$sudo chmod 775 $PREFIX/share/figlet -R 2>/dev/null; 
####
mkdir -m 775 -p $HOME/.local/bin 2>/dev/null; 
$sudo cp $start/config/ssss.sh $HOME/.local/bin/ssss 2>/dev/null; 
export PATH=${PATH}:~/.local/bin:$PREFIX/usr/games; 

# cat $HOME/.bashrc|grep 
printf %b "$PATH" > $PREFIX/.config/path;
cat ~/.bashrc | grep -e "PATH" || printf %b '\n export $(cat ${HOME/.config/path}) \n' >> ~/.bashrc; 
chmod 775 $PREFIX/.config/path; 
cat $HOME/.config/path|grep "~/.local/bin" || \
printf %b "${PATH}:~/.local/bin" >> $HOME/.config/path; 
fi; 
####
## crons
}; 
####
#### Authenticates github
_login_gh() {
p2 " $c2 "; p1 "Login to github? "; _yno gh; 
if [[ $_yno_gh == true ]]; then \
$sudo apt install -y ssh gpg gnupg git gh &>/dev/null; 
####
ghuser="$(id -nu)"; ghmail="$(id -nu)@$(hostname)";  gh_aeniks="$start/config/gpg/gh_aeniks.gpg"; 
####
gpg --pinentry-mode loopback -o "gh.txt" -d "$gh_aeniks"; 
gh auth login --with-token < "gh.txt"; printf "$c2 "; rm gh.txt; sleep .2;
gh auth status && \
printf %b "\e[60G      \e[8D  "; p2 "\e[0;1m [\e[0;92m"; p1 "OK"; p2 "\e[0;1m]  \e[0m\n"; sleep .2; 
git config --global user.name $ghuser; 
git config --global user.email $ghmail; 
git config --global init.defaultBranch main; 
# printf %b "\nHost *\nForwardAgent yes\n" >> $HOME/.ssh/config;
ssh-keygen -N "" -f ll_${USER}_${HOSTNAME}_ll; 
gh config set git_protocol ssh; gh ssh-key add $HOME/.ssh/*.pub; 
cd $start; git config remote.origin.url git@github.com:aeniks/start.git;  2>/dev/null; 
cd -; 
ssh -T git@github.com; fi; 
_link $PREFIX/var/spool/cron $HOME/ 2>/dev/null; 
}; 
####
#### Install apps?
_install_apps() {
p2 " $c2 "; p1 "Install apps? "; _yno in_apps
if [[ $_yno_in_apps == true ]]; then \
p2 " $c2 "; p1 "updating system ..."; echo; echo; _newcolor; 
$sudo apt update; _newcolor; $sudo apt upgrade -y; _newcolor; echo; 
####
[ -e $HOME/logs/apa.log ] || $sudo apt list > $HOME/logs/apa_1.log; 
tail -n+1 $HOME/logs/apa_1.log|cut -f1 -d"/" > $HOME/logs/apa.log; 
####
apts_install=($(for i in ${apts_basic[*]}; do hash $i 2>/dev/null || \
grep $HOME/logs/apa.log -x -e "$i"; done; )); 
####
for i in ${apts_install[*]}; do 
hash $i 2>/dev/null && printf %b "\n$reSkipping $cyan $i$re already installed$green"; 
printf %b "\e[38;5;$((uu++))m\n"; 
hash $i 2>/dev/null || (printf %b "\nInstalling $i \e[0;1m"; p1 " ..."; 
printf %b "\n\e[0;2m"; )&& \
hash $i 2>/dev/null || $sudo apt install -y $i &>/dev/null; done; 
for i in {1..6}; do echo; sleep .2; done; 
printf %b "\e[0m\e[4A"; p1 Installation complete!; 
for i in {1..6}; do echo; sleep .2; done; 
fi; 
}; 
apts() { 
IFS=$'\n '; mkdir -p -m 775 $HOME/logs/apts_basic 2>/dev/null; 
printf %b "\n \e[96m--\e[0m Updating apts..."; $sudo apt update &>/dev/null; 
for i in ${apts_basic[*]}; do $sudo apt show $i 2>/dev/null|grep -e "Installed-Size" -e "Description" > $HOME/logs/apts_basic/_$i; 
cat  $HOME/logs/apts/_$i 2>/dev/null|cut -f2- -d" " > $HOME/logs/apts_basic/$i; 
[ $(wc -l $HOME/logs/apts_basic/_$i|cut -b1-2) -eq 0 ] 2>/dev/null && rm $HOME/logs/apts_basic/$i; 
done; rm $HOME/logs/apts_basic/_*; 
printf %b "\n \e[96m--\e[0m DONE\n"
}; 
####
####
_update; 
_apt_installer; 
_download; 
_install_conf; 
_login_gh; 
_install_apps; 
cd; echo; sleep 1; exec bash; 
}; 
instart
/bin/bash -c #!/bin/bash#Wedon'tneedreturncodesfor"$(command)",onlystdoutisneeded.#Allow`[[-n"$(command)"]]`,`func"$(command)"`,pipes,etc.#shellcheckdisable=SC2312set-uabort(){printf"%s
""$@">&2exit1}#Failfastwithaconcisemessagewhennotusingbash#SinglebracketsareneededhereforPOSIXcompatibility#shellcheckdisable=SC2292if[-z"${BASH_VERSION:-}"]thenabort"Bashisrequiredtointerpretthisscript."fi#Checkifscriptisrunwithforce-interactivemodeinCIif[[-n"${CI-}"&&-n"${INTERACTIVE-}"]]thenabort"Cannotrunforce-interactivemodeinCI."fi#Checkifboth`INTERACTIVE`and`NONINTERACTIVE`areset#Alwaysusesingle-quotedstringswith`exp`expressions#shellcheckdisable=SC2016if[[-n"${INTERACTIVE-}"&&-n"${NONINTERACTIVE-}"]]thenabort'Both`$INTERACTIVE`and`$NONINTERACTIVE`areset.Pleaseunsetatleastonevariableandtryagain.'fi#CheckifscriptisruninPOSIXmodeif[[-n"${POSIXLY_CORRECT+1}"]]thenabort'BashmustnotruninPOSIXmode.PleaseunsetPOSIXLY_CORRECTandtryagain.'fi#CheckforfilethatpreventsHomebrewinstallationif[[-f"/etc/homebrew/brew.no_install"]]thenBREW_NO_INSTALL="$(cat"/etc/homebrew/brew.no_install"2>/dev/null)"if[[-n"${BREW_NO_INSTALL}"]]thenabort"Homebrewcannotbeinstalledbecause${BREW_NO_INSTALL}."elseabort"Homebrewcannotbeinstalledbecause/etc/homebrew/brew.no_installexists!"fifi#stringformattersif[[-t1]]thentty_escape(){printf"[%sm""$1";}elsetty_escape(){:;}fitty_mkbold(){tty_escape"1;$1";}tty_underline="$(tty_escape"4;39")"tty_blue="$(tty_mkbold34)"tty_red="$(tty_mkbold31)"tty_bold="$(tty_mkbold39)"tty_reset="$(tty_escape0)"shell_join(){localargprintf"%s""$1"shiftforargin"$@"doprintf""printf"%s""${arg///\}"done}chomp(){printf"%s""${1/"$'
'"/}"}ohai(){printf"${tty_blue}==>${tty_bold}%s${tty_reset}
""$(shell_join"$@")"}warn(){printf"${tty_red}Warning${tty_reset}:%s
""$(chomp"$1")">&2}usage(){cat<<EOSHomebrewInstallerUsage:[NONINTERACTIVE=1][CI=1]install.sh[options]-h,--helpDisplaythismessage.NONINTERACTIVEInstallwithoutpromptingforuserinputCIInstallinCImode(e.g.donotpromptforuserinput)EOSexit"${1:-0}"}while[[$#-gt0]]docase"$1"in-h|--help)usage;;*)warn"Unrecognizedoption:'$1'"usage1;;esacdone#Checkifscriptisrunnon-interactively(e.g.CI)#Ifitisrunnon-interactivelyweshouldnotpromptforpasswords.#Alwaysusesingle-quotedstringswith`exp`expressions#shellcheckdisable=SC2016if[[-z"${NONINTERACTIVE-}"]]thenif[[-n"${CI-}"]]thenwarn'Runninginnon-interactivemodebecause`$CI`isset.'NONINTERACTIVE=1elif[[!-t0]]thenif[[-z"${INTERACTIVE-}"]]thenwarn'Runninginnon-interactivemodebecause`stdin`isnotaTTY.'NONINTERACTIVE=1elsewarn'Runningininteractivemodedespite`stdin`notbeingaTTYbecause`$INTERACTIVE`isset.'fifielseohai'Runninginnon-interactivemodebecause`$NONINTERACTIVE`isset.'fi#USERisn'talwayssetsoprovideafallbackfortheinstallerandsubprocesses.if[[-z"${USER-}"]]thenUSER="$(chomp"$(id-un)")"exportUSERfi#FirstcheckOS.OS="$(uname)"if[["${OS}"=="Linux"]]thenHOMEBREW_ON_LINUX=1elif[["${OS}"=="Darwin"]]thenHOMEBREW_ON_MACOS=1elseabort"HomebrewisonlysupportedonmacOSandLinux."fi#Requiredinstallationpaths.Toinstallelsewhere(whichisunsupported)#youcanuntarhttps://github.com/Homebrew/brew/tarball/master#anywhereyoulike.if[[-n"${HOMEBREW_ON_MACOS-}"]]thenUNAME_MACHINE="$(/usr/bin/uname-m)"if[["${UNAME_MACHINE}"=="arm64"]]then#OnARMmacOS,thisscriptinstallsto/opt/homebrewonlyHOMEBREW_PREFIX="/opt/homebrew"HOMEBREW_REPOSITORY="${HOMEBREW_PREFIX}"else#OnIntelmacOS,thisscriptinstallsto/usr/localonlyHOMEBREW_PREFIX="/usr/local"HOMEBREW_REPOSITORY="${HOMEBREW_PREFIX}/Homebrew"fiHOMEBREW_CACHE="${HOME}/Library/Caches/Homebrew"STAT_PRINTF=("/usr/bin/stat""-f")PERMISSION_FORMAT="%A"CHOWN=("/usr/sbin/chown")CHGRP=("/usr/bin/chgrp")GROUP="admin"TOUCH=("/usr/bin/touch")INSTALL=("/usr/bin/install"-d-o"root"-g"wheel"-m"0755")elseUNAME_MACHINE="$(uname-m)"#OnLinux,thisscriptinstallsto/home/linuxbrew/.linuxbrewonlyHOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"HOMEBREW_REPOSITORY="${HOMEBREW_PREFIX}/Homebrew"HOMEBREW_CACHE="${HOME}/.cache/Homebrew"STAT_PRINTF=("/usr/bin/stat""--printf")PERMISSION_FORMAT="%a"CHOWN=("/bin/chown")CHGRP=("/bin/chgrp")GROUP="$(id-gn)"TOUCH=("/bin/touch")INSTALL=("/usr/bin/install"-d-o"${USER}"-g"${GROUP}"-m"0755")fiCHMOD=("/bin/chmod")MKDIR=("/bin/mkdir""-p")HOMEBREW_BREW_DEFAULT_GIT_REMOTE="https://github.com/Homebrew/brew"HOMEBREW_CORE_DEFAULT_GIT_REMOTE="https://github.com/Homebrew/homebrew-core"#UseremoteURLsofHomebrewrepositoriesfromenvironmentifset.HOMEBREW_BREW_GIT_REMOTE="${HOMEBREW_BREW_GIT_REMOTE:-"${HOMEBREW_BREW_DEFAULT_GIT_REMOTE}"}"HOMEBREW_CORE_GIT_REMOTE="${HOMEBREW_CORE_GIT_REMOTE:-"${HOMEBREW_CORE_DEFAULT_GIT_REMOTE}"}"#TheURLswithandwithoutthe'.git'suffixarethesameGitremote.Donotprompt.if[["${HOMEBREW_BREW_GIT_REMOTE}"=="${HOMEBREW_BREW_DEFAULT_GIT_REMOTE}.git"]]thenHOMEBREW_BREW_GIT_REMOTE="${HOMEBREW_BREW_DEFAULT_GIT_REMOTE}"fiif[["${HOMEBREW_CORE_GIT_REMOTE}"=="${HOMEBREW_CORE_DEFAULT_GIT_REMOTE}.git"]]thenHOMEBREW_CORE_GIT_REMOTE="${HOMEBREW_CORE_DEFAULT_GIT_REMOTE}"fiexportHOMEBREW_{BREW,CORE}_GIT_REMOTE#TODO:bumpversionwhennewmacOSisreleasedorannouncedMACOS_NEWEST_UNSUPPORTED="16.0"#TODO:bumpversionwhennewmacOSisreleasedMACOS_OLDEST_SUPPORTED="13.0"#ForHomebrewonLinuxREQUIRED_RUBY_VERSION=2.6#https://github.com/Homebrew/brew/pull/6556REQUIRED_GLIBC_VERSION=2.13#https://docs.brew.sh/Homebrew-on-Linux#requirementsREQUIRED_CURL_VERSION=7.41.0#HOMEBREW_MINIMUM_CURL_VERSIONinbrew.shinHomebrew/brewREQUIRED_GIT_VERSION=2.7.0#HOMEBREW_MINIMUM_GIT_VERSIONinbrew.shinHomebrew/brew#noanalyticsduringinstallationexportHOMEBREW_NO_ANALYTICS_THIS_RUN=1exportHOMEBREW_NO_ANALYTICS_MESSAGE_OUTPUT=1unsetHAVE_SUDO_ACCESS#unsetthisfromtheenvironmenthave_sudo_access(){if[[!-x"/usr/bin/sudo"]]thenreturn1filocal-aSUDO=("/usr/bin/sudo")if[[-n"${SUDO_ASKPASS-}"]]thenSUDO+=("-A")elif[[-n"${NONINTERACTIVE-}"]]thenSUDO+=("-n")fiif[[-z"${HAVE_SUDO_ACCESS-}"]]thenif[[-n"${NONINTERACTIVE-}"]]then"${SUDO[@]}"-lmkdir&>/dev/nullelse"${SUDO[@]}"-v&&"${SUDO[@]}"-lmkdir&>/dev/nullfiHAVE_SUDO_ACCESS="$?"fiif[[-n"${HOMEBREW_ON_MACOS-}"]]&&[["${HAVE_SUDO_ACCESS}"-ne0]]thenabort"NeedsudoaccessonmacOS(e.g.theuser${USER}needstobeanAdministrator)!"fireturn"${HAVE_SUDO_ACCESS}"}execute(){if!"$@"thenabort"$(printf"Failedduring:%s""$(shell_join"$@")")"fi}retry(){localtries="$1"n="$1"pause=2shiftif!"$@"thenwhile[[$((--n))-gt0]]dowarn"$(printf"Tryingagainin%dseconds:%s""${pause}""$(shell_join"$@")")"sleep"${pause}"((pause*=2))if"$@"thenreturnfidoneabort"$(printf"Failed%dtimesdoing:%s""${tries}""$(shell_join"$@")")"fi}execute_sudo(){local-aargs=("$@")if[["${EUID:-${UID}}"!="0"]]&&have_sudo_accessthenif[[-n"${SUDO_ASKPASS-}"]]thenargs=("-A""${args[@]}")fiohai"/usr/bin/sudo""${args[@]}"execute"/usr/bin/sudo""${args[@]}"elseohai"${args[@]}"execute"${args[@]}"fi}getc(){localsave_statesave_state="$(/bin/stty-g)"/bin/sttyraw-echoIFS=''read-r-n1-d''"$@"/bin/stty"${save_state}"}ring_bell(){#Usetheshell'saudiblebell.if[[-t1]]thenprintf""fi}wait_for_user(){localcechoecho"Press${tty_bold}RETURN${tty_reset}/${tty_bold}ENTER${tty_reset}tocontinueoranyotherkeytoabort:"getcc#wetestforand
becausesomestuffdoesinsteadif![["${c}"==$''||"${c}"==$'
']]thenexit1fi}major_minor(){echo"${1%%.*}.$(x="${1#*.}"echo"${x%%.*}")"}version_gt(){[["${1%.*}"-gt"${2%.*}"]]||[["${1%.*}"-eq"${2%.*}"&&"${1#*.}"-gt"${2#*.}"]]}version_ge(){[["${1%.*}"-gt"${2%.*}"]]||[["${1%.*}"-eq"${2%.*}"&&"${1#*.}"-ge"${2#*.}"]]}version_lt(){[["${1%.*}"-lt"${2%.*}"]]||[["${1%.*}"-eq"${2%.*}"&&"${1#*.}"-lt"${2#*.}"]]}check_run_command_as_root(){[["${EUID:-${UID}}"=="0"]]||return#AllowAzurePipelines/GitHubActions/Docker/Concourse/Kubernetestodoeverythingasroot(asit'snormalthere)[[-f/.dockerenv]]&&return[[-f/run/.containerenv]]&&return[[-f/proc/1/cgroup]]&&grep-E"azpl_job|actions_job|docker|garden|kubepods"-q/proc/1/cgroup&&returnabort"Don'trunthisasroot!"}should_install_command_line_tools(){if[[-n"${HOMEBREW_ON_LINUX-}"]]thenreturn1fiifversion_gt"${macos_version}""10.13"then![[-e"/Library/Developer/CommandLineTools/usr/bin/git"]]else![[-e"/Library/Developer/CommandLineTools/usr/bin/git"]]||![[-e"/usr/include/iconv.h"]]fi}get_permission(){"${STAT_PRINTF[@]}""${PERMISSION_FORMAT}""$1"}user_only_chmod(){[[-d"$1"]]&&[["$(get_permission"$1")"!=75[0145]]]}exists_but_not_writable(){[[-e"$1"]]&&![[-r"$1"&&-w"$1"&&-x"$1"]]}get_owner(){"${STAT_PRINTF[@]}""%u""$1"}file_not_owned(){[["$(get_owner"$1")"!="$(id-u)"]]}get_group(){"${STAT_PRINTF[@]}""%g""$1"}file_not_grpowned(){[["$(id-G"${USER}")"!=*"$(get_group"$1")"*]]}#Pleasesyncwith'test_ruby()'in'Library/Homebrew/utils/ruby.sh'fromtheHomebrew/brewrepository.test_ruby(){if[[!-x"$1"]]thenreturn1fi"$1"--enable-frozen-string-literal--disable=gems,did_you_mean,rubyopt-rrubygems-e\"abortifGem::Version.new(RUBY_VERSION.to_s.dup).to_s.split('.').first(2)!=\Gem::Version.new('${REQUIRED_RUBY_VERSION}').to_s.split('.').first(2)"2>/dev/null}test_curl(){if[[!-x"$1"]]thenreturn1fiif[["$1"=="/snap/bin/curl"]]thenwarn"Ignoring$1(curlsnapistoorestricted)"return1filocalcurl_version_outputcurl_name_and_versioncurl_version_output="$("$1"--version2>/dev/null)"curl_name_and_version="${curl_version_output%%(*}"version_ge"$(major_minor"${curl_name_and_version##*}")""$(major_minor"${REQUIRED_CURL_VERSION}")"}test_git(){if[[!-x"$1"]]thenreturn1filocalgit_version_outputgit_version_output="$("$1"--version2>/dev/null)"if[["${git_version_output}"=~"gitversion"([^]*).*]]thenversion_ge"$(major_minor"${BASH_REMATCH[1]}")""$(major_minor"${REQUIRED_GIT_VERSION}")"elseabort"UnexpectedGitversion:'${git_version_output}'!"fi}#SearchforthegivenexecutableinPATH(avoidsadependencyonthe`which`command)which(){#AliastoBashbuilt-incommand`type-P`type-P"$@"}#SearchPATHforthespecifiedprogramthatsatisfiesHomebrewrequirements#functionwhichissetabove#shellcheckdisable=SC2230find_tool(){if[[$#-ne1]]thenreturn1filocalexecutablewhileread-rexecutabledoif[["${executable}"!=/*]]thenwarn"Ignoring${executable}(relativepathsdon'twork)"elif"test_$1""${executable}"thenecho"${executable}"breakfidone<<(which-a"$1")}no_usable_ruby(){[[-z"$(find_toolruby)"]]}outdated_glibc(){localglibc_versionglibc_version="$(ldd--version|head-n1|grep-o'[0-9.]*$'|grep-o'^[0-9]\+\.[0-9]\+')"version_lt"${glibc_version}""${REQUIRED_GLIBC_VERSION}"}if[[-n"${HOMEBREW_ON_LINUX-}"]]&&no_usable_ruby&&outdated_glibcthenabort"$(cat<<EOABORTHomebrewrequiresRuby${REQUIRED_RUBY_VERSION}whichwasnotfoundonyoursystem.HomebrewportableRubyrequiresGlibcversion${REQUIRED_GLIBC_VERSION}ornewer,andyourGlibcversionistooold.See:${tty_underline}https://docs.brew.sh/Homebrew-on-Linux#requirements${tty_reset}PleaseinstallRuby${REQUIRED_RUBY_VERSION}andadditslocationtoyourPATH.EOABORT)"fi#Invalidatesudotimestampbeforeexiting(ifitwasn'tactivebefore).if[[-x/usr/bin/sudo]]&&!/usr/bin/sudo-n-v2>/dev/nullthentrap'/usr/bin/sudo-k'EXITfi#Thingscanfaillaterif`pwd`doesn'texist.#Alsosudoprintsawarningmessagefornogoodreasoncd"/usr"||exit1#######################################################################script#shellcheckdisable=SC2016ohai'Checkingfor`sudo`access(whichmayrequestyourpassword)...'if[[-n"${HOMEBREW_ON_MACOS-}"]]then[["${EUID:-${UID}}"=="0"]]||have_sudo_accesselif![[-w"${HOMEBREW_PREFIX}"]]&&![[-w"/home/linuxbrew"]]&&![[-w"/home"]]&&!have_sudo_accessthenabort"$(cat<<EOABORTInsufficientpermissionstoinstallHomebrewto"${HOMEBREW_PREFIX}"(thedefaultprefix).Alternative(unsupported)installationmethodsareavailableat:https://docs.brew.sh/Installation#alternative-installsPleasenotethiswillrequiremostformulatobuildfromsource,abuggy,slowandenergy-inefficientexperience.Wewillcloseanyissueswithoutresponsefortheseunsupportedconfigurations.EOABORT)"fiHOMEBREW_CORE="${HOMEBREW_REPOSITORY}/Library/Taps/homebrew/homebrew-core"check_run_command_as_rootif[[-d"${HOMEBREW_PREFIX}"&&!-x"${HOMEBREW_PREFIX}"]]thenabort"$(cat<<EOABORTTheHomebrewprefix${tty_underline}${HOMEBREW_PREFIX}${tty_reset}existsbutisnotsearchable.Ifthisisnotintentional,pleaserestorethedefaultpermissionsandtryrunningtheinstalleragain:sudochmod775${HOMEBREW_PREFIX}EOABORT)"fiif[[-n"${HOMEBREW_ON_MACOS-}"]]then#OnmacOS,support64-bitIntelandARMif[["${UNAME_MACHINE}"!="arm64"]]&&[["${UNAME_MACHINE}"!="x86_64"]]thenabort"HomebrewisonlysupportedonIntelandARMprocessors!"fielseif[["${UNAME_MACHINE}"!="x86_64"]]&&[["${UNAME_MACHINE}"!="aarch64"]]thenabort"HomebrewonLinuxisonlysupportedonIntelx86_64andARM64processors!"fifiif[[-n"${HOMEBREW_ON_MACOS-}"]]thenmacos_version="$(major_minor"$(/usr/bin/sw_vers-productVersion)")"ifversion_lt"${macos_version}""10.7"thenabort"$(cat<<EOABORTYourMacOSXversionistooold.See:${tty_underline}https://github.com/mistydemeo/tigerbrew${tty_reset}EOABORT)"elifversion_lt"${macos_version}""10.11"thenabort"YourOSXversionistooold."elifversion_ge"${macos_version}""${MACOS_NEWEST_UNSUPPORTED}"||version_lt"${macos_version}""${MACOS_OLDEST_SUPPORTED}"thenwho="We"what=""ifversion_ge"${macos_version}""${MACOS_NEWEST_UNSUPPORTED}"thenwhat="pre-releaseversion"elsewho+="(andApple)"what="oldversion"fiohai"YouareusingmacOS${macos_version}."ohai"${who}donotprovidesupportforthis${what}."echo"$(cat<<EOSThisinstallationmaynotsucceed.Afterinstallation,youwillencounterbuildfailureswithsomeformulae.PleasecreatepullrequestsinsteadofaskingforhelponHomebrew\'sGitHub,Twitteroranyotherofficialchannels.Youareresponsibleforresolvinganyissuesyouexperiencewhileyouarerunningthis${what}.EOS)"|tr-d"\"fifiohai"Thisscriptwillinstall:"echo"${HOMEBREW_PREFIX}/bin/brew"echo"${HOMEBREW_PREFIX}/share/doc/homebrew"echo"${HOMEBREW_PREFIX}/share/man/man1/brew.1"echo"${HOMEBREW_PREFIX}/share/zsh/site-functions/_brew"echo"${HOMEBREW_PREFIX}/etc/bash_completion.d/brew"echo"${HOMEBREW_REPOSITORY}"#Keeprelativelyinsyncwith#https://github.com/Homebrew/brew/blob/master/Library/Homebrew/keg.rbdirectories=(binetcincludelibsbinshareoptvarFrameworksetc/bash_completion.dlib/pkgconfigshare/aclocalshare/docshare/infoshare/localeshare/manshare/man/man1share/man/man2share/man/man3share/man/man4share/man/man5share/man/man6share/man/man7share/man/man8var/logvar/homebrewvar/homebrew/linkedbin/brew)group_chmods=()fordirin"${directories[@]}"doifexists_but_not_writable"${HOMEBREW_PREFIX}/${dir}"thengroup_chmods+=("${HOMEBREW_PREFIX}/${dir}")fidone#zshrefusestoreadfromthesedirectoriesifgroupwritabledirectories=(share/zshshare/zsh/site-functions)zsh_dirs=()fordirin"${directories[@]}"dozsh_dirs+=("${HOMEBREW_PREFIX}/${dir}")donedirectories=(binetcincludelibsbinsharevaroptshare/zshshare/zsh/site-functionsvar/homebrewvar/homebrew/linkedCellarCaskroomFrameworks)mkdirs=()fordirin"${directories[@]}"doif![[-d"${HOMEBREW_PREFIX}/${dir}"]]thenmkdirs+=("${HOMEBREW_PREFIX}/${dir}")fidoneuser_chmods=()mkdirs_user_only=()if[["${#zsh_dirs[@]}"-gt0]]thenfordirin"${zsh_dirs[@]}"doif[[!-d"${dir}"]]thenmkdirs_user_only+=("${dir}")elifuser_only_chmod"${dir}"thenuser_chmods+=("${dir}")fidonefichmods=()if[["${#group_chmods[@]}"-gt0]]thenchmods+=("${group_chmods[@]}")fiif[["${#user_chmods[@]}"-gt0]]thenchmods+=("${user_chmods[@]}")fichowns=()chgrps=()if[["${#chmods[@]}"-gt0]]thenfordirin"${chmods[@]}"doiffile_not_owned"${dir}"thenchowns+=("${dir}")fiiffile_not_grpowned"${dir}"thenchgrps+=("${dir}")fidonefiif[["${#group_chmods[@]}"-gt0]]thenohai"Thefollowingexistingdirectorieswillbemadegroupwritable:"printf"%s
""${group_chmods[@]}"fiif[["${#user_chmods[@]}"-gt0]]thenohai"Thefollowingexistingdirectorieswillbemadewritablebyuseronly:"printf"%s
""${user_chmods[@]}"fiif[["${#chowns[@]}"-gt0]]thenohai"Thefollowingexistingdirectorieswillhavetheirownersetto${tty_underline}${USER}${tty_reset}:"printf"%s
""${chowns[@]}"fiif[["${#chgrps[@]}"-gt0]]thenohai"Thefollowingexistingdirectorieswillhavetheirgroupsetto${tty_underline}${GROUP}${tty_reset}:"printf"%s
""${chgrps[@]}"fiif[["${#mkdirs[@]}"-gt0]]thenohai"Thefollowingnewdirectorieswillbecreated:"printf"%s
""${mkdirs[@]}"fiifshould_install_command_line_toolsthenohai"TheXcodeCommandLineToolswillbeinstalled."finon_default_repos=""additional_shellenv_commands=()if[["${HOMEBREW_BREW_DEFAULT_GIT_REMOTE}"!="${HOMEBREW_BREW_GIT_REMOTE}"]]thenohai"HOMEBREW_BREW_GIT_REMOTEissettoanon-defaultURL:"echo"${tty_underline}${HOMEBREW_BREW_GIT_REMOTE}${tty_reset}willbeusedastheHomebrew/brewGitremote."non_default_repos="Homebrew/brew"additional_shellenv_commands+=("exportHOMEBREW_BREW_GIT_REMOTE=\"${HOMEBREW_BREW_GIT_REMOTE}\"")fiif[["${HOMEBREW_CORE_DEFAULT_GIT_REMOTE}"!="${HOMEBREW_CORE_GIT_REMOTE}"]]thenohai"HOMEBREW_CORE_GIT_REMOTEissettoanon-defaultURL:"echo"${tty_underline}${HOMEBREW_CORE_GIT_REMOTE}${tty_reset}willbeusedastheHomebrew/homebrew-coreGitremote."non_default_repos="${non_default_repos:-}${non_default_repos:+and}Homebrew/homebrew-core"additional_shellenv_commands+=("exportHOMEBREW_CORE_GIT_REMOTE=\"${HOMEBREW_CORE_GIT_REMOTE}\"")fiif[[-n"${HOMEBREW_NO_INSTALL_FROM_API-}"]]thenohai"HOMEBREW_NO_INSTALL_FROM_APIisset."echo"Homebrew/homebrew-corewillbetappedduringthis${tty_bold}install${tty_reset}run."fiif[[-z"${NONINTERACTIVE-}"]]thenring_bellwait_for_userfiif[[-d"${HOMEBREW_PREFIX}"]]thenif[["${#chmods[@]}"-gt0]]thenexecute_sudo"${CHMOD[@]}""u+rwx""${chmods[@]}"fiif[["${#group_chmods[@]}"-gt0]]thenexecute_sudo"${CHMOD[@]}""g+rwx""${group_chmods[@]}"fiif[["${#user_chmods[@]}"-gt0]]thenexecute_sudo"${CHMOD[@]}""go-w""${user_chmods[@]}"fiif[["${#chowns[@]}"-gt0]]thenexecute_sudo"${CHOWN[@]}""${USER}""${chowns[@]}"fiif[["${#chgrps[@]}"-gt0]]thenexecute_sudo"${CHGRP[@]}""${GROUP}""${chgrps[@]}"fielseexecute_sudo"${INSTALL[@]}""${HOMEBREW_PREFIX}"fiif[["${#mkdirs[@]}"-gt0]]thenexecute_sudo"${MKDIR[@]}""${mkdirs[@]}"execute_sudo"${CHMOD[@]}""ug=rwx""${mkdirs[@]}"if[["${#mkdirs_user_only[@]}"-gt0]]thenexecute_sudo"${CHMOD[@]}""go-w""${mkdirs_user_only[@]}"fiexecute_sudo"${CHOWN[@]}""${USER}""${mkdirs[@]}"execute_sudo"${CHGRP[@]}""${GROUP}""${mkdirs[@]}"fiif![[-d"${HOMEBREW_REPOSITORY}"]]thenexecute_sudo"${MKDIR[@]}""${HOMEBREW_REPOSITORY}"fiexecute_sudo"${CHOWN[@]}""-R""${USER}:${GROUP}""${HOMEBREW_REPOSITORY}"if![[-d"${HOMEBREW_CACHE}"]]thenif[[-n"${HOMEBREW_ON_MACOS-}"]]thenexecute_sudo"${MKDIR[@]}""${HOMEBREW_CACHE}"elseexecute"${MKDIR[@]}""${HOMEBREW_CACHE}"fifiifexists_but_not_writable"${HOMEBREW_CACHE}"thenexecute_sudo"${CHMOD[@]}""g+rwx""${HOMEBREW_CACHE}"fiiffile_not_owned"${HOMEBREW_CACHE}"thenexecute_sudo"${CHOWN[@]}""-R""${USER}""${HOMEBREW_CACHE}"fiiffile_not_grpowned"${HOMEBREW_CACHE}"thenexecute_sudo"${CHGRP[@]}""-R""${GROUP}""${HOMEBREW_CACHE}"fiif[[-d"${HOMEBREW_CACHE}"]]thenexecute"${TOUCH[@]}""${HOMEBREW_CACHE}/.cleaned"fiifshould_install_command_line_tools&&version_ge"${macos_version}""10.13"thenohai"SearchingonlinefortheCommandLineTools"#Thistemporaryfilepromptsthe'softwareupdate'utilitytolisttheCommandLineToolsclt_placeholder="/tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress"execute_sudo"${TOUCH[@]}""${clt_placeholder}"clt_label_command="/usr/sbin/softwareupdate-l|grep-B1-E'CommandLineTools'|awk-F'*''/^*\*/{print\$2}'|sed-e's/^*Label://'-e's/^*//'|sort-V|tail-n1"clt_label="$(chomp"$(/bin/bash-c"${clt_label_command}")")"if[[-n"${clt_label}"]]thenohai"Installing${clt_label}"execute_sudo"/usr/sbin/softwareupdate""-i""${clt_label}"execute_sudo"/usr/bin/xcode-select""--switch""/Library/Developer/CommandLineTools"fiexecute_sudo"/bin/rm""-f""${clt_placeholder}"fi#Headlessinstallmayhavefailed,sofallbacktooriginal'xcode-select'methodifshould_install_command_line_tools&&test-t0thenohai"InstallingtheCommandLineTools(expectaGUIpopup):"execute"/usr/bin/xcode-select""--install"echo"Pressanykeywhentheinstallationhascompleted."getcexecute_sudo"/usr/bin/xcode-select""--switch""/Library/Developer/CommandLineTools"fiif[[-n"${HOMEBREW_ON_MACOS-}"]]&&!output="$(/usr/bin/xcrunclang2>&1)"&&[["${output}"==*"license"*]]thenabort"$(cat<<EOABORTYouhavenotagreedtotheXcodelicense.BeforerunningtheinstalleragainpleaseagreetothelicensebyopeningXcode.apporrunning:sudoxcodebuild-licenseEOABORT)"fiUSABLE_GIT=/usr/bin/gitif[[-n"${HOMEBREW_ON_LINUX-}"]]thenUSABLE_GIT="$(find_toolgit)"if[[-z"$(command-vgit)"]]thenabort"$(cat<<EOABORTYoumustinstallGitbeforeinstallingHomebrew.See:${tty_underline}https://docs.brew.sh/Installation${tty_reset}EOABORT)"fiif[[-z"${USABLE_GIT}"]]thenabort"$(cat<<EOABORTTheversionofGitthatwasfounddoesnotsatisfyrequirementsforHomebrew.PleaseinstallGit${REQUIRED_GIT_VERSION}ornewerandaddittoyourPATH.EOABORT)"fiif[["${USABLE_GIT}"!=/usr/bin/git]]thenexportHOMEBREW_GIT_PATH="${USABLE_GIT}"ohai"FoundGit:${HOMEBREW_GIT_PATH}"fifiif!command-vcurl>/dev/nullthenabort"$(cat<<EOABORTYoumustinstallcURLbeforeinstallingHomebrew.See:${tty_underline}https://docs.brew.sh/Installation${tty_reset}EOABORT)"elif[[-n"${HOMEBREW_ON_LINUX-}"]]thenUSABLE_CURL="$(find_toolcurl)"if[[-z"${USABLE_CURL}"]]thenabort"$(cat<<EOABORTTheversionofcURLthatwasfounddoesnotsatisfyrequirementsforHomebrew.PleaseinstallcURL${REQUIRED_CURL_VERSION}ornewerandaddittoyourPATH.EOABORT)"elif[["${USABLE_CURL}"!=/usr/bin/curl]]thenexportHOMEBREW_CURL_PATH="${USABLE_CURL}"ohai"FoundcURL:${HOMEBREW_CURL_PATH}"fifiohai"DownloadingandinstallingHomebrew..."(cd"${HOMEBREW_REPOSITORY}">/dev/null||return#wedoitinfourstepstoavoidmergeerrorswhenreinstallingexecute"${USABLE_GIT}""-c""init.defaultBranch=master""init""--quiet"#"gitremoteadd"willfailiftheremoteisdefinedintheglobalconfigexecute"${USABLE_GIT}""config""remote.origin.url""${HOMEBREW_BREW_GIT_REMOTE}"execute"${USABLE_GIT}""config""remote.origin.fetch""+refs/heads/*:refs/remotes/origin/*"#ensurewedon'tmungelineendingsoncheckoutexecute"${USABLE_GIT}""config""--bool""core.autocrlf""false"#makesuresymlinksaresavedas-isexecute"${USABLE_GIT}""config""--bool""core.symlinks""true"if[[-z"${NONINTERACTIVE-}"]]thenquiet_progress=("--quiet""--progress")elsequiet_progress=("--quiet")firetry5"${USABLE_GIT}""fetch""${quiet_progress[@]}""--force""origin"retry5"${USABLE_GIT}""fetch""${quiet_progress[@]}""--force""--tags""origin"execute"${USABLE_GIT}""remote""set-head""origin""--auto">/dev/nullLATEST_GIT_TAG="$("${USABLE_GIT}"tag--list--sort="-version:refname"|head-n1)"if[[-z"${LATEST_GIT_TAG}"]]thenabort"FailedtoquerylatestHomebrew/brewGittag."fiexecute"${USABLE_GIT}""checkout""--quiet""--force""-B""stable""${LATEST_GIT_TAG}"if[["${HOMEBREW_REPOSITORY}"!="${HOMEBREW_PREFIX}"]]thenif[["${HOMEBREW_REPOSITORY}"=="${HOMEBREW_PREFIX}/Homebrew"]]thenexecute"ln""-sf""../Homebrew/bin/brew""${HOMEBREW_PREFIX}/bin/brew"elseabort"TheHomebrew/brewrepositoryshouldbeplacedintheHomebrewprefixdirectory."fifiif[[-n"${HOMEBREW_NO_INSTALL_FROM_API-}"&&!-d"${HOMEBREW_CORE}"]]then#Alwaysusesingle-quotedstringswith`exp`expressions#shellcheckdisable=SC2016ohai'Tappinghomebrew/corebecause`$HOMEBREW_NO_INSTALL_FROM_API`isset.'(execute"${MKDIR[@]}""${HOMEBREW_CORE}"cd"${HOMEBREW_CORE}">/dev/null||returnexecute"${USABLE_GIT}""-c""init.defaultBranch=master""init""--quiet"execute"${USABLE_GIT}""config""remote.origin.url""${HOMEBREW_CORE_GIT_REMOTE}"execute"${USABLE_GIT}""config""remote.origin.fetch""+refs/heads/*:refs/remotes/origin/*"execute"${USABLE_GIT}""config""--bool""core.autocrlf""false"execute"${USABLE_GIT}""config""--bool""core.symlinks""true"retry5"${USABLE_GIT}""fetch""--force""${quiet_progress[@]}"\"origin""refs/heads/master:refs/remotes/origin/master"execute"${USABLE_GIT}""remote""set-head""origin""--auto">/dev/nullexecute"${USABLE_GIT}""reset""--hard""origin/master"cd"${HOMEBREW_REPOSITORY}">/dev/null||return)||exit1fiexecute"${HOMEBREW_PREFIX}/bin/brew""update""--force""--quiet")||exit1if[[":${PATH}:"!=*":${HOMEBREW_PREFIX}/bin:"*]]thenwarn"${HOMEBREW_PREFIX}/binisnotinyourPATH.InstructionsonhowtoconfigureyourshellforHomebrewcanbefoundinthe'Nextsteps'sectionbelow."fiohai"Installationsuccessful!"echoring_bell#Useanextranewlineandboldtoavoidthisbeingmissed.ohai"Homebrewhasenabledanonymousaggregateformulaeandcaskanalytics."echo"$(cat<<EOS${tty_bold}Readtheanalyticsdocumentation(andhowtoopt-out)here:${tty_underline}https://docs.brew.sh/Analytics${tty_reset}Noanalyticsdatahasbeensentyet(norwillanybeduringthis${tty_bold}install${tty_reset}run).EOS)"ohai"Homebrewisrunentirelybyunpaidvolunteers.Pleaseconsiderdonating:"echo"$(cat<<EOS${tty_underline}https://github.com/Homebrew/brew#donations${tty_reset}EOS)"(cd"${HOMEBREW_REPOSITORY}">/dev/null||returnexecute"${USABLE_GIT}""config""--replace-all""homebrew.analyticsmessage""true"execute"${USABLE_GIT}""config""--replace-all""homebrew.caskanalyticsmessage""true")||exit1ohai"Nextsteps:"case"${SHELL}"in*/bash*)if[[-n"${HOMEBREW_ON_LINUX-}"]]thenshell_rcfile="${HOME}/.bashrc"elseshell_rcfile="${HOME}/.bash_profile"fi;;*/zsh*)if[[-n"${HOMEBREW_ON_LINUX-}"]]thenshell_rcfile="${ZDOTDIR:-"${HOME}"}/.zshrc"elseshell_rcfile="${ZDOTDIR:-"${HOME}"}/.zprofile"fi;;*/fish*)shell_rcfile="${HOME}/.config/fish/config.fish";;*)shell_rcfile="${ENV:-"${HOME}/.profile"}";;esacifgrep-qs"eval\"\$(${HOMEBREW_PREFIX}/bin/brewshellenv)\"""${shell_rcfile}"thenif![[-x"$(command-vbrew)"]]thencat<<EOS-RunthiscommandinyourterminaltoaddHomebrewtoyour${tty_bold}PATH${tty_reset}:eval"\$(${HOMEBREW_PREFIX}/bin/brewshellenv)"EOSfielsecat<<EOS-RunthesecommandsinyourterminaltoaddHomebrewtoyour${tty_bold}PATH${tty_reset}:echo>>${shell_rcfile}echo'eval"\$(${HOMEBREW_PREFIX}/bin/brewshellenv)"'>>${shell_rcfile}eval"\$(${HOMEBREW_PREFIX}/bin/brewshellenv)"EOSfiif[[-n"${non_default_repos}"]]thenplural=""if[["${#additional_shellenv_commands[@]}"-gt1]]thenplural="s"fiprintf--"-Runthesecommandsinyourterminaltoaddthenon-defaultGitremote%sfor%s:
""${plural}""${non_default_repos}"printf"echo'#Setnon-defaultGitremote%sfor%s.'>>%s
""${plural}""${non_default_repos}""${shell_rcfile}"printf"echo'%s'>>${shell_rcfile}
""${additional_shellenv_commands[@]}"printf"%s
""${additional_shellenv_commands[@]}"fiif[[-n"${HOMEBREW_ON_LINUX-}"]]thenecho"-InstallHomebrew'sdependenciesifyouhavesudoaccess:"if[[-x"$(command-vapt-get)"]]thenecho"sudoapt-getinstallbuild-essential"elif[[-x"$(command-vdnf)"]]thenecho"sudodnfgroupinstalldevelopment-tools"elif[[-x"$(command-vyum)"]]thenecho"sudoyumgroupinstall'DevelopmentTools'"elif[[-x"$(command-vpacman)"]]thenecho"sudopacman-Sbase-devel"elif[[-x"$(command-vapk)"]]thenecho"sudoapkaddbuild-base"ficat<<EOSFormoreinformation,see:${tty_underline}https://docs.brew.sh/Homebrew-on-Linux${tty_reset}-WerecommendthatyouinstallGCC:brewinstallgccEOSficat<<EOS-Run${tty_bold}brewhelp${tty_reset}togetstarted-Furtherdocumentation:${tty_underline}https://docs.brew.sh${tty_reset}EOS