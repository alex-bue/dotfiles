# Dotfiles

User-level setup for Linux and macOS. Bash is enough; if you already use Zsh,
you get the same prompt, tools, and aliases. Setup never changes your login
shell or asks for `sudo`.

## Set up a fresh machine

You'll need Git, a writable home, HTTPS access, curl, and common archive tools.
Install Chezmoi into your home and let it fetch and apply the dotfiles:

```sh
sh -c "$(curl -fsSL https://chezmoi.io/get)" -- \
  -b "$HOME/.local/bin" init --apply alex-bue
```

That command runs the upstream Chezmoi installer. If you already have Chezmoi,
run `chezmoi init --apply alex-bue`. On a machine with existing dotfiles, back
up your files and review the diff before applying:

```sh
chezmoi init alex-bue
chezmoi diff
chezmoi apply
```

Start a new shell afterward. In the current shell, run
`export PATH="$HOME/.local/bin:$PATH"` if `chezmoi` isn't on your path yet.
Update with `chezmoi update`.

## Git identity

First setup asks for your Git name and email, offering your current global Git
values as defaults. Choose the right values for **this machine**; nothing is
inferred from the hostname. Answers are saved in your local Chezmoi config and
are not committed to this repo. Change them with `chezmoi edit-config` and
`chezmoi apply`. An existing `~/.gitconfig` can override these values; check
`git config --show-origin --get user.email` if the result isn't what you expect.
For different identities on the same machine, use Git `includeIf` or set the
identity per repository.

For unattended setup, pass explicit answers (including empty values if you do
not want to set an identity), or pass `--promptDefaults` to accept the existing
Git values without prompting:

```sh
chezmoi init --apply --promptString 'Git name=Your Name,Git email=you@example.com' alex-bue
```

## What gets installed

- **Chezmoi** deploys Bash and Zsh startup, Git defaults and ignores, Starship,
  Herdr, and your LazyVim config.
- **mise** installs the CLI tools in
  [`10-dotfiles.toml.tmpl`](home/dot_config/mise/conf.d/10-dotfiles.toml.tmpl),
  including Neovim, Herdr, fzf, and ripgrep. Chezmoi installs mise into
  `~/.local/bin` if needed and runs `mise install` on apply. Use `mise upgrade`
  when you want newer tool versions. The `ls` aliases fall back to `ls` where
  `eza` isn't installed.
- **LazyVim** installs its plugins on the first `nvim` launch. Some plugins
  still need system prerequisites, such as a C compiler for Tree-sitter parsers.

tmux is disabled for the shared setup. Its config is kept in the repo; set
`enableTmux = true` in [`home/.chezmoidata.toml`](home/.chezmoidata.toml) to
bring back tmux, sesh, the plugins, and the session picker. Disabling it does
not uninstall existing binaries or delete existing config files.

Desktop apps, fonts, system packages, and coding agent installs and logins are
outside this setup. On restricted VMs, a release binary may require a newer libc
or network access you don't have. If the tools are already installed or you want
to handle them separately, use `chezmoi apply --exclude=scripts` to skip the
installer hook (plugin checkouts still need network access).

Run `sh tests/bootstrap.sh` from the repo root to test setup and a repeat apply
in a disposable home.
