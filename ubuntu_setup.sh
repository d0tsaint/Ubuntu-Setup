#!/usr/bin/env bash
# RUN THIS SCRIPT FROM YOUR HOME FOLDER

u="$USER"
cd

sudo apt update && sudo apt upgrade -y

# DEPENDENCIES AND GNOME STYLING
sudo apt install gnome-tweaks neovim gnome-shell-extensions dconf-editor node-typescript make git ufw -y

gsettings set org.gnome.shell enabled-extensions "['pop-shell@system76.com', 'user-theme@gnome-shell-extensions.gcampax.github.com'"
gsettings set org.gnome.shell disabled-extensions "['ubuntu-dock@ubuntu.com']"

mkdir .icons
wget https://raw.githubusercontent.com/whyd0t/Ubuntu-Setup/main/Dependencies/Inverse-black.tar.xz
tar -xf Inverse-black.tar.xz
rm Inverse-black.tar.xz && rm -rf Inverse-black-dark
mv Inverse-black .icons/
gsettings set org.gnome.desktop.interface icon-theme 'Inverse-black'

mkdir .themes
wget https://raw.githubusercontent.com/whyd0t/Ubuntu-Setup/main/Dependencies/Juno-palenight-v40.tar.xz
tar -xf Juno-palenight-v40.tar.xz 
rm Juno-palenight-v40.tar.xz
mv Juno-palenight-v40 .themes/
gsettings set org.gnome.desktop.interface gtk-theme "'Juno-palenight-v40'"
gsettings set org.gnome.shell.extensions.user-theme name "'Juno-palenight-v40'"

mkdir ~/Pictures/Wallpapers
wget https://raw.githubusercontent.com/whyd0t/Ubuntu-Setup/main/Dependencies/DarkMountain.jpg
mv DarkMountain.jpg ~/Pictures/Wallpapers/
gsettings set org.gnome.desktop.background picture-uri "'file:///home/$u/Pictures/Wallpapers/DarkMountain.jpg'"

git clone https://github.com/pop-os/shell
cd shell
make local-install
cd ..
rm -rf shell

sudo ufw enable

# SHORTCUTS
for i in {1..9}; do gsettings set org.gnome.shell.keybindings switch-to-application-$i "[]";done
for i in {1..9}; do gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-$i "['<Super>$i']";done
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-1 "['<Shift><Super>exclam']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-2 "['<Shift><Super>quotedbl']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-3 "['<Shift><Super>numbersign']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-4 "['<Shift><Super>currency']"
gsettings set org.gnome.desktop.wm.keybindings close "['<Super>q', '<Alt>F4']"


# SUBLIME DEPENDENCIES
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
mkdir -p apps/app-icons


# INSTALL APPLICATIONS
sudo apt-get update
sudo apt-get install sublime-text virt-manager docker.io wireshark torbrowser-launcher vlc htop terminator -y

mkdir ~/.config/terminator
cat << OEF > ~/.config/terminator/config
[global_config]
  title_transmit_fg_color = "#2E3440"
  title_transmit_bg_color = "#88C0D0"
  title_receive_fg_color = "#2E3440"
  title_receive_bg_color = "#8FBCBB"
  title_inactive_fg_color = "#D8DEE9"
  title_inactive_bg_color = "#4C566A"
[keybindings]
  split_horiz = <Primary><Shift>k
  split_vert = <Primary><Shift>l
  close_window = <Primary><Shift><Alt>q
[profiles]
  [[default]]
    background_color = "#2E3440"
    background_darkness = 1.0
    background_type = transparent
    cursor_color = "#D8DEE9"
    foreground_color = "#D8DEE9"
    show_titlebar = False
    palette = "#3b4252:#bf616a:#a3be8c:#ebcb8b:#81a1c1:#b48ead:#88c0d0:#e5e9f0:#4c566a:#bf616a:#a3be8c:#ebcb8b:#81a1c1:#b48ead:#8fbcbb:#eceff4"
[layouts]
  [[default]]
    [[[window0]]]
      type = Window
      parent = ""
    [[[child1]]]
      type = Terminal
      parent = window0
[plugins]
OEF

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
