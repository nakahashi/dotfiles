""
" 表示
""
" colorscheme lucario
colorscheme summerfruit256
" colorscheme lucius
" :Unite -auto-preview colorscheme
" colorscheme solarized
" colorscheme github
" colorscheme railscasts

" フォント
if has('win64')
  set guifont=Cica:h15:cSHIFTJIS
  set renderoptions=type:directx,renmode:5
elseif has('win32')
  set guifont=Cica:h15:cSHIFTJIS
elseif has('mac')
  set guifont=Cica:h15
endif

" メニュー文字化け対策
source $VIMRUNTIME/delmenu.vim
set langmenu=ja_jp.utf-8
source $VIMRUNTIME/menu.vim

""
" 日本語設定
""
function ConfigIME()
  if has('multi_byte_ime') || has('xim') || has('gui_macvim')
    " 日本語入力ON時のカーソルの色を設定
    hi Cursor guifg=NONE guibg=Green
    hi CursorIM guifg=NONE guibg=Purple

    " 挿入モード/検索時にIME ON
    set iminsert=1
    set imsearch=1
    inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
  endif
endfunction
call ConfigIME()

""
" ウィンドウサイズ保存
""
let g:save_window_file = expand('~/.vimwinpos')
augroup SaveWindow
  autocmd!
  autocmd VimLeavePre * call s:save_window()
  function! s:save_window()
    let options = [
      \ 'set columns=' . &columns,
      \ 'set lines=' . &lines,
      \ 'winpos ' . getwinposx() . ' ' . getwinposy(),
      \ ]
    call writefile(options, g:save_window_file)
  endfunction
augroup END
if filereadable(g:save_window_file)
  execute 'source' g:save_window_file
endif

