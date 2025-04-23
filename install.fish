#!/usr/bin/env fish
# RAMM Installer v1.2.1 😺

# Handle flags
if test (count $argv) -gt 0
    if test $argv[1] = "-p" -o $argv[1] = "--pull"
        git pull
        echo "✅ Updated RAMM Installer"
        exit
    end

    if test $argv[1] = "-f" -o $argv[1] = "-FireInTheHole"
        echo "🔥🔥🔥 FIRE IN THE HOLE! 🔥🔥🔥"
        sleep 1
        sudo reboot
    end
end

# Install location
set install_dir /usr/local/opt/ramm
set script_path $install_dir/RAMM.py

echo "📦 Installing RAMM to $script_path..."

# Create directory if needed
sudo mkdir -p $install_dir

# Download RAMM.py
curl -FsSL https://raw.githubusercontent.com/Norder1245/RAMM/refs/heads/main/RAMM.py | sudo tee $script_path > /dev/null
sudo chmod +x $script_path

# Create symlink
sudo ln -sf $script_path /usr/local/bin/ramm

echo "✅ RAMM installed!"
echo "📂 Path: $script_path"
echo "⚙️  Symlinked as: /usr/local/bin/ramm"
echo "▶️ Run using: 'ramm'"
echo "💥 Self-destruct enabled: 'ramm --self-destruct'"

# Self-destruct code injection (if not already there)
if not grep -q "# --self-destruct" $script_path
    echo "🛠 Injecting self-destruct code..."
    echo "" | sudo tee -a $script_path > /dev/null
    echo "# --self-destruct" | sudo tee -a $script_path > /dev/null
    echo "import os, sys" | sudo tee -a $script_path > /dev/null
    echo "if '--self-destruct' in sys.argv:" | sudo tee -a $script_path > /dev/null
    echo "    print('💣 RAMM is self-destructing...')" | sudo tee -a $script_path > /dev/null
    echo "    os.remove(__file__)" | sudo tee -a $script_path > /dev/null
    echo "    os.remove('/usr/local/bin/ramm')" | sudo tee -a $script_path > /dev/null
    echo "    sys.exit(0)" | sudo tee -a $script_path > /dev/null
end

echo "🎉 Installer complete!"
exit
