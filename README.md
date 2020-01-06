# dotfiles
## Install Arch Linux scratches
Network setup ethernet
```sh
ip link set lo up
ip link set eno1 up
cp /etc/netctl/examples/ethernet-dhcp /etc/netctl/ethernet-dhcp
sed -i 's/eth0/eno1/g' /etc/netctl/ethernet-dhcp
netctl enable ethernet-dhcp
reboot
```

Install git and pull repo
```sh
pacman -S --noconfirm git
git clone --recurse-submodules https://github.com/e11ni/dotfiles.git ~/.dotfiles
```
