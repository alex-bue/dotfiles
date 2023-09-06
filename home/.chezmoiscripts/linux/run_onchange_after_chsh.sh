#!/bin/bash

set -eufo pipefail

if chsh -s /usr/bin/zsh; then
    echo "Shell changed successfully. Please log out and log back in to use Zsh."
else
    echo "Incorrect password or unable to change the shell."
fi

