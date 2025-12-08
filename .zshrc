# Uncomment this line when profiling
# zmodload zsh/zprof

# -----------------------------------------------------------------------------
# PERFORMANCE SETTINGS
# -----------------------------------------------------------------------------

# 1. Skip security checks on directory permissions (Save ~1.0s)
#    This prevents Zsh from checking permissions on every plugin file at startup.
ZSH_DISABLE_COMPFIX="true"

# 2. Disable Oh My Zsh auto-updates (Save startup checks)
#    Manual update via 'omz update' is preferred for speed.
zstyle ':omz:update' mode disabled

# -----------------------------------------------------------------------------
# OH MY ZSH CONFIGURATION
# -----------------------------------------------------------------------------
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

# Plugins
plugins=(
  git
  uv
  zsh-vi-mode
)

source $ZSH/oh-my-zsh.sh

# -----------------------------------------------------------------------------
# LAZY LOAD NVM (Node Version Manager)
# -----------------------------------------------------------------------------
# This setup saves ~1.0s by only loading NVM when you type nvm/node/npm
export NVM_DIR="$HOME/.nvm"
function nvm node npm {
  unfunction nvm node npm
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
  "$0" "$@"
}

# -----------------------------------------------------------------------------
# EXPORTS & PATHS
# -----------------------------------------------------------------------------
export PATH="$HOME/.local/bin:$PATH"
export PATH=$PATH:$(go env GOPATH)/bin
[[ -d /Applications/WezTerm.app/Contents/MacOS ]] && export PATH="/Applications/WezTerm.app/Contents/MacOS:$PATH"

# Ruby
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

# # Pyenv (Initializes relatively quickly)
# export PYENV_ROOT="$HOME/.pyenv"
# [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"

# Google Cloud SDK
# Note: The completion line below is heavy. If startup is still slow,
# comment out the second line (completion.zsh.inc).
if [ -f '/Users/daniel.low/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/daniel.low/Downloads/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/Users/daniel.low/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/daniel.low/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# ripgrep
export RIPGREP_CONFIG_PATH="$HOME/.config/ripgrep/config"

# fzf
source <(fzf --zsh)
export FZF_DEFAULT_OPTS="--height=60% --layout=reverse --info=inline --bind='ctrl-/:toggle-preview'"
export FZF_CTRL_T_OPTS="--preview='bat --color=always {}' --preview-window='right:50%'"
export FZF_ALT_C_OPTS="--preview='tree -C {} | head=-200' --preview-window='right:50%'"

# Certs
export SSL_CERT_FILE=/Users/daniel.low/Certs/macOS-cacerts.pem
export REQUESTS_CA_BUNDLE=/Users/daniel.low/Certs/macOS-cacerts.pem
export CURL_CA_BUNDLE=/Users/daniel.low/Certs/macOS-cacerts.pem

# -----------------------------------------------------------------------------
# ALIASES & UI
# -----------------------------------------------------------------------------
alias k="kubectl"
alias vim="nvim"
alias vi="nvim"
alias tg="terragrunt"
alias tr="terraform"
alias g="git"
alias we="wezterm"
alias lg='lazygit'

bindkey -v
HIST_STAMPS="mm/dd/yyyy"

# This prevents Starship's ZLE widget wrapper from causing infinite recursion.
if [[ "${widgets[zle-keymap-select]#user:}" == "starship_zle-keymap-select" || \
      "${widgets[zle-keymap-select]#user:}" == "starship_zle-keymap-select-wrapped" ]]; then
    zle -N zle-keymap-select ""
fi

# Starship (Loads fast)
eval "$(starship init zsh)"

# Uncomment this line when profiling 
# zprof
