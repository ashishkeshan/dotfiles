#!/bin/bash
#

# git config
exec > >(tee -i $HOME/dotfiles_install.log)
exec 2>&1
set -x
git config --global user.name "Ashish Keshan"
git config --global user.email "ashishkeshan@github.com"
git config --global core.editor vim
git config --global pager.branch false
git config --global push.default current
git config --global alias.lo  "log --pretty='format:%C(auto)%h %C(green)%an %C(auto)%s' -10"

# git completion
curl -fLo ~/.zsh/git-completion.zsh --create-dirs https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh

# vim colors
mkdir -p ~/.vim/colors
cp ~/.dotfiles/.vim/colors/molokai.vim ~/.vim/colors/

# links
ln -s ~/.dotfiles/.zshrc ~/
ln -s ~/.dotfiles/.vimrc ~/

# vim plugins
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# zsh 
if [ "$SHELL" != "/usr/bin/zsh" ]; then
    sudo apt install -y zsh
    zsh
fi;
