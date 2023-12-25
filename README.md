# Dotfiles

Fully automated development environment.

[![macos](https://github.com/alex-bue/dotfiles/actions/workflows/macos.yaml/badge.svg)](https://github.com/alex-bue/dotfiles/actions/workflows/macos.yaml)
[![docker](https://github.com/alex-bue/dotfiles/actions/workflows/docker.yaml/badge.svg)](https://github.com/alex-bue/dotfiles/actions/workflows/docker.yaml)

## Installation

Install everything with single `curl` command:

```bash
curl -fsSL https://raw.githubusercontent.com/alex-bue/dotfiles/main/scripts/setup.sh | sh -s -- --all
```

## macOS Requirements

Command Line Tools (CLT) for Xcode (from `xcode-select --install`)

## Running Inside Docker

Run `docker run -it alexbue/dotfiles` to spawn a docker container which is
automatically [built and
pushed](https://github.com/alex-bue/dotfiles/actions/workflows/docker.yaml) with
GitHub Actions.

## Chezmoi

Dotfiles themselves are managed with [chezmoi](https://github.com/twpayne/chezmoi).

They can be installed with:

```
chezmoi init alex-bue
```

Personal secrets are stored in 1Password and you'll need the 1Password CLI installed. Login to 1Password with:

```
eval $(op signin)
```

## Installation Flow
```
   ┌──────────────────────────────────────────────────────────────────────────────────────────────────────┐
┌──┤curl -fsSL https://raw.githubusercontent.com/alex-bue/dotfiles/main/scripts/setup.sh | sh -s -- --all │
│  └──────────────────────────────────────────────────────────────────────────────────────────────────────┘
│
│
│     ┌─────────────────────────────────────┐
├───► │git clone alex-bue/dotfiles.git /tmp │
│     └─────────────────────────────────────┘
│
│     ┌─────────────────────────┐     ┌──────────────────────────┐
├───► │./install_dependencies.sh├────►│ apt install <essentials> │
│     └─────────────────────────┘     └──────────────────────────┘
│
│     ┌──────────────────┐
├───► │./install_brew.sh │
│     └──────────────────┘
│
│     ┌────────────┐
└───► │./ansible.sh│
      └─────┬──────┘
            │
   ┌────────┘
   │
   │  ┌─────────────────────────┐
   ├─►│install community.general│
   │  └─────────────────────────┘
   │
   │  ┌──────────────────────────┐
   │  │ prompt for password if   │
   ├─►│ sudo is not passwordless │
   │  └──────────────────────────┘
   │
   │
   │  ┌───────────────────────────────┐
   └─►│ansible-playbook ... main.yaml │
      └───────────────┬───────────────┘
                      │
     ┌────────────────┘
     │                 ┌────────────────────────┐
     │  ┌────────┐     │ brew install <casks>   │
     ├─►│packages├────►│ brew install <formuale>│
     │  └────────┘     │ apt install <packages> │
     │                 └────────────────────────┘
     │
     │  ┌───────┐
     ├─►│ fonts │
     │  └───────┘
     │                 ┌───────────────┐
     │  ┌──────────┐   │ chezmoi init  │
     ├─►│ dotfiles ├──►│ chezmoi update│
     │  └──────────┘   └───────────────┘
     │
     │
     │
     │  ┌────┐         ┌────────────────────┐
     ├─►│zsh ├───────┐ │change default shell│
     │  └────┘       └►│install zsh plugins │
     │                 └────────────────────┘
     │
     │
     │                 ┌──────────────────────┐
     │  ┌──────┐       │ either:              │
     ├─►│neovim├──────►│  - build from source │
     │  └──────┘       │  - install binary    │
     │                 │  - brew on macos     │
     │                 └──────────────────────┘
     │
     │  ┌────────┐
     ├─►│ docker │
     │  └────────┘
     │                 ┌──────────────────────┐
     │  ┌──────┐       │install plugin manager│
     ├─►│ tmux ├──────►│install plugins       │
     │  └──────┘       └──────────────────────┘
     │
     │
     │  ┌─────────────────┐
     └─►│ system_defaults │
        └───────┬─────────┘
                │          ┌───────────────────────────────┐
                ├─────────►│ defaults write <apps settings>│
                │          └───────────────────────────────┘
                │          ┌───────────────────────┐
                └─────────►│defaults write <system>│
                           └───────────────────────┘
```

## Credits

Many thanks to [@shmileee](https://github.com/shmileee) for the [Hitchhiker's Guide to the Dotfiles](https://oponomarov.com) from which I derived my version.
