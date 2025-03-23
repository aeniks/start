mkdir -p -m 775 $PREFIX/usr/share/figlet 2>/dev/null||\
sudo mkdir -p -m 775 $PREFIX/usr/share/figlet 2>/dev/null; 
cp $HOME/start/config/figlet/fonts/* $PREFIX/usr/share/figlet/ 2>/dev/null||\
sudo cp $HOME/start/config/figlet/fonts/* $PREFIX/usr/share/figlet/ 2>/dev/null; 
sudo chmod 775 $PREFIX/usr/share/figlet -R 2>/dev/null; 
