# Dotfiles

There are two install modes. `./install.sh` keeps the existing **mutable-only**
setup (LazyVim, Powerlevel10k, and Karabiner on macOS) for homes managed by
Nix/Home Manager. On a standalone Linux or macOS home, use the **portable**
profile to get dotfiles and CLI tools without Nix or `sudo`:

```sh
git clone https://github.com/alex-bue/dotfiles.git ~/repos/dotfiles
cd ~/repos/dotfiles
./install.sh --portable --preview
./install.sh --portable
```

Start a new shell afterward. Bash and Zsh are both supported; the installer
does not change your login shell. Keep the checkout and rerun the same command
after pulling updates. `--skip-tools` applies the configs and shell/tmux plugins
without installing mise or its tools. `--preview` shows the config diff without
applying it or installing the CLI tools (it can bootstrap Chezmoi and populate
its download cache).

Use a fresh user account to try this on a Nix machine. The portable installer
refuses to replace links into `/nix/store`. Back up any existing writable shell
or application files and review the diff before a first apply. To migrate a
Home Manager home later, first retire Home Manager's ownership of the paths
you want Chezmoi to manage. Don't use `chezmoi apply --force` to bypass this.

The installer applies from its own checkout and selects the profile on each
run. If you want plain `chezmoi diff` and `chezmoi apply` (including the `ca`
alias) on a standalone machine, set Chezmoi's `sourceDir` to this checkout and
`data.portable` to `true` in your local Chezmoi config (`chezmoi edit-config`).
Use the installer if you want the Nix-link check.

## Ownership and requirements

- **Chezmoi**: Bash/Zsh startup and plugins, Git defaults and ignores, Starship,
  Herdr, tmux and its plugins/session picker, Ghostty and WezTerm config, plus
  AeroSpace on macOS. It does not install graphical apps or fonts.
- **mise**: the user-level CLI list in
  [`10-dotfiles.toml`](home/dot_config/mise/conf.d/10-dotfiles.toml). It uses
  release binaries rather than an OS package manager. `mise install` fills in
  missing tools; use `mise upgrade` when you want newer versions. On macOS,
  install `eza` separately if desired; the aliases fall back to `ls` without it.
- **Outside this profile**: OS services, system login configuration, the
  Niri/Noctalia desktop setup, and Nix-specific tools such as `nh` and `statix`.
  Optional coding tools can be installed separately with
  `mise use -g aqua:openai/codex aqua:anomalyco/opencode aqua:earendil-works/pi`.
  Authentication and agent integrations are not part of bootstrap.

The bootstrap expects a writable home, Git, Bash for the Bash setup and tmux
picker, common archive utilities, HTTPS access, and curl or wget for the
initial downloads. Dotfiles use the default `~/.config` layout. On restricted
VMs some binaries may need a newer libc, and building LazyVim parsers can still
require a compiler. Use `--skip-tools` if release downloads are restricted or
you already have the tools another way.

For Git identity, keep your existing `~/.gitconfig` or create an unmanaged
local include:

```sh
git config --file "$HOME/.config/git/local" user.name 'Your Name'
git config --file "$HOME/.config/git/local" user.email 'you@example.com'
```

Run `sh tests/bootstrap.sh` to exercise both install modes, the Nix-link guard,
and the CLI and tmux setup in a disposable home.
