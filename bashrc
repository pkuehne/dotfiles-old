##
## INCLUDE CUSTOM `.bashrc` CODE
##
if [ -f ~/.bashrc_custom ]; then
    . ~/.bashrc_custom
fi

if [ -f ~/.bashrc_alias ]; then
    . ~/.bashrc_alias
fi
if [ -f ~/.bashrc_ps1 ]; then
    . ~/.bashrc_ps1
echo ""
fi

clear
