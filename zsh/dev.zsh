####
# dev.zsh

# brew
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"

# direnv
eval "$(direnv hook zsh)"

# embulk
export PATH=$PATH:$HOME/bin

# gh
eval "$(gh completion -s zsh)"

# ghostty
# Ctrl+m で改行
bindkey $'\e[109;5u' accept-line
