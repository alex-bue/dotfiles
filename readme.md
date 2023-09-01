# Welcome to my dotfiles

This repository contains my dotfiles and configurations managed using Chezmoi.

## Prerequisites

Before applying these dotfiles to a new machine, make sure you have Chezmoi installed. You can install Chezmoi by following the instructions at [www.chezmoi.io/install/](https://chezmoi.io/docs/install/).

For one line install and application:

`sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply $GITHUB_USERNAME`

without scripts:

`sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply --exclude=scripts $GITHUB_USERNAME`

## Using chezmoi across multiple machines

`chezmoi init alex-bue`: clones your dotfiles from GitHub into the source directory.

`chezmoi init --apply alex-bue`: clones your dotfiles from GitHub into the source directory and runs chezmoi apply.

`chezmoi update`: pulls the latest changes from your remote repo and runs chezmoi apply.

## Useful commands

`chezmoi apply --exclude types` or `chezmoi apply --include types`: Exclude or include types shown here:

| Entry Type | Description                  |
|------------|------------------------------|
| `all`      | All entries (default)        |
| `none     `| No entries                   |
| `dirs     `| Directories                  |
| `files    `| Files                        |
| `remove   `| Removes                      |
| `scripts  `| Scripts                      |
| `symlinks `| Symbolic links               |
| `always   `| Scripts that are always run  |
| `encrypted`| Encrypted entries            |
| `externals`| External entries             |
| `templates`| Templates                    |

`chezmoi diff`: Check what changes chezmoi will make to your home directory.

`chezmoi edit $FILE`: Directly edit a file with chezmoi (Changes will be directly visible in chezmoi dotfiles repo)

`chezmoi help`: For full list of commands
