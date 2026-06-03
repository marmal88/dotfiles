# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a **chezmoi dotfiles repository** that manages configuration files for development environments across macOS and Linux (Debian/Ubuntu). The repository uses Go templates to conditionally generate configs for work vs personal machines and different operating systems.

## Architecture

### Source Root: `home/` Directory

Due to `.chezmoiroot`, the chezmoi source directory is `home/` (not the repository root). All managed dotfiles live under `home/`.

**File naming conventions:**
- `dot_foo` → `~/.foo` when applied
- `dot_config/nvim/init.lua` → `~/.config/nvim/init.lua`
- `*.tmpl` suffix → processed as Go template before writing to target

### Template System

**Go template variables** come from `~/.config/chezmoi/chezmoi.toml` (local-only, never committed):
- `{{ .osid }}` - OS identifier (darwin, linux-ubuntu, etc.)
- `{{ .is_work }}` - Boolean for work vs personal machine
- `{{ .work.field }}` - Work-specific secrets (tokens, URLs, project IDs)
- `{{ .chezmoi.os }}`, `{{ .chezmoi.hostname }}` - Built-in chezmoi variables

**Template composition in `dot_zshrc.tmpl`:**
The main zshrc includes two partials from `.chezmoitemplates/`:
- `work_settings.sh.tmpl` - GCloud SDK, Java/Spark, SSL certs (only when `{{ if .is_work }}`)
- `shell_aliases.sh.tmpl` - Shared aliases (k=kubectl, vim=nvim, lg=lazygit, etc.)

### Package Management

Canonical package list is in `.chezmoidata/packages.yaml`:
```yaml
packages:
  brew: [git, ripgrep, fzf, neovim, ...]
  apt: [zsh, git, ripgrep, fzf, ...]
```

Install scripts iterate this file using `{{ range .packages.brew }}`. **Always update `packages.yaml`, not the install scripts directly.**

### Install Scripts (`.chezmoiscripts/`)

Scripts run automatically during `chezmoi apply`. Prefixes control execution:
- `run_once_` - Runs once ever (tracked by chezmoi state)
- `run_onchange_` - Reruns when file content changes
- `run_before_` - Runs before files are applied

**Directory structure:**
- `common/` - All platforms (antidote zsh plugin manager, pynvim)
- `darwin/` - macOS only (Homebrew, brew packages)
- `debian/` - Debian/Ubuntu only (apt packages, wezterm, lazygit, starship)

## Common Commands

```sh
# Preview changes without applying
chezmoi diff

# Apply all dotfiles to home directory
chezmoi apply

# Dry run with verbose output
chezmoi apply --dry-run --verbose

# Test template rendering
chezmoi execute-template < home/path/to/file.tmpl

# CI / fresh machine bootstrap
chezmoi init --apply --source ./home

# Re-add a file after editing in home directory
chezmoi re-add ~/.zshrc

# Edit a managed file
chezmoi edit ~/.zshrc
```

## Managed Applications

Core applications configured in this repository:
- **neovim** (`home/dot_config/nvim/`) - Code editor with Lua config
- **wezterm** (`home/dot_config/wezterm/`) - Terminal emulator
- **tmux** (`home/dot_config/tmux/`) - Terminal multiplexer
- **zsh** (`home/dot_zshrc.tmpl`) - Shell with antidote plugin manager
- **starship** - Shell prompt
- **lazygit** - Git TUI
- **ripgrep** (`home/dot_config/ripgrep/`) - Fast grep alternative

## Secrets and Work Configuration

**Critical rule:** Any file containing `{{ .work.* }}` templates **must** have a `.tmpl` extension. Never hardcode secrets, internal URLs, or work-specific values.

**Required `[data.work]` fields in `~/.config/chezmoi/chezmoi.toml`:**
- `email` - Work email address
- `anthropic_auth_token` - Claude API token
- `anthropic_base_url` - Corporate AI gateway URL
- `anthropic_model` - Default Claude model
- `google_cloud_project` - GCP project ID
- `google_cloud_location` - GCP region

The `home/.chezmoi.toml.tmpl` template auto-detects:
- OS type (darwin, linux-ubuntu, linux-fedora)
- Ephemeral environments (Codespaces, containers, VMs)
- Hostname and machine type
- Work vs personal machine (based on hostname)

## CI/CD

GitHub Actions workflow (`.github/workflows/chezmoi-test.yml`) runs on push/PR:
1. Installs chezmoi on Ubuntu and macOS
2. Runs `chezmoi init --apply --source ./home`
3. Verifies `.zshrc` was created and contains expected aliases

**Test command used in CI:**
```sh
chezmoi init --apply --source ${{ github.workspace }}/home
```

## New Machine Setup

Before running `chezmoi apply` on a fresh machine:
1. Create `~/.config/chezmoi/chezmoi.toml` manually
2. Populate `[data.work]` section with secrets (if work machine)
3. The `home/.chezmoi.toml.tmpl` handles the rest automatically
