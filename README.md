# Dotfiles

This repo handles the  automatic installation of my dotfiles,
i.e. .vimrc, .gitconfig, etc.

The advantage of this is that the dotfiles are versioned and can be installed
and rolled back easily. 

The installation uses [ansible][ansible] for detecting changes and installing
the files correctly.

To use:

```bash
git clone https://github.com/pkuehne/dotfiles
cd dotfiles
./install.sh
```

[ansible]: https://www.ansible.com/
