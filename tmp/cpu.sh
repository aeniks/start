
cpu="$(lscpu |grep "Model name"|tr -s "\t" " "|cut -f3- -d" ")"; 
