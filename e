# -*- mode: sh -*-
#
# Find file under current directory and open it with emacsclient.

if [ $# -eq 1 ]; then
    emacsclient --no-wait "$1"
    return
fi

local file

fd \
    --type=f \
    --hidden \
    --exclude={.git} \
    "$*" \
    | fzf \
          --no-sort \
          --no-multi \
          -1 \
          --preview='bat --style=numbers --color=always --line-range :500 {}' \
    | read file
[ -z "$file" ] && return
emacsclient --no-wait "$file"
