#!/bin/bash
set -e

# Update base
sudo -E pacman -Syyu --noconfirm && sudo -E pacman-db-upgrade

# Install git
sudo -E pacman -S --noconfirm git

# Install go and tools
sudo -E pacman -S --noconfirm go go-tools

# Install essentials
sudo -E pacman -S --noconfirm base-devel

# Install yay - aur helper written on Go
git clone https://aur.archlinux.org/yay.git && \
    cd yay && \
    makepkg -si --noconfirm && \
    cd .. && \
    rm -rf yay && \
    sudo -E ln -s /usr/bin/yay /usr/bin/yaourt

# Install yadm
yay -S --noconfirm yadm-git
yadm clone https://github.com/e11ni/dotfiles.git

# Install more utils
sudo -E pacman -S --noconfirm fzf gawk fasd the_silver_searcher npm pandoc jq httpie p7zip tar rsync openssh dos2unix mediainfo ffmpeg lnav xdg-utils alsa-utils docker docker-compose networkmanager mpc
sudo -E npm install -g npm
sudo -E npm install -g tldr how-2 editorconfig
yay -S --noconfirm doctoc pet-bin ctop-bin clipster

# Install vim
sudo -E pacman -S --noconfirm vim
git clone https://github.com/morhetz/gruvbox.git ~/.vim/pack/default/start/gruvbox
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
dos2unix .vimrc
vim +'PlugInstall --sync' +qa > /dev/null

# Install zsh
sudo -E pacman -S --noconfirm zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --keep-zshrc
sudo -E pacman -S --noconfirm powerline-fonts
sudo -E pacman -S --noconfirm zsh-completions
sudo chsh -s $(which zsh) $USER
dos2unix .zshrc
git clone https://github.com/zplug/zplug ~/.zplug
zsh -c "source ~/.zplug/init.zsh && zplug update"

# Install and config tmux
sudo -E pacman -S --noconfirm tmux tmuxp xclip
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
mkdir ~/.tmux/plugins && git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
dos2unix .tmux.conf.local
~/.tmux/plugins/tpm/bin/install_plugins

# Install JDK
sudo -E pacman -S --noconfirm jdk-openjdk

# Install JS tools
sudo -E npm install -g jshint

# Install debug tools
sudo -E pacman -S --noconfirm gdb valgrind strace htop

# Install python and tools
sudo -E pacman -S --noconfirm python python-pip
sudo -E pip install pep8 flake8 pylint rope
