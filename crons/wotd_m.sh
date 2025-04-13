#!/bin/env bash 
mkdir -p $HOME/tmp $HOME/logs/wotd 2>/dev/null; [ -z $PREFIX ]&& sudo=sudo; 
hash w3m 2>/dev/null || $sudo apt install -y w3m &>/dev/null; 
####
time="$(date +%y_%m_%d)"; wotmp="$HOME/tmp/wotd_${time}.log";
####
command w3m -dump https://www.merriam-webster.com/word-of-the-day > $wotmp; 
####
(printf %b 'printf -v "w_w" "'; cat $wotmp|sed -n 39p|\
cut -f1 -d" "|tr -d "\n"; printf %b '";'; echo; ) > $HOME/logs/wotd_m.sh; 
####
(printf %b 'printf -v "w_t" "'; cat $wotmp|sed -n 42p|\
cut -f1 -d" "|tr -d "\n"; printf %b '";'; echo; ) >> $HOME/logs/wotd_m.sh; 
####
(printf %b 'printf -v "w_p" "'; cat $wotmp|sed -n 42p|\
cut -f2- -d" "|tr -d "\n"; printf %b '";'; echo; ) >> $HOME/logs/wotd_m.sh; 
####
(printf %b 'printf -v "w_m" "'; cat $wotmp|sed -n 48,50p|\
tr -s "\n" " "; printf %b '";'; echo; ) >> $HOME/logs/wotd_m.sh; 
####
cat $HOME/logs/wotd_m.sh > $HOME/logs/wotd/wotd_m_${time}.sh; 
