# Dotfiles

On a new machine with Git and curl:

```sh
sh -c "$(curl -fsSL https://chezmoi.io/get)" -- \
  -b "$HOME/.local/bin" init --apply alex-bue
```

If Chezmoi is already installed, run `chezmoi init --apply alex-bue`. On an
existing setup, omit `--apply` to review `chezmoi diff` before `chezmoi apply`.

Choose your Git name and email when prompted, then open a new shell. Run
`chezmoi update` to pull and apply updates.
