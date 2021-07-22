#!/bin/bash
# Update system
set -e
pacman -Syu --noconfirm

# Install video drivers
pacman -S --noconfirm mesa vulkan-intel libva-intel-driver

# Install latest kernel and update bootloader
pacman -S --noconfirm linux-lts linux-lts-headers

# cp /boot/loader/entries/arch.conf /boot/loader/entries/arch-lts.conf
# sed -i 's/-linux/-linux-lts/g' /boot/loader/entries/arch-lts.conf
# sed -i 's/arch/arch-lts/g' /boot/loader/loader.conf
grub-mkconfig -o /boot/grub/grub.cfg

# Refresh keys and sync database
pacman -Fy && pacman-key --refresh-keys

# Add user
useradd petrmali
passwd petrmali
mkhomedir_helper petrmali
usermod -aG wheel petrmali

# Allow users from wheel group run commands using sudo
sed -i 's/# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/g' /etc/sudoers

# Install X i3 windox manager
pacman -S --noconform xorg xorg-server xorg-xinit i3 archlinux-wallpaper
Xorg :0 -configure
cp ~/xorg.conf.new /etc/X11/xorg.conf && rm ~/xorg.conf.new

# Install launcher
pacman -S --noconfirm rofi

# Install terminal emulator
# https://github.com/thestinger/termite/blob/master/README.rst
# https://wiki.archlinux.org/index.php/termite
pacman -S --noconfirm termite adobe-source-code-pro-fonts

# Install audio utils
sudo pacman -S --noconfirm pulseaudio pavucontrol

# Install and config xforwarding
sudo pacman -S --noconfirm xorg-xauth xorg-xhost
sudo sed -i 's/#X11Forwarding no/X11Forwarding yes/g' /etc/ssh/sshd_config

# Install X utils
sudo pacman -S --noconfirm code wireshark-qt feh
sudo pacman -S --noconfirm vlc libreoffice pinta conky

# Install internet apps
sudo pacman -S --noconfirm min telegram-desktop noto-fonts ttf-croscore otf-fira-code
yay -S --noconfirm google-chrome slack chrome-remote-desktop
sudo cp ~/.dotfiles/setup/fonts_local.conf /etc/fonts/local.conf

# Install docker
sudo usermod -aG wheel petrmali
sudo systemctl enable docker

# Do not forget yadm sync
