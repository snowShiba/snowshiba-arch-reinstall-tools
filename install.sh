FILE=./complete

if test -f "$FILE"; then
  # Enable Extensions
  gnome-extensions enable AlphabeticalAppGrid@stuarthayhurst
  gnome-extensions enable trayIconsReloaded@selfmade.pl
  gnome-extensions enable just-perfection-desktop@just-perfection
  gnome-extensions enable dash-to-dock@micxgx.gmail.com

  # Configure Just Perfection Extension
  dconf write /org/gnome/shell/extensions/just-perfection/workspace-background-corner-size 1
  dconf write /org/gnome/shell/extensions/just-perfection/clock-menu-position 1
  dconf write /org/gnome/shell/extensions/just-perfection/clock-menu-position-offset 9
  dconf write /org/gnome/shell/extensions/just-perfection/window-picker-icon false
  dconf write /org/gnome/shell/extensions/just-perfection/aggregate-menu false
  dconf write /org/gnome/shell/extensions/just-perfection/power-icon false

  # Configure Dash to Dock Extension
  dconf write /org/gnome/shell/extensions/dash-to-dock/force-straight-corner true
  dconf write /org/gnome/shell/extensions/dash-to-dock/intellihide-mode "'FOCUS_APPLICATION_WINDOWS'"
  dconf write /org/gnome/shell/extensions/dash-to-dock/show-delay 0.0
  dconf write /org/gnome/shell/extensions/dash-to-dock/hide-delay 0.0
  dconf write /org/gnome/shell/extensions/dash-to-dock/require-pressure-to-show false
  dconf write /org/gnome/shell/extensions/dash-to-dock/multi-monitor true
  dconf write /org/gnome/shell/extensions/dash-to-dock/dash-max-icon-size 32
  dconf write /org/gnome/shell/extensions/dash-to-dock/show-mounts false
  dconf write /org/gnome/shell/extensions/dash-to-dock/show-apps-at-top true
  dconf write /org/gnome/shell/extensions/dash-to-dock/custom-theme-shrink true

  echo
  echo Script completed! Remember to login and configure NordVPN!
  echo
  
else
  # Backup Pacman Config
  sudo cp /etc/pacman.conf /etc/pacman.conf.bak

  # Move New Pacman Config
  sudo mv ./configs/pacman.conf /etc/pacman.conf

  #Backup bashrc
  cp ~/.bashrc ~/.bashrc.bak

  #Move New bashrc
  mv ./configs/.bashrc ~/.bashrc

  # Update System
  sudo pacman --noconfirm -Syu

  # Install steam, geary, man, git and discord
  sudo pacman --noconfirm -S git man-db discord geary steam

  # Install yay
  cd ~/Downloads/
  git clone https://aur.archlinux.org/yay-bin.git
  cd yay-bin/
  makepkg -is

  # Install ani-cli, pfetch Brave, Minecraft, Timeshift, NordVPN and qView
  yay -S brave-bin minecraft-launcher timeshift-bin nordvpn-bin qview ani-cli-git pfetch

  # Enable NordVPN
  sudo systemctl enable --now nordvpnd
  sudo usermod -aG nordvpn $USER

  # Enable User Theme and Places Menu Extension
  gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com
  gnome-extensions enable places-menu@gnome-shell-extensions.gcampax.github.com

  # Install and Enable Qogir Theme
  cd ~/Downloads/
  git clone https://github.com/vinceliuice/Qogir-theme.git
  cd Qogir-theme/
  sudo ./install.sh -l arch -g -c dark --tweaks square -t default
  gsettings set org.gnome.shell.extensions.user-theme name Qogir-dark
  gsettings set org.gnome.desktop.interface gtk-theme Qogir-dark

  # Install and Enable WhiteSur Icon Theme
  cd ~/Downloads/
  git clone https://github.com/vinceliuice/WhiteSur-icon-theme
  cd WhiteSur-icon-theme/
  ./install.sh -b
  gsettings set org.gnome.desktop.interface icon-theme WhiteSur

  # Install Dash to Dock Extension
  cd ~/Downloads/
  git clone https://github.com/micheleg/dash-to-dock.git
  cd dash-to-dock/
  make
  make install

  # Install Alphabetical Grid Extension
  cd ~/Downloads/
  git clone https://github.com/stuarthayhurst/alphabetical-grid-extension.git
  cd alphabetical-grid-extension/
  make build
  make install

  # Install Just Perfection Extension
  cd ~/Downloads/
  git clone https://gitlab.gnome.org/jrahmatzadeh/just-perfection.git
  cd just-perfection/
  ./scripts/build.sh -i

  # Install Tray Icons Reloaded Extension
  cd ~/.local/share/gnome-shell/extensions/
  git clone https://github.com/MartinPL/Tray-Icons-Reloaded.git
  mv ./Tray-Icons-Reloaded ./trayIconsReloaded@selfmade.pl

  # Install Nuclear v0.6.16
  sudo mkdir -p /opt/.AppImages/Nuclear/
  cd /opt/.AppImages/Nuclear/
  sudo wget "https://raw.githubusercontent.com/nukeop/nuclear/master/build/icons/512x512.png" -O Nuclear.png
  sudo wget "https://github.com/nukeop/nuclear/releases/download/v0.6.16/nuclear-v0.6.16.AppImage" -O Nuclear.AppImage
  sudo chmod +x Nuclear.AppImage
  cd ~/Downloads/snowshiba-arch-reinstall-tools/desktop\ files/
  chmod +x nuclear.desktop
  sudo desktop-file-install nuclear.desktop

  # Install BitWarden
  sudo mkdir -p /opt/.AppImages/BitWarden
  cd /opt/.AppImages/BitWarden
  sudo wget "https://avatars.githubusercontent.com/u/15990069?s=200&v=4" -O BitWarden.png
  sudo wget "https://github.com/bitwarden/desktop/releases/download/v1.29.1/Bitwarden-1.29.1-x86_64.AppImage" -O BitWarden.AppImage
  sudo chmod +x BitWarden.AppImage
  cd ~/Downloads/snowshiba-arch-reinstall-tools/desktop\ files/
  chmod +x bitwarden.desktop
  sudo desktop-file-install bitwarden.desktop

  # Install Etcher
  sudo mkdir -p /opt/.AppImages/Etcher
  cd /opt/.AppImages/Etcher
  sudo wget "https://raw.githubusercontent.com/balena-io/etcher/master/assets/iconset/512x512.png" -O Etcher.png
  sudo wget "https://github.com/balena-io/etcher/releases/download/v1.7.1/balenaEtcher-1.7.1-x64.AppImage" -O Etcher.AppImage
  sudo chmod +x Etcher.AppImage
  cd ~/Downloads/snowshiba-arch-reinstall-tools/desktop\ files/
  chmod +x etcher.desktop
  sudo desktop-file-install etcher.desktop

  # Uninstall Bloat
  sudo pacman --noconfirm -Rs gnome-contacts gnome-clocks gnome-maps gnome-books gnome-photos gnome-boxes gnome-software cheese htop vim

  # Create completion file
  cd ~/Downloads/snowshiba-arch-reinstall-tools/
  touch ./complete

  echo
  echo Please logout and re-run the script to finish!
  echo
fi
