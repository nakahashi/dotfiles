####
# dev.zsh

# brew
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"
# https://qiita.com/kawashinji/items/e5d7d302f8e0e5e0f177
export OPENSSL_CFLAGS=-Wno-error=implicit-function-declaration

# nodenv
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

# pyenv/virtualenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# direnv
eval "$(direnv hook zsh)"

# embulk
export PATH=$PATH:$HOME/bin

# gh
eval "$(gh completion -s zsh)"
