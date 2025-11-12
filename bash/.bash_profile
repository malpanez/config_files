# ~/.bash_profile - ensures interactive login shells load ~/.bashrc
if [ -f "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
fi
