"""
"" 表示設定
"""
colorscheme atom-dark

set guifont=Ricty\ Diminished\ Regular:h15

"""
"" 日本語設定
"""
" 日本語入力ON時のカーソルの色を設定
function CursolColor()
  if has('multi_byte_ime') || has('xim')
    hi Cursor guifg=NONE guibg=Green
    hi CursorIM guifg=NONE guibg=Purple
  endif
endfunction
call CursolColor()

" 挿入モード終了時に IME 状態を保存しない
inoremap <silent> <Esc> <Esc>
inoremap <silent> <C-[> <Esc>

"""
"" ウィンドウサイズ保存
"""
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

" 行間
set lsp=1

" Kaoriya版vimrcは以下設定で無効にすること
" let plugin_cmdex_disable = 1

