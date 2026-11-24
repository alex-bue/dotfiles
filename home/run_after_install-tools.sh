#!/bin/sh
set -eu

bin_dir="$HOME/.local/bin"
export PATH="$bin_dir:$PATH"

if ! command -v mise >/dev/null; then
  mkdir -p "$bin_dir"
  if command -v curl >/dev/null; then
    installer="$(curl -fsSL https://mise.run)"
  elif command -v wget >/dev/null; then
    installer="$(wget -qO- https://mise.run)"
  else
    echo 'Installing mise requires curl or wget.' >&2
    exit 1
  fi
  MISE_INSTALL_PATH="$bin_dir/mise" MISE_INSTALL_SKIP_IF_EXISTS=1 sh -c "$installer"
fi

# Use the home tool list, not a manifest in the caller's project.
exec mise -C "$HOME" install
