# Update 1.1
# Script finally working
curl -FsSL https://raw.githubusercontent.com/Norder1245/RAMM/refs/heads/main/RAMM.py > /usr/local/opt/ramm/RAMM.py
echo "alias ramm='python3 /usr/local/opt/ramm/RAMM.py'" >> ~/.bashrc
echo "alias ramm='python3 /usr/local/opt/ramm/RAMM.py'" >> ~/.zshrc
echo "alias ramm='python3 /usr/local/opt/ramm/RAMM.py'" >> ~/.config/fish/config.fish
