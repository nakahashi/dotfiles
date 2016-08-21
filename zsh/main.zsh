####
# main.zsh

# ohz
export ZSH=/Users/nakahashi/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# env
PATH=/bin:/usr/bin:/usr/local/bin:${PATH}
export PATH
export LANG=ja_JP.UTF-8

# macvim
case "$(uname)" in
  Darwin)
    if [[ -d /Applications/MacVim.app ]]; then
      alias mvim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/mvim "$@"'
      alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
    fi
    ;;
  *) ;;
esac

# alias
alias mkdir='mkdir -p'
alias sudo='sudo '

# history
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# options
setopt print_eight_bit  # 日本語ファイル名
setopt no_beep
setopt no_flow_control
setopt ignore_eof # Ctrl+Dでzshを終了しない
setopt interactive_comments # '#' 以降をコメント
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt extended_glob
