####
# view.zsh

# color
autoload -Uz colors
colors

# prompt
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' max-exports 6 # formatに入る変数の最大数
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' formats '%b@%r' '%c' '%u'
zstyle ':vcs_info:git:*' actionformats '%b@%r|%a' '%c' '%u'
setopt prompt_subst
function vcs_echo {
  local st branch color
  STY= LANG=en_US.UTF-8 vcs_info
  st=`git status 2> /dev/null`
  if [[ -z "$st" ]]; then
    PROMPT_VCS=""
    return
  fi
  branch="$vcs_info_msg_0_"
  if   [[ -n "$vcs_info_msg_1_" ]]; then color=${fg[green]} #staged
  elif [[ -n "$vcs_info_msg_2_" ]]; then color=${fg[red]} #unstaged
  elif [[ -n `echo "$st" | grep "^Untracked"` ]]; then color=${fg[blue]} # untracked
  else color=${fg[cyan]}
  fi
  PROMPT_VCS="%{$color%}(%{$branch%})%{$reset_color%}"
  PROMPT_VCS=$(echo "$PROMPT_VCS" | sed -e s/@/"%F{yellow}@%f%{$color%}"/)
}
precmd() {
  vcs_echo
  # Ghostty のタブタイトルをカレントディレクトリに設定
  print -Pn "\e]2;%~\a"
}
PROMPT='%F{yellow}[%~]%f ${PROMPT_VCS}%(?.$.%F{red}$%f) '
setopt transient_rprompt

