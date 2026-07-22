####
# dev.zsh

# brew
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"

# direnv
eval "$(direnv hook zsh)"

# embulk
export PATH=$PATH:$HOME/bin

# gh (キャッシュして高速化)
_GH_COMPLETION_CACHE="$HOME/.cache/zsh/gh_completion.zsh"
if [[ ! -f "$_GH_COMPLETION_CACHE" ]] || [[ $(command -v gh) -nt "$_GH_COMPLETION_CACHE" ]]; then
  mkdir -p "$(dirname $_GH_COMPLETION_CACHE)"
  gh completion -s zsh >"$_GH_COMPLETION_CACHE" 2>/dev/null
fi
[[ -f "$_GH_COMPLETION_CACHE" ]] && source "$_GH_COMPLETION_CACHE"
unset _GH_COMPLETION_CACHE

# ghostty
# Ctrl+m で改行
bindkey '9;5u' accept-line

# claude code入れたときに追加
export PATH="$HOME/.local/bin:$PATH"
export PATH=/opt/homebrew/share/google-cloud-sdk/bin:"$PATH"
