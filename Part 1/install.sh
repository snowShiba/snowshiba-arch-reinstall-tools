echo
echo Installing git, discord, discord-canary, dkms...
echo

sudo pacman -S git discord discord-canary dkms

echo
echo Installed git, discord, discord-canary, dkms
echo Installing brave, minecraft-launcher, nordvpn, qview, timeshift, vmware-keymaps, vmware-workstation, linux-headers...
echo

cd ~/Downloads/
git clone https://aur.archlinux.org/brave-bin.git
cd brave-bin/
makepkg -is

git clone https://aur.archlinux.org/minecraft-launcher.git
cd minecraft-launcher/
makepkg -is

git clone https://aur.archlinux.org/nordvpn-bin.git
cd nordvpn-bin/
makepkg -is
sudo systemctl enable --now nordvpnd
sudo usermod -aG nordvpn $USER

git clone https://aur.archlinux.org/qview.git
cd qview/
makepkg -is

git clone https://aur.archlinux.org/timeshift-bin.git
cd timeshift-bin/
makepkg -is

git clone https://aur.archlinux.org/vmware-keymaps.git
cd vmware-keymaps/
makepkg -is

git clone https://aur.archlinux.org/vmware-workstation.git
cd vmware-workstation/
makepkg -is

sudo pacman -S linux-headers
sudo modprobe -a vmw_vmci vmmon

echo
echo Installed brave, minecraft-launcher, nordvpn, qview, timeshift, vmware-keymaps, vmware-workstation, linux-headers
echo Enabling user-theme
echo

gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com

echo
echo Enabled user-themes
echo Installing Qogir-theme...
echo

git clone https://github.com/vinceliuice/Qogir-theme.git
cd Qogir-theme
sudo ./install.sh -l arch -g -c dark --tweaks square -t default
gsettings set org.gnome.shell.extensions.user-theme name Qogir-dark
gsettings set org.gnome.desktop.interface gtk-theme Qogir-dark

echo
echo Installed Qogir-theme
echo Installing WhiteSur-icon-theme...
echo

git clone https://github.com/vinceliuice/WhiteSur-icon-theme
cd WhiteSur-icon-theme/
./install.sh -b
gsettings set org.gnome.desktop.interface icon-theme WhiteSur

echo
echo Installed WhiteSur-icon-theme
echo Enabling places-menu
echo

gnome-extensions enable places-menu@gnome-shell-extensions.gcampax.github.com

echo
echo Enabled places-menu
echo Installing dash-to-dock, alphabetical-grid-extension, just-perfection, tray-icons-reloaded...
echo

git clone https://github.com/micheleg/dash-to-dock.git
cd dash-to-dock/
make
make install

git clone https://github.com/stuarthayhurst/alphabetical-grid-extension.git
cd alphabetical-grid-extension/
make build
make install

git clone https://gitlab.gnome.org/jrahmatzadeh/just-perfection.git
cd just-perfection/
./scripts/build.sh -i

cd ~/.local/share/gnome-shell/extensions/
git clone https://github.com/MartinPL/Tray-Icons-Reloaded.git
mv ./Tray-Icons-Reloaded ./trayIconsReloaded@selfmade.pl

echo
echo Installed dash-to-dock, alphabetical-grid-extension, just-perfection, tray-icons-reloaded
echo Part 1 complete! Please reboot and run the installer script in the Part 2 directory!
echo
