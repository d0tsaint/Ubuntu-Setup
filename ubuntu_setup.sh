#!/usr/bin/env bash
# RUN THIS SCRIPT FROM YOUR HOME FOLDER

sudo apt update && sudo apt upgrade -y

# GNOME STYLING
sudo apt install gnome-tweaks neovim gnome-shell-extensions dconf-editor node-typescript make git

mkdir .icons
wget https://raw.githubusercontent.com/whyd0t/Ubuntu-Setup/main/Inverse-black.tar.xz
tar -xf Inverse-black.tar.xz
rm Inverse-black.tar.xz && rm -rf Inverse-black-dark
mv Inverse-black .icons
gsettings set org.gnome.desktop.interface icon-theme 'Inverse-black'


# SHORTCUTS
for i in {1..9}; do gsettings set org.gnome.shell.keybindings switch-to-application-$i "[]";done
for i in {1..9}; do gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-$i "['<Super>$i']";done
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-1 "['<Shift><Super>exclam']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-2 "['<Shift><Super>quotedbl']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-3 "['<Shift><Super>numbersign']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-4 "['<Shift><Super>currency']"
gsettings set org.gnome.desktop.wm.keybindings close "['<Super>q', '<Alt>F4']"


# DEPENDENCIES
u="$USER"
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
mkdir -p apps/app-icons


# INSTALL APPLICATIONS
sudo apt-get update
sudo apt-get install sublime-text install virt-manager docker.io wireshark
wget https://github.com/rizinorg/cutter/releases/download/v2.0.5/Cutter-v2.0.5-x64.Linux.AppImage
chmod +x Cutter-v2.0.5-x64.Linux.AppImage
mv Cutter-v2.0.5-x64.Linux.AppImage apps
wget https://cutter.re/assets/images/cutter-small.svg
mv cutter-small.svg apps/app-icons
cat << OEF > ~/.local/share/applications/cutter.desktop
[Desktop Entry]
Name=Cutter
Comment=Cutter Reverse Engineering Toolkit
Exec=/home/$u/apps/Cutter-v2.0.5-x64.Linux.AppImage
Icon=/home/$u/apps/app-icons/cutter-small.svg
Terminal=false
Type=Application
Categories=Development
OEF

wget https://github.com/marktext/marktext/releases/download/v0.16.3/marktext-x86_64.AppImage
chmod +x marktext-x86_64.AppImage
mv marktext-x86_64.AppImage apps
wget https://raw.githubusercontent.com/marktext/marktext/develop/static/logo-small.png
mv logo-small.png apps/app-icons/marktext-small.png
cat << OEF > ~/.local/share/applications/marktext.desktop
[Desktop Entry]
Name=MarkText
Comment=MarkText Markdown editor
Exec=/home/$u/apps/marktext-x86_64.AppImage
Icon=/home/$u/apps/app-icons/marktext.small.png
Terminal=false
Type=Application
Categories=Development
OEF