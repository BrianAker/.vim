set guifont=9x15
set nocompatible

if has("autocmd")
	filetype off

	set rtp+=~/.vim/bundle/vundle/
	call vundle#rc()

	Bundle 'gmarik/vundle'

	" vim-scripts repos
	Bundle 'BrianAker/shell-commands'
	Bundle 'EasyGrep'
	Bundle 'Gundo'
	Bundle 'YankRing.vim'
	Bundle 'a.vim'
	Bundle 'c.vim'
	Bundle 'clang-complete'
	Bundle 'cpp.vim'
	Bundle 'BrianAker/dhcpd.vim'
	Bundle 'fugitive.vim'
	Bundle 'git-commit'
	Bundle 'Absolight/vim-bind.git'
	Bundle 'ingydotnet/yaml-vim.git'
	Bundle 'robbevan/Vagrantfile.vim.git'
	Bundle 'saltstack/salt-vim.git'
	Bundle 'scrooloose/syntastic.git'
        Bundle 'myint/syntastic-extras'
	Bundle 'tpope/vim-markdown.git'
	Bundle 'tpope/vim-pastie.git'
	Bundle 'gnupg.vim'
	Bundle 'ifdef-highlighting'
	Bundle 'lodgeit.vim'
	Bundle 'matchit.zip'
	Bundle 'pep8'
"	Bundle 'tomtom/quickfixsigns_vim'
"	Bundle 'refactor'
	Bundle 'ruby.vim'
	Bundle 'scrooloose/nerdtree'
	Bundle 'snipMate'
	Bundle 'sqlite_c'
	Bundle 'sudo.vim'
	Bundle 'tabman.vim'
	Bundle 'taglist.vim'
"	Bundle 'tomtom/checksyntax_vim'
	Bundle 'vcsbzr.vim'
	Bundle 'vcscommand.vim'
"Bundle 'vcslogdiff'
	Bundle 'vcsnursery'
	Bundle 'mitsuhiko/vim-jinja'
	Bundle 'darfink/vim-plist'
	" Bundle 'git://github.com/seveas/bind.vim.git'
	"	Bundle 'git://repo.or.cz/vcscommand'

	filetype plugin indent on     " required!
endif

set nowrap
set tabstop=8
set shiftwidth=2
set autowrite " please vim to save file any time i go to the command mode
set bs=2
set et
set sts=2
syn on
set modelines&
set hlsearch
set wildignore=*.o,*.lo
set incsearch
set showmatch
set hidden " let hide unwritten buffers
set showcmd " show uncomplete command
set title " set xterm title to current file
set titleold=xterm " if title can not be restored, set it to this value
"set list
"set nostartofline
"set wildmenu
"set rulerformat=%30(%<%m%y%h%r%=%l,%c\ %P%)
set ruler
set ai
set si
set nosol
"set cino=(4
set cino+=(0
set mps+=<:>
if has("autocmd")
" Added for cpp
	autocmd BufRead *.yy  source $VIMRUNTIME/syntax/yacc.vim
	autocmd BufRead *.yy  source $VIMRUNTIME/indent/yacc.vim
	autocmd BufRead *.test set syntax=mysql_test     
	autocmd BufRead *.pccts set syntax=pccts
" When editing a file, always jump to the last cursor position
	autocmd BufReadPost * if line("'\"") && line("'\"") <= line("$") | exe "normal `\"" | endif
endif
	
nmap _dos :%s/\r//g<C-j>

set path=**2
set mousehide		" Hide the mouse when typing text
" function for smart intdenting with tab in insert mode
function InsertTabWrapper()
	let col = col('.') - 1
	if !col || getline('.')[col - 1] !~ '\k'
		return "\<tab>"
	else
		return "\<c-p>"
	endif
endfunction
set visualbell t_vb=
" print warning message for Ex mode 
function WarningExModeDisabled()
	echohl WarningMsg
	echo "Ex mode disabled"
	echohl None
endfunction

au BufNewFile,BufRead *.i set filetype=swig 
au BufNewFile,BufRead *.swg set filetype=swig 
au BufNewFile,BufRead *.j2 set filetype=jinja

" remap Q to not switch to Ex mode 
nmap Q :call WarningExModeDisabled()<CR>
nmap gQ :call WarningExModeDisabled()<CR>
" vim:noet:ts=8:sw=8:sts=8
"
map  :Lodgeit<CR> 

" Begin Syntastic configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"  Extras
let g:syntastic_cfg_checkers = ['cfg']
let g:syntastic_dosini_checkers = ['dosini']
let g:syntastic_make_checkers = ['gnumake']
let g:syntastic_javascript_checkers = ['json_tool']
let g:syntastic_gitcommit_checkers = ['language_check']
let g:syntastic_svn_checkers = ['language_check']
" End Syntastic configuration
