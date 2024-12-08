#!/bin/bash

dex $HOME/.config/autostart/arcolinux-welcome-app.desktop &
$HOME/.config/nimdow/nimdowstatus/NimdowStatus &

# keyboard
# setxkbmap be

# xrandr --output VGA-1 --primary --mode 1360x768 --pos 0x0 --rotate normal
# xrandr --output HDMI2 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off
# xrandr --output eDP-1 --primary --mode 1368x768 --pos 0x0 --rotate normal --output DP-1 --off --output HDMI-1 --off --output DP-2 --off --output HDMI-2 --off
# xrandr --output LVDS1 --mode 1366x768 --output DP3 --mode 1920x1080 --right-of LVDS1
# xrandr --output DVI-I-0 --right-of HDMI-0 --auto
# xrandr --output DVI-1 --right-of DVI-0 --auto
# xrandr --output DVI-D-1 --right-of DVI-I-1 --auto
# xrandr --output HDMI2 --right-of HDMI1 --auto
# autorandr horizontal

nm-applet &
pamac-tray &
variety &
xfce4-power-manager &
blueberry-tray &
/usr/lib/xfce4/notifyd/xfce4-notifyd &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

#picom -b  --config ~/.config/nimdow/picom.conf &
picom &
numlockx on &
volumeicon &
sxhkd -c ~/.config/nimdow/sxhkd/sxhkdrc &
# "nitrogen --restore"
conky -c $HOME/.config/nimdow/system-overview &
#you can set wallpapers in themes as well
# feh --bg-fill /usr/share/backgrounds/archlinux/arch-wallpaper.jpg &
feh --bg-fill /usr/share/backgrounds/arco/arco-wallpaper.jpg &

# applications from startup

# insync start &
# spotify &
# ckb-next -b &
# discord & 
# telegram-desktop &
