#!/bin/sh
set -eu

portable=false
preview=false
tools=true
for arg in "$@"; do
  case "$arg" in
    --portable) portable=true ;;
    --preview) preview=true ;;
    --skip-tools) tools=false ;;
    -h|--help)
      echo 'usage: ./install.sh [--portable] [--preview] [--skip-tools]'
      exit 0 ;;
    *) echo "Unknown option: $arg" >&2; exit 2 ;;
  esac
done

# Anchor Chezmoi to this checkout, not another dotfiles clone.
script_dir="$(cd -P -- "$(dirname -- "$0")" && pwd -P)"
bin_dir="$HOME/.local/bin"
export PATH="$bin_dir:$PATH"

fetch() {
  if command -v curl >/dev/null; then
    curl -fsSL "$1"
  elif command -v wget >/dev/null; then
    wget -qO- "$1"
  else
    echo 'Bootstrapping requires curl or wget.' >&2
    return 1
  fi
}

if ! command -v chezmoi >/dev/null; then
  mkdir -p "$bin_dir"
  installer="$(fetch https://chezmoi.io/get)"
  sh -c "$installer" -- -b "$bin_dir"
fi

cm() {
  chezmoi --source="$script_dir" --override-data="{\"portable\":$portable}" "$@"
}

if [ "$portable" = true ]; then
  paths="$(cm managed --exclude=externals --path-style=absolute)"
  # Check directories too: a managed file can sit below a Nix-owned symlink.
  while IFS= read -r path; do
    [ -L "$path" ] || continue
    case "$(readlink "$path")" in
      /nix/store/*)
        echo "Refusing to replace Nix-managed path: $path" >&2
        echo 'Use a separate home or remove Home Manager ownership first.' >&2
        exit 1 ;;
    esac
  done <<EOF
$paths
EOF
fi

if [ "$preview" = true ]; then
  cm diff
  exit 0
fi

if [ "$portable" = false ]; then
  cm init --apply
  exit 0
fi

cm apply --error-on-conflict
if [ "$tools" = true ]; then
  if ! command -v mise >/dev/null; then
    mkdir -p "$bin_dir"
    installer="$(fetch https://mise.run)"
    MISE_INSTALL_PATH="$bin_dir/mise" MISE_INSTALL_SKIP_IF_EXISTS=1 sh -c "$installer"
  fi
  # Don't install toolchains from whichever project the checkout is inside.
  mise -C "$HOME" install
fi
