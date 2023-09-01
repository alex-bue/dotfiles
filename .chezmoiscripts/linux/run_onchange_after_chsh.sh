#!/bin/bash

set -eufo pipefail

if [ "$EUID" -eq 0 ]; then
    # User is root, change shell to zsh
    user_shell=$(getent passwd $SUDO_USER | cut -d: -f7)
    if [ "$user_shell" != "/usr/bin/zsh" ]; then
        chsh -s /usr/bin/zsh $SUDO_USER
    fi
else
    # User is not root, change shell to zsh only if password is correct
    if sudo chsh -s /usr/bin/zsh $USER; then
        echo "Shell changed successfully."
    else
        echo "Incorrect password or unable to change the shell."
    fi
fi


