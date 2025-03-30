#/bin/bash
## LOADING_ANIMATIONS
loader() {
BLA_metro=( 0.1 \
'       ' \
'=      ' \
'==     ' \
'===    ' \
' ===   ' \
'  ===  ' \
'    ===' \
'     ==' \
'      =' \
'       ' \
'       ' \
'       ' \
'       ' \
'       ' \
)
##\e[0;40m
BLA_passing_dots=( 0.25 '.  ' '.. ' '...' ' ..' '  .' '   ' )
##
printf %b "\n\n\n\n\e[4A\e7"; 
printf %b "$(printf %b "\e[0;37m[ \e[0;3$((RANDOM%6+1))m")${frame}$(printf %b "\e[0;37m]$re ")"; 
printf %b "\e[12G\e[0K\e[2mLoading ... $1 $2 $3 $4" > $HOME/logs/load.log 2>/dev/null; printf %b "\e[0K\e[2m$(tail -n1 $HOME/logs/load.log 2>/dev/null)\e[0K\e8";
declare -a BLA_active_loading_animation; size=($(stty size));
BLA::play_loading_animation_loop() {
while true; do 
for frame in "${BLA_active_loading_animation[@]}"; do
# printf %b "\r\e[$((size/2));$((size[1]/2-8))H" \
printf %b "\e8\e7";
printf %b "$(printf %b "\e[0;37m[ \e[0;3$((RANDOM%6+1))m")${frame}$(echo -e "\e[0;37m]$re ")"
sleep "${BLA_loading_animation_frame_interval}"; done; printf %b "\e[0K\e[2m$(tail -n1 $HOME/logs/load.log 2>/dev/null)\e[0K\e8"; done; 
}

BLA::start_loading_animation() {
BLA_active_loading_animation=( "${@}" ); 
BLA_loading_animation_frame_interval="${BLA_active_loading_animation[0]}"; 
unset "BLA_active_loading_animation[0]"; 
printf %b "\e[0m"; tput civis;
BLA::play_loading_animation_loop & disown; printf %b "\eM"; 
# printf %b "\r\e[$((size/2-1));$((size[1]/2-8))H
# printf %b "\e[2;5;39mloading${re}... "; 
BLA_loading_animation_pid="${!}"; 
}
BLA::stop_loading_animation() {
kill "${BLA_loading_animation_pid}" &>/dev/null; 
# printf "\r\e[$((size/2-1));$((size[1]/2-8))H"
printf %b "\e8\e[0m[\e[0;32m  done  \e[0m]\n\n"; 
# echo -e "\e[0m\e[0K\n\eM\e[0K";
tput cnorm 2>/dev/null; 
}
trap BLA::stop_loading_animation SIGINT
BLA::start_loading_animation "${BLA_metro[@]}"
# printf %b "\b $1 "; 
$@ 2>/dev/null|tee -a $HOME/logs/load.log &>/dev/null;
# sleep 1; printf %b " almost ... \e[0K"; 
# sleep .2; printf %b "$green done!$re \e[0K"; 
BLA::stop_loading_animation
}
