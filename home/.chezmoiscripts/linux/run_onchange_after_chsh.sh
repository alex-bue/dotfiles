#!/bin/bash

set -eufo pipefail

if sudo chsh -s /usr/bin/zsh; then
    echo "Shell changed successfully. Please relog"
else
    echo "Incorrect password or unable to change the shell."
fi

