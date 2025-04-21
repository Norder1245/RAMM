# Update 1.2
if $1 == "-p" or $1 == "--pull"
    git pull
    echo "Updated RAMM Installer"
end
if $1 == "-f" or $1 == "-FireInTheHole"
    echo "FIRE IN THE HOLE!"
    sleep 1
    sudo reboot 
end
curl -FsSL https://raw.githubusercontent.com/Norder1245/RAMM/refs/heads/main/RAMM.py > /usr/local/opt/ramm/RAMM.py
echo "alias ramm='python3 /usr/local/opt/ramm/RAMM.py'" >> ~/.bashrc
echo "alias ramm='python3 /usr/local/opt/ramm/RAMM.py'" >> ~/.zshrc
echo "alias ramm='python3 /usr/local/opt/ramm/RAMM.py'" >> ~/.config/fish/config.fish
