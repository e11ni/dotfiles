#!/bin/bash

# Update and refresh keys
sudo -E pacman -Syyu --noconfirm && pacman-db-upgrade
sudo -E pacman -Fy && pacman-key --refresh-keys

# Install git
sudo -E pacman -S --noconfirm git

# Install go and tools
sudo -E pacman -S --noconfirm go go-tools

# Install yay - aur helper written on Go
git clone https://aur.archlinux.org/yay.git && \
    cd yay && \
    makepkg -si --noconfirm && \
    cd .. && \
    rm -rf yay && \
    sudo -E ln -s /usr/bin/yay /usr/bin/yaourt

# Install yadm
yay -S --noconfirm yadm-git

# Install vim
sudo -E pacman -S --noconfirm vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install zsh
sudo -E pacman -S --noconfirm zsh
chsh -s /bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sudo -E pacman -S --noconfirm powerline-fonts
sudo -E pacman -S --noconfirm zsh-completions

# Install and configure ssh
sudo -E pacman -S --noconfirm openssh
systemctl enable sshd.socket

# Install more utils
sudo -E pacman -S --noconfirm fzf fasd the_silver_searcher npm pandoc trash-cli jq httpie p7zip tar rsync mediainfo ffmpeg
npm install -g tldr how-2
yay -S --noconfirm yadm-git lnav-git doctoc pet-git ctop

# Install and config tmux
sudo -E pacman -S --noconfirm tmux tmuxp xclip
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
mkdir ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install JDK
sudo -E pacman -S --noconfirm jdk10-openjdk

# Install JS tools
npm install -g jshint

# Install debug tools
sudo -E pacman -S --noconfirm gdb valgrind strace htop

# Install python and tools
sudo -E pacman -S --noconfirm python python-pip
sudo -E pip install pep8 pylint rope
