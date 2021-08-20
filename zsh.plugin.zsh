setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS

# fasd integration with only zsh-hook
fasd_cache="${ZSH_CACHE_DIR}/fasd-init-cache"
if [[ "$commands[fasd]" -nt "$fasd_cache" || ! -s "$fasd_cache" ]]; then
    fasd --init zsh-hook >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache

export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude={.git}'
export FZF_DEFAULT_OPTS="--height=40% --layout=reverse --border"

export EDITOR=emacsclient

# Ctrl-X Ctrl-E to call edit-command-line
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

autoload -Uz z
autoload -Uz e
