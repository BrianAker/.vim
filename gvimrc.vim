" vim:set softtabstop=4 shiftwidth=4 expandtab :
if has('gui_macvim')
  set guifont=Menlo\ Regular:h18
  set go-=T
  let g:macvim_hig_shift_movement = 1
  set guioptions+=e
  set cb=autoselect
  set pastetoggle=<F2>
  let &t_SI .= "\<Esc>[?2004h"
  let &t_EI .= "\<Esc>[?2004l"

  inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
endif

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction
