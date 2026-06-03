####
# .zshrc

# sources
source $ZDOTDIR/main.zsh
source $ZDOTDIR/view.zsh
source $ZDOTDIR/zsh-completions.zsh
source $ZDOTDIR/dev.zsh
source $ZDOTDIR/fzf.zsh

# plugins
plugins=(git ruby macos brew rails emoji-clock)

# mise
eval "$(mise activate zsh)"

source $ZDOTDIR/../.local.zsh
