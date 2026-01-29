# dotfiles

## Installation

installコマンドを叩く前に oh-my-zsh を入れておこう
https://shinshin86.hateblo.jp/entry/2022/10/30/000000

### for Mac/Linux

```zsh
$ cd
$ git clone https://github.com/nakahashi/dotfiles.git
$ dotfiles/install.sh
$ brew bundle
```

### for WSL on Windows

```zsh
$ cd
$ git clone https://github.com/nakahashi/dotfiles.git
$ ./install-win-apps.sh
$ ./install-win-shell.sh
# brewインストール
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
$ brew bundle
```
