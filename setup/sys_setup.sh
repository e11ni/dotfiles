# Update system
pacman -Syu --noconfirm

# Install video drivers
pacman -S --noconfirm mesa vulkan-intel libva-intel-driver

# Install latest kernel and update bootloader
pacman -S --noconfirm linux-lts linux-lts-headers

cp /boot/loader/entries/arch.conf /boot/loader/entries/arch-lts.conf
sed -i 's/-linux/-linux-lts/g' /boot/loader/entries/arch-lts.conf
sed -i 's/arch/arch-lts/g' /boot/loader/loader.conf

# Refresh keys and sync database
pacman -Fy
pacman-key --refresh-keys

# Add user
useradd petrmali
passwd petrmali
mkhomedir_helper petrmali
usermod -aG wheel petrmali

# Allow users from wheel group run commands using sudo
sed -i 's/# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/g' /etc/sudoers

# Install Wayland Sway window manager
pacman -S --noconfirm sway

# Install X i3 windox manager
pacman -S --noconform xorg xorg-server xorg-xinit i3 archinux-wallpaper
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

# Install yay - aur helper written on Go
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay
sudo ln -s /usr/bin/yay /usr/bin/yaourt

# Install vim
sudo pacman -S --noconfirm vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install zsh
sudo pacman -S --noconfirm  zsh
zsh
chsh -s /bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sudo pacman -S --noconfirm powerline-fonts
sudo pacman -S --noconfirm zsh-completions

# Install ssh and config xforwarding
sudo pacman -S --noconfirm  openssh xorg-xauth xorg-xhost
sudo sed -i 's/#X11Forwarding no/X11Forwarding yes/g' /etc/ssh/sshd_config
systemctl enable sshd.socket

# Install cmd utils
sudo pacman -S --noconfirm  fzf fasd the_silver_searcher npm pandoc trash-cli jq httpie hub p7zip unrar tar rsync
sudo npm install -g tldr how-2 jshint
yay -S --noconfirm yadm-git lf-git lnav-git doctoc pet-git ctop
go get -u github.com/nishanths/license

# Install X utils
sudo pacman -S --noconfirm meld code wireshark-qt feh
sudo pacman -S --noconfirm vlc libreoffice pinta conky
yay -S --noconfirm copyq

# Install JDK
sudo pacman -S --noconfirm jdk10-openjdk

# Install Go and tools
sudo pacman -S --noconfirm go go-tools
go get -v github.com/ramya-rao-a/go-outline

# Config git
git config --global user.name "Petr Maliarov"
git config --global user.email "petr.maliarov@gmail.com"

# Install and config tmux
sudo pacman -S --noconfirm tmux tmuxp xclip
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
mkdir ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install internet apps
sudo pacman -S --noconfirm min telegram-desktop noto-fonts ttf-croscore otf-fira-code
yay -S --noconfirm google-chrome whatsapp-web-desktop slack chrome-remote-desktop
sudo cp ~/.dotfiles/setup/fonts_local.conf /etc/fonts/local.conf

# Install docker
sudo pacman -S --noconfirm docker docker-compose
sudo usermod -aG wheel petrmali
sudo systemctl enable docker

# Do not forget yadm sync
