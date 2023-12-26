#!/usr/bin/env bash

set -euoE pipefail

install_brew() {
  echo "[homebrew] installing..."

  if command -v brew &> /dev/null; then
    echo "[homebrew] already installed."

    return 0
  fi

  export NONINTERACTIVE=1
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Check if architecture is ARM (e.g., Apple M1, M2, etc.)
  if [[ $(uname -m) == *"arm"* ]]; then
    (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi

  brew analytics off
  echo "[homebrew] installed!"
}

install_brew
