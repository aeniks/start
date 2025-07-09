12ssh_fix() { 
chown $USER: $HOME/.ssh -R; chmod 700 $HOME/.ssh; chmod 600 $HOME/.ssh/*; chmod 644 $HOME/.ssh/*.pub; ls -pal --color=always $HOME/.ssh;   
}; 
