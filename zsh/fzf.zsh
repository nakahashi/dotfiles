source <(fzf --zsh)

# Ctrl+B: fzf git branch switcher
fbr-widget() {
  fbr
  zle reset-prompt
}
zle -N fbr-widget
bindkey '^B' fbr-widget

fbr() {
  local branches branch
  branches=$(git branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}
