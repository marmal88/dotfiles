# Personal Dotfiles

## Contents
- [1. What's inside](#1-stuff-installed)
    - [1.1 Fonts](#11-fonts)
    - [1.2 Language Specific Installs](#12-language-specific-installs)
- [2. Installation](#2-installation)
    - [2.1 Stow](#21-stow)
    - [2.2 Neovim](#22-neovim)
        - [2.2.1 Blink CMP](#221-blink-cmp)
    - [2.3 OMZsh Plugins](#23-oh-my-zsh-zsh-vi-mode)
    - [2.4 Lazygit](#24-lazygit)


## 1. Stuff Installed
- gnu stow - symlink manager, [install](https://www.gnu.org/software/stow/)
- antidote - zsh plugin manager [install](https://antidote.sh/install)
- neovim - Code editor, [install](https://github.com/neovim/neovim/blob/master/INSTALL.md)
- wezterm - Terminal Emulator, [install](https://wezterm.org/install/linux.html)
- starship - Shell prompts, [install](https://starship.rs/guide/)

### 1.1 Fonts
- font search (nerdfont)[here](https://www.nerdfonts.com/cheat-sheet)

### 1.2 Language specific installs
- pynvim - python [install](https://github.com/neovim/pynvim)

## 2. Installation

## 2.1 Stow
Using GNU stow to manage the symlinks to the respective locations on MacOS and Linux.

GNU stow symlinks the files in the repo to the respective location from the `$HOME` location.

- To stow run the command `stow -t ~ .` from the directory `~/dotfiles`.
- To unstow run the command `stow -D .` from the directory `~/dotfiles`.

## 2.2 Neovim

### 2.2.1 Blink CMP
For Blink CMP installation, read the documentation [here](https://cmp.saghen.dev/configuration/fuzzy.html)

## 2.3 antidote (zsh-vi-mode)
Zsh plugins are managed via the plugin manager `antidote`.

Currently the following plugins are installed:
- zsh-vi-mode: This allows for vim cursor settings in terminal, read documentation [here](https://github.com/jeffreytse/zsh-vi-mode)

## 2.4 Lazygit
For lazygit, read documentation [here](https://github.com/jesseduffield/lazygit?tab=readme-ov-file#installation)
