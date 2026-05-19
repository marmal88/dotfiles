# Copilot Instructions

## Chezmoi Commands

```sh
# Apply dotfiles to home directory
chezmoi apply

# Preview what would change (non-interactive)
chezmoi diff

# Dry run with verbose output
chezmoi apply --dry-run --verbose

# Test a template renders correctly
chezmoi execute-template < home/path/to/file.tmpl

# CI / fresh machine bootstrap (source dir is home/ subdirectory)
chezmoi init --apply --source ./home
```

## Architecture

The chezmoi source root is `home/` (set via `.chezmoiroot`). All managed files live under `home/` — not the repo root.

**File naming:**
- `dot_foo` → `~/.foo`
- `dot_config/bar` → `~/.config/bar`
- `file.tmpl` suffix → processed as a Go template before being written

**Template composition in `dot_zshrc.tmpl`:**
The zshrc is assembled from two partials stored in `.chezmoitemplates/`:
- `work_settings.sh.tmpl` — GCloud, Java, Spark, certs (gated on `{{ if .is_work }}`)
- `shell_aliases.sh.tmpl` — shared aliases for all machines

**Package management:**
`.chezmoidata/packages.yaml` defines the canonical package list. The brew and apt install scripts in `.chezmoiscripts/` iterate over this file via `{{ range .packages.brew }}` — add packages there, not directly in the scripts.

**Install scripts:**
Scripts under `.chezmoiscripts/` use filename prefixes to control when they run:
- `run_once_` — runs once ever
- `run_onchange_` — reruns when file content changes
- `run_before_` — runs before files are applied

## Conventions

### Config data (`~/.config/chezmoi/chezmoi.toml`)

This file is **local-only and never committed**. It must be created manually on each new machine.

| What | Where | Template access |
|---|---|---|
| Non-sensitive config (flags, hostname, OS) | `[data]` | `{{ .field }}` |
| Work secrets (tokens, URLs, project IDs) | `[data.work]` | `{{ .work.field }}` |

Current `[data]` fields: `osid`, `ephemeral`, `is_work`, `hostname`, `dev_computer`, `zsh_plugins`

Current `[data.work]` fields: `email`, `anthropic_auth_token`, `anthropic_base_url`, `anthropic_model`, `google_cloud_project`, `google_cloud_location`

### Secrets rule
Any file containing a `{{ .work.* }}` value **must** have a `.tmpl` extension in the source. Never hardcode secrets, internal URLs, or project IDs in plain files.

### New machine setup
Before running `chezmoi apply`, create `~/.config/chezmoi/chezmoi.toml` and populate `[data.work]` with the required secrets. The `home/.chezmoi.toml.tmpl` template auto-detects OS, hostname, and ephemeral environments — it does not need to be edited per machine.
