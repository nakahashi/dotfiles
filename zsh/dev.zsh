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
bindkey '9;5u' accept-line

# claude code入れたときに追加
export PATH="$HOME/.local/bin:$PATH"
export PATH=/opt/homebrew/share/google-cloud-sdk/bin:"$PATH"
