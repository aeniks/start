#!/bin/bash
## download and run tmux-completions
curl -fSsL "https://raw.githubusercontent.com/imomaliev/tmux-bash-completion/master/completions/tmux" > ~/.bash.tmux-bash-completion
echo 'source ~/.bash.tmux-bash-completion' >> ~/.bashrc
source ~/.bashrc # load it for your current session
