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
