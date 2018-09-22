# Update system
pacman -Syu --noconfirm

# Install video drivers
pacman -S --noconfirm mesa vulkan-intel libva-intel-driver

# Install latest kernel and update bootloader
pacman -S --noconfirm linux-lts linux-lts-headers

cp /boot/loader/entries/arch.conf /boot/loader/entries/arch-lts.conf
sed -i 's/-linux/-linux-lts/g' /boot/loader/entries/arch-lts.conf
sed -i 's/arch/arch-lts/g' /boot/loader/loader.conf

# Install vim
pacman -S --noconfirm vim

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

# Install some X utils
pacman -Fy
pacman-key --refresh-keys
pacman -S --noconfirm vlc libreoffice p7zip unrar tar rsync pinta conky
pacman -S --noconfirm termite rofi
yay -S --noconfirm ttf-iosevka-pack stacer

# Install yay - aur helper written on Go
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay
sudo ln -s /usr/bin/yay /usr/bin/yaourt

# Install zsh
pacman -S --noconfirm  zsh
zsh
chsh -s /bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sudo pacman -S --noconfirm powerline-fonts
sudo pacman -S --noconfirm zsh-completions

# Install cmd utils
sudo pacman -S --noconfirm  fzf fasd the_silver_searcher npm pandoc trash-cli jq httpie hub
sudo npm install -g tldr how-2 jshint
yay -S --noconfirm yadm-git lf-git lnav-git doctoc pet-git ctop
go get -u github.com/nishanths/license

# Install X utils
sudo pacman -S --noconfirm meld code wireshark-qt feh
yay -S --noconfirm copyq

# Install JDK
sudo pacman -S --noconfirm jdk10-openjdk

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
sudo pacman -S --noconfirm min telegram-desktop noto-fonts ttf-croscore
yay -S --noconfirm google-chrome whatsapp-web-desktop slack chrome-remote-desktop
sudo cp ~/.dotfiles/setup/fonts_local.conf /etc/fonts/local.conf

# Install docker
sudo pacman -S --noconfirm docker docker-compose
sudo usermod -aG wheel petrmali
sudo systemctl enable docker

# Do not forget yadm sync
