#!/bin/bash
## dl from github and install -- bash_completions -- ####
dir="${BASH_COMPLETION_DIR:-"${XDG_DATA_HOME:-"$HOME/.local/share"}/bash-completion"}/completions"
mkdir -p "$dir"; 
curl -fSsL "https://raw.githubusercontent.com/imomaliev/tmux-bash-completion/master/completions/tmux" > "${dir?error: dir not set: you must run the previous commands first}/tmux"
source ~/.bashrc
