####
# dev.zsh

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"
# https://qiita.com/kawashinji/items/e5d7d302f8e0e5e0f177
export OPENSSL_CFLAGS=-Wno-error=implicit-function-declaration

# ndenv
export PATH="$HOME/.ndenv/bin:$PATH"
eval "$(ndenv init -)"

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

# brew
export PATH="/usr/local/opt/openssl/bin:$PATH"
