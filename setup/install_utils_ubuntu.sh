#!/bin/bash
set -e

# Update base
sudo -E apt update && sudo -E apt upgrade

# Install git
sudo -E apt-get install -y git

# Install go and tools
sudo -E apt-get install -y golang-go

# Install essentials
sudo -E apt-get install -y build-essential

# Install yadm
sudo -E apt-get install -y yadm
yadm clone https://github.com/e11ni/dotfiles.git

# Install python and tools
sudo -E apt-get install -y python python-pip
sudo -E pip install pep8 flake8 pylint rope

# Install more utils
sudo -E apt-get install -y fzf gawk fasd silversearcher-ag npm pandoc jq httpie p7zip rsync openssh dos2unix mediainfo ffmpeg lnav xdg-utils docker docker-compose
sudo -E npm install -g npm
sudo -E npm install -g tldr how-2 editorconfig doctoc
curl -fLo /tmp/pet_0.3.0_linux_amd64.deb https://github.com/knqyf263/pet/releases/download/v0.3.0/pet_0.3.0_linux_amd64.deb
sudo dpkg -i /tmp/pet_0.3.0_linux_amd64.deb && rm -f /tmp/pet_0.3.0_linux_amd64.deb
echo "deb http://packages.azlux.fr/debian/ buster main" | sudo tee /etc/apt/sources.list.d/azlux.list
curl -vs https://azlux.fr/repo.gpg.key 2>&1 | sudo apt-key add -
sudo apt update
sudo apt install -y docker-ctop

# Install vim
sudo -E apt-get install -y vim
git clone https://github.com/morhetz/gruvbox.git ~/.vim/pack/default/start/gruvbox
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
dos2unix .vimrc
vim +'PlugInstall --sync' +qa > /dev/null

# Install zsh
sudo -E apt-get install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --keep-zshrc
sudo -E apt-get install -y powerline-fonts
sudo -E apt-get install -y zsh-completions
sudo chsh -s $(which zsh) $USER
dos2unix .zshrc
git clone https://github.com/zplug/zplug ~/.zplug
zsh -c "source ~/.zplug/init.zsh && zplug update"

# Install and config tmux
sudo -E apt-get install -y tmux tmuxp xclip
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
mkdir ~/.tmux/plugins && git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
dos2unix .tmux.conf.local
bash "~/.tmux/plugins/tpm/bin/install_plugins"

# Install JDK
sudo -E apt-get install -y jdk-openjdk

# Install JS tools
sudo -E npm install -g jshint

# Install debug tools
sudo -E apt-get install -y gdb valgrind strace htop
