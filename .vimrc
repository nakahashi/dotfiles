"""
"" NeoBandle向け設定
"""

" 挙動を vi 互換ではなく、Vim のデフォルト設定にする
set nocompatible
" 一旦ファイルタイプ関連を無効化する
filetype off

if has('vim_starting')
  " bundleで管理するディレクトリを指定
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#begin(expand('~/.vim/bundle/'))
endif

" NeoBandle本体
NeoBundle 'Shougo/neobundle.vim'
" ファイラ
NeoBundle 'Shougo/unite.vim'
" Unite.vimで最近使ったファイルを表示できるようにする
NeoBundle 'Shougo/neomru.vim'
" ファイルをtree表示してくれる
NeoBundle 'scrooloose/nerdtree'
" Ruby向けにendを自動挿入してくれる
NeoBundle 'tpope/vim-endwise'
" コメントON/OFFを手軽に実行
NeoBundle 'tomtom/tcomment_vim'
" インデントに色を付けて見やすくする
NeoBundle 'nathanaelkane/vim-indent-guides'
" カラースキーマ
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'vim-scripts/Lucius'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'gosukiwi/vim-atom-dark'

" NeoBandle向け設定終了
call neobundle#end()
filetype plugin indent on

"""
"" Unit.vimの設定
"""
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
" noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

" ファイラでカレントを変えられるようにする
set modifiable
set write

"起動
nnoremap <silent><C-e> :NERDTreeToggle<CR>

"""
"" 動作設定
"""
" マウス
set mouse=a
set ttymouse=xterm2

" BSで削除可能にする
set backspace=indent,eol,start

" 常に見た目の行数で移動
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" コマンドラインの入力補完を利便化
set wildmenu
set history=2000
set whichwrap=h,l

" 勝手に改行しないようにする
set textwidth=0

" 勝手にコメントを入れないようにする
autocmd FileType * setlocal formatoptions-=ro

"""
"" ファイル
"""
set confirm
set hidden
set autoread
set nobackup
set noswapfile
set directory=~/.vim/tmp
set backupdir=~/.vim/tmp

"""
"" 検索/置換設定
"""
set ignorecase
set smartcase
set incsearch
set gdefault
set hlsearch

" 検索ワードハイライト解除
nnoremap <C-l> :noh<CR>

"""
"" 表示設定
"""
syntax enable
set number
set ruler
set nowrap
set list
set listchars=tab:^\ ,trail:-,nbsp:%,extends:>

" 対応するカッコを強調表示
set showmatch

" スクロール
set scrolloff=8

" インデント
set autoindent
set smartindent

" タブ
set expandtab
set tabstop=2
set shiftwidth=2

" クリップボード
set clipboard=unnamed,autoselect

"日本語の行の連結時には空白を入力しない。
set formatoptions+=mM

"□や○の文字があってもカーソル位置がずれないようにする。
set ambiwidth=double

"画面最後の行をできる限り表示する。
set display+=lastline

"ビープ音すべてを無効にする
set visualbell t_vb=
set noerrorbells "エラーメッセージの表示時にビープを鳴らさない

"""
"" 表示設定
"""
" カラースキーマ
syntax enable
" colorscheme atom-dark

" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1

"""
"" 全角スペースハイライト
"""
function! HighlightZenkakuSpace()
  hi link HighlightZenkakuSpace Error
endfunction
if has('syntax')
  augroup HighlightZenkakuSpace
    autocmd!
    autocmd ColorScheme * call HighlightZenkakuSpace()
    autocmd VimEnter,WinEnter * call matchadd("HighlightZenkakuSpace", '　')
  augroup END
  call HighlightZenkakuSpace()
endif

"""
"" 日付ハイライト
"""
function! HighlightDate()
  hi link HighlightDate MoreMsg
endfunction
if has('syntax')
  augroup HighlightDate
    autocmd!
    autocmd ColorScheme * call HighlightDate()
     autocmd VimEnter,WinEnter * call matchadd("HighlightDate", '....\/..\/..[[:blank:]]..:..')
  augroup END
  call HighlightDate()
endif

"""
"" 挿入モード時、ステータスラインの色を変更
"""
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'
if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif
let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction
function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction

" ステータスラインに文字コードを表示
set laststatus=2
set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=\ (%v,%l)/%L%8P\ 

" Kaoriya版vimrcは以下設定で無効にすること
" let plugin_cmdex_disable = 1

