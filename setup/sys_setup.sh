# Network setup
ip link set lo up
ip link set eno1 up
cp /etc/netctl/examples/ethernet-dhcp /etc/netctl/ethernet-dhcp
sed -i 's/eth0/eno1/g' /etc/netctl/ethernet-dhcp
netctl enable ethernet-dhcp

# Update systed
pacman -Syu --noconfirm

# Install video drivers
pacman -S --noconfirm mesa
pacman -S --noconfirm xf86-video-intel
pacman -S --noconfirm vulkan-intel

# Install latest kernel
pacman -S --noconfirm linux-lts
pacman -S --noconfirm linux-lts-headers

cp /boot/loader/entries/arch.conf /boot/loader/entries/arch-lts.conf
sed -i 's/linux/linux-lts/g' /boot/loader/entries/arch-lts.conf
sed -i 's/arch/arch-lts/g' /boot/loader/loader.conf

# Install desktop environment 
pacman -S --noconfirm xorg
pacman -S --noconfirm lightdm lightdm-gtk-greeter
pacman -S --noconfirm budgie-desktop
echo "export XDG_CURRENT_DESKTOP=Budgie:GNOME" >> ~/.xinitrc
echo "exec budgie-desktop" >> ~/.xinitrc
ln -s /usr/lib/systemd/system/lightdm.service /etc/systemd/system/display-manager.service
