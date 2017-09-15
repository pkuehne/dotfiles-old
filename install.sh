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
