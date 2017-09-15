#!/bin/bash

SOURCE_DIR=~/dotfiles/
DEST_DIR=~/.

if [[ $1 == "reverse" ]]; then
    SOURCE_DIR=~/.
    DEST_DIR=~/dotfiles/
fi

for file in `ls ~/dotfiles/`
do
    if [[ ! -x $file ]]; then
        echo "Copying .${file}"
        cp ${SOURCE_DIR}${file} ${DEST_DIR}${file}
    fi
done

echo "Copy complete!"

if [[ ! -e ~/.tmux/plugins/tpm ]]; then
    echo "Installing Tmux Plugin Manager!"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

if [[ ! -e ~/.vim/bundle/Vundle.vim ]]; then
    echo "Installing Vundle!"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

echo "Dotfile installation complete!"
