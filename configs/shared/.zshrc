# Path to your oh-my-zsh installation.
export ZSH="/home/$USER/.oh-my-zsh"

# Dark themes for GTK
export GTK_THEME=Adwaita:dark

# Flutter option
export CHROME_EXECUTABLE=/sbin/chromium
# Add dart binary to path
export PATH=/opt/flutter/bin:$PATH

# Config path for imv
export imv_config="/home/$USER/.config/imv_config"

# Wayland things
export QT_QPA_PLATFORM=wayland-egl
export GDK_BACKEND=wayland
###### Notice ######
# Might have to be added to:
# - ~/.pam_environment
# - ???
export MOZ_ENABLE_WAYLAND=1

# Editor preference
export EDITOR="vim"

# Init starship
eval "$(starship init zsh)"

# Add pip/python install location and custom bin folder to path
export PATH=$HOME/.bin:$HOME/.local/bin:$PATH

# Rust cargo install path
export PATH=$HOME/.cargo/bin:$PATH

# Use terminal for GPG password prompt
export GPG_TTY=$(tty)

# Updates
zstyle ':omz:update' mode reminder
zstyle ':omz:update' frequency 3 #days

# History timestamps
HIST_STAMPS="dd.mm.yyyy"

# Plugins
plugins=(git history jsontools last-working-dir kubectl)

source $ZSH/oh-my-zsh.sh

# Vault CLI autocomplete
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/vault vault

complete -o nospace -C /usr/bin/nomad nomad
