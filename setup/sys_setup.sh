# Update system
pacman -Syu --noconfirm

# Install video drivers
pacman -S --noconfirm mesa
pacman -S --noconfirm xf86-video-intel
pacman -S --noconfirm vulkan-intel

# Install latest kernel
pacman -S --noconfirm linux-lts
pacman -S --noconfirm linux-lts-headers

cp /boot/loader/entries/arch.conf /boot/loader/entries/arch-lts.conf
sed -i 's/-linux/-linux-lts/g' /boot/loader/entries/arch-lts.conf
sed -i 's/arch/arch-lts/g' /boot/loader/loader.conf

# Install desktop environment 
pacman -S --noconfirm sway

