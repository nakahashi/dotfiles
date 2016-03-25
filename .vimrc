""
" プラグイン
""
call plug#begin('~/.vim/plugged')

" カラースキーマ
Plug 'altercation/vim-colors-solarized'
Plug 'gosukiwi/vim-atom-dark'
Plug 'jpo/vim-railscasts-theme'
Plug 'tomasr/molokai'
Plug 'sjl/badwolf'
Plug 'vim-scripts/summerfruit256.vim'

" EditorConfig
Plug 'editorconfig/editorconfig-vim'

" unite.vim
Plug 'Shougo/unite.vim'
Plug 'ujihisa/unite-colorscheme'

call plug#end()

""
" カラースキーマ
""
" set background=light

" colorscheme atom-dark-256
" colorscheme torte
" colorscheme solarized
" colorscheme summerfruit256
colorscheme badwolf

""
" 動作設定
""
" マウス
set mouse=a
set ttymouse=xterm2

" BSで削除可能にする
set backspace=indent,eol,start

" コマンドラインの入力補完を利便化
set wildmenu
set history=2000
set whichwrap=h,l

""
" ファイル
""
set confirm
set hidden
set autoread
set nobackup
set noswapfile
if has('win32') || has('wind64')
  set directory=~/vimfiles/tmp
  set backupdir=~/vimfiles/tmp
else
  set directory=~/.vim/tmp
  set backupdir=~/.vim/tmp
endif

" エンコード
set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac

""
" 検索/置換設定
""
set ignorecase
set smartcase
set incsearch
set gdefault
set hlsearch

""
" 表示設定
""
syntax enable
syntax on
set number
set ruler
set nowrap
set list
set listchars=tab:^\ ,trail:-,nbsp:%,extends:>

" 対応するカッコを強調表示
set showmatch

" スクロール
set scrolloff=8

" クリップボード
set clipboard=unnamed,autoselect

" 日本語の行の連結時には空白を入力しない。
set formatoptions+=mM

" □や○の文字があってもカーソル位置がずれないようにする。
set ambiwidth=double

" 画面最後の行をできる限り表示する。
set display+=lastline

" ビープ音すべてを無効にする
set noerrorbells
set novisualbell
set t_vb=

" ステータスラインに文字コードを表示
set laststatus=2
set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=\ (%v,%l)/%L%8P\

""
" キーマップ
""
" 常に見た目の行数で移動
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" 検索ワードハイライト解除
nnoremap <C-l> :noh<CR>

