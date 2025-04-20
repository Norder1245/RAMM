import os
import shutil
import tkinter as tk
from tkinter import filedialog, messagebox
# Set paths for Roblox assets (adjust if your setup is different)
roblox_assets_path = os.path.expanduser("/Applications/Roblox.app/Contents/Resources/content/")
backup_folder = os.path.join(os.getcwd(), 'backups')

# Ensure backups directory exists
if not os.path.exists(backup_folder):
    os.makedirs(backup_folder)

# Function to backup original assets
def backup_assets():
    if not os.path.exists(roblox_assets_path):
        messagebox.showerror("Error", "Roblox assets folder not found!")
        return

    backup_path = os.path.join(backup_folder, 'original-assets')
    if not os.path.exists(backup_path):
        shutil.copytree(roblox_assets_path, backup_path)
        messagebox.showinfo("Backup", "Assets have been backed up!")
    else:
        messagebox.showinfo("Backup", "Assets are already backed up.")

# Function to restore original assets
def restore_assets():
    backup_path = os.path.join(backup_folder, 'original-assets')
    if not os.path.exists(backup_path):
        messagebox.showerror("Error", "Backup not found! Please back up assets first.")
        return
    shutil.rmtree(roblox_assets_path)
    shutil.copytree(backup_path, roblox_assets_path)
    messagebox.showinfo("Restore", "Assets have been restored to original.")

# Function to install modpack (drag-and-drop zip)
def install_modpack():
    modpack_path = filedialog.askdirectory(title="Select Modpack Folder")
    if not modpack_path:
        return

    # Assuming the modpack is a folder of assets
    try:
        for item in os.listdir(modpack_path):
            s = os.path.join(modpack_path, item)
            d = os.path.join(roblox_assets_path, item)
            if os.path.isdir(s):
                shutil.copytree(s, d, dirs_exist_ok=True)
            else:
                shutil.copy2(s, d)
        messagebox.showinfo("Install", "Modpack installed successfully!")
    except Exception as e:
        messagebox.showerror("Error", f"Error installing modpack: {str(e)}")

# GUI Setup
root = tk.Tk()
root.title("Roblox Asset Mod Manager")
root.geometry("400x300")

# Create buttons and actions
backup_button = tk.Button(root, text="Backup Assets", command=backup_assets)
backup_button.pack(pady=10)

restore_button = tk.Button(root, text="Restore Assets", command=restore_assets)
restore_button.pack(pady=10)

install_button = tk.Button(root, text="Install Modpack", command=install_modpack)
install_button.pack(pady=10)

# Run the GUI
root.mainloop()
# & This script was made by SAnyper2 & #