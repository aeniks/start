
fin() { local IFS=$'\n \t'; unset -v gg cm fin fw fh; if [ $1 ]; then cm="printf %b"; fin=($*); else cm='ls'; fin='./'; fi; fw=$($cm ${fin[*]}|wc --max-line-length); [ $1 ]&& gg=' + 1'; fh=$($cm "${fin[*]}"|wc --lines); $cm "${fin[*]}"|fzf --tmux "$((fw + 6)),$((fh + 3$gg))";   }; 
