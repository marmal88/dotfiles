# Dotfiles

## General Installation

Install scripts run via for `chezmoi`. Installation docs [here](https://www.chezmoi.io/install/)

```
# Install and retain files
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply marmal88
# Install and remove source directory
apt update && apt install curl -y
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --one-shot marmal88
```

```
# To use zshell run
exec zsh
```

## Software
- chezmoi - dotfiles manager, [docs](https://www.chezmoi.io/user-guide/command-overview/)
- zshell - shell emulator, [docs](https://github.com/zsh-users/zsh)
- neovim - Code editor, [docs](https://github.com/neovim/neovim/blob/master/INSTALL.md)
- wezterm - Terminal Emulator, [docs](https://wezterm.org/install/linux.html)
- starship - Shell prompts, [docs](https://starship.rs/guide/)
- ripgrep - Finder [docs](https://docs.rs/crate/ripgrep/latest)
- lazygit - Git manager [docs](https://github.com/jesseduffield/lazygit?tab=readme-ov-file#installation)

## Programming
- python (General programming)
    - uv - package manager [docs](https://docs.astral.sh/uv/)
- rust (Used in nvim blink-cmp)


