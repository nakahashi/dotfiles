""
" プラグイン
""
if has('win32') || has('wind64')
  call plug#begin('~/vimfiles/plugged')
else
  call plug#begin('~/.vim/plugged')
endif

" カラースキーマ
Plug 'altercation/vim-colors-solarized'
Plug 'gosukiwi/vim-atom-dark'
Plug 'jpo/vim-railscasts-theme'
Plug 'tomasr/molokai'
Plug 'sjl/badwolf'
Plug 'jpo/vim-railscasts-theme'
Plug 'raphamorim/lucario'
Plug 'vim-scripts/summerfruit256.vim'
Plug 'jonathanfilip/vim-lucius'

" EditorConfig
Plug 'editorconfig/editorconfig-vim'

" unite.vim
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/vimproc.vim'
Plug 'w0ng/vim-hybrid'
Plug 'ujihisa/unite-colorscheme'
Plug 'albertorestifo/github.vim'
" :Unite -auto-preview colorscheme

" rubocop
Plug 'scrooloose/syntastic'

" syntax
Plug 'slim-template/vim-slim'
Plug 'nathanaelkane/vim-indent-guides'

call plug#end()

""
" unite.vim
""
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
let g:unite_enable_start_insert = 1

function! DispatchUniteFileRecAsyncOrGit()
  if isdirectory(getcwd()."/.git")
    Unite file_rec/git
  else
    Unite file_rec/async
  endif
endfunction

noremap <silent> ,b :Unite buffer<CR>
noremap <silent> ,h :Unite file_mru<CR>
noremap <silent> ,f :<C-u>call DispatchUniteFileRecAsyncOrGit()<CR>
noremap <silent> ,e :VimFilerExplore<CR>

" grep検索
nnoremap <silent> ,g  :<C-u>Unite -buffer-name=search grep:.<CR>

" カーソル位置の単語をgrep検索
nnoremap <silent> ,cg :<C-u>Unite -buffer-name=search grep:.<CR><C-R><C-W>

" grep検索結果の再呼出
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>

" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts =
      \ '-i --vimgrep --hidden --ignore ' .
      \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
  let g:unite_source_grep_recursive_opt = ''
endif

if has('mac')
  let g:vimproc_dll_path = '~/.vim/plugged/vimproc.vim/lib/vimproc_mac.so'
elseif has('win32')
  let g:vimproc_dll_path = '~/vimfiles/plugged/vimproc.vim/autoload/vimproc_win32.dll'
elseif has('win64')
  let g:vimproc_dll_path = '~/vimfiles/plugged/vimproc.vim/autoload/vimproc_win64.dll'
endif

" カラースキーマ
""
set background=light
" set background=dark

colorscheme default
" colorscheme atom-dark-256
" colorscheme molokai
" colorscheme torte
" colorscheme solarized
" colorscheme badwolf
" colorscheme railscasts
" colorscheme hybrid

""
" Rubocop
""
let g:syntastic_mode_map = { 'mode': 'passive', 'passive_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']

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
  set undodir=~/vimfiles/tmp
else
  set directory=~/.vim/tmp
  set backupdir=~/.vim/tmp
  set undodir=~/.vim/tmp
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

" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1

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

" 次のバッファ
noremap <C-N> :bn<CR>

" 拡張子ごとの設定
augroup fileTypeSettings
    autocmd!
    autocmd BufNewFile,BufRead *.txt setlocal wrap
    autocmd BufNewFile,BufRead *.md setlocal wrap
augroup END

