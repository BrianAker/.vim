" vim:set softtabstop=4 shiftwidth=4 expandtab :
set all&
set nocompatible  " be iMproved

" Default tab spacing
set autoindent    " always set autoindenting on
" set copyindent    " copy the previous indentation on autoindenting
" set smartindent
"
" By default don't wrap
set nowrap

" Default tab spacing
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" call plug#begin('~/.vim/pack/vim-plug/start')
call plug#begin()
"Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'pearofducks/ansible-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'chrisbra/csv.vim'
"Plug 'lyuts/vim-rtags'
"Plug 'dense-analysis/ale'
Plug 'BrianAker/vim-yaml'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'pboettch/vim-cmake-syntax'
Plug 'vim/killersheep'
Plug 'vim-scripts/diffchanges.vim'
Plug 'https://github.com/preservim/vim-markdown'
Plug 'dense-analysis/ale'
call plug#end()

if ! has('autocmd')
    finish
endif

if has('macunix')
    set makeprg=gmake
endif

set autowrite " please vim to save file any time I go to the command mode
set backspace=indent,eol,start
syn on
"set modelines=5
"set modeline
set hlsearch
set wildignore=*.o,*.lo,*.swp,*.bak,*.pyc,*.class
set incsearch
set showmatch
set hidden " let hide unwritten buffers
set showcmd " show uncomplete command
set title " set xterm title to current file
set titleold=xterm " if title can not be restored, set it to this value
set ruler
set nostartofline
"set cino=(4
"set cino+=(0
set mps+=<:>
"
augroup YACC
    " Recognize yy files as Yacc
    autocmd BufRead,BufNewFile *.yy setfiletype yacc
    " autocmd BufRead *.test set syntax=mysql_test     
augroup END


augroup position
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost * if line("'\"") && line("'\"") <= line("$") | exe "normal `\"" | endif
augroup END

set path=**2
set mousehide           " Hide the mouse when typing text
set visualbell t_vb=

" augroup myfiletype
" autocmd BufNewFile,BufRead *.i set filetype=swig 
" autocmd BufNewFile,BufRead *.swg set filetype=swig 
" autocmd BufNewFile,BufRead *.j2 set filetype=jinja
" augroup END

" map  :Lodgeit<CR> 

" BEGIN syntax/m4.vim
let g:m4_default_quote="`,'" 
let g:m4_default_comment='#' 
" END syntax/m4.vim
"

" BEGIN vim-markdown
let g:vim_markdown_folding_disabled=1
" END vim-markdown

" BEGIN Syntastic configuration
if exists('g:loaded_syntastic_plugin')
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 0
    let g:syntastic_check_on_wq = 0
    let g:syntastic_cpp_check_header = 0
    let g:syntastic_cpp_remove_include_errors = 1
    let g:syntastic_auto_jump = 1
    "  Extras
    let g:syntastic_markdown_checkers = ['mdl']
    let g:syntastic_yaml_checkers = ['pyyaml']
    let g:syntastic_cfg_checkers = ['cfg']
    let g:syntastic_dosini_checkers = ['dosini']
    let g:syntastic_make_checkers = ['gnumake']
    let g:syntastic_javascript_checkers = ['jslint']
    let g:syntastic_json_checkers = ['jsonlint']
    let g:syntastic_gitcommit_checkers = ['language_check']
    let g:syntastic_svn_checkers = ['language_check']
    let g:syntastic_vim_checkers = ['vimlint']
    let g:syntastic_sh_checkers = ['shellcheck']
    let g:syntastic_sh_shellcheck_args = "-s bash"
    let g:my_syntastic_quiet_messages = ['SC2148', 'SC1090', 'SC2039', 'SC2112']
    let g:syntastic_quiet_messages = { 'regex': g:my_syntastic_quiet_messages }
    let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
    let g:syntastic_loc_list_height=3
    " Obvious security issue to resolve
    " let g:syntastic_enable_perl_checker = 1

    " Run all checkers
    let g:syntastic_aggregate_errors = 1
endif " End Syntastic configuration

" elzr-vim
let g:vim_json_syntax_conceal = 0

" pearofducks/ansible-vim
let g:ansible_attribute_highlight = 'ob'
let g:ansible_extra_keywords_highlight = 1
let g:ansible_extra_syntaxes = 'sh.vim ruby.vim'
let g:ansible_name_highlight = 'b'
let g:polyglot_disabled = ['ansible']

" indentLine - https://github.com/Yggdroot/indentLine
if has_key(plugs, 'indentLine')
    let g:indentLine_color_term = 239

    " GVim
    let g:indentLine_color_gui = '#A4E57E'

    " none X terminal
    let g:indentLine_color_tty_light = 7 " (default: 4)
    let g:indentLine_color_dark = 1 " (default: 2)
endif

" Airline
if has_key(plugs, 'vim-airline')
    "let g:airline#extensions#syntastic#enabled = 1
    "let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#show_buffers = 0
endif

" Clang
if has("macunix")
    let g:clang_library_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib'
endif

" Automatic GdbMgr Invocation:
if exists('g:loaded_gdbmgr')
    if has("unix") && executable("file") && !&l:binary
        if executable(expand("<afile>"))
            let s:file_type= system("file ".expand("<afile>"))
            if s:file_type =~ '\<executable\>' && s:file_type !~ '\<shell\>' && s:file_type !~ '\<script\>'
                call gdbmgr#GdbMgrInit(expand("<afile>"))
            endif
            unlet s:file_type
        endif
    endif
endif

set nofoldenable    " disable folding

" Mix opinion on
" set noswapfile
set nobackup

set wildmenu
set wildmode=list:longest

" augroup vimrcEx
"     autocmd VimEnter * call CmdAlias('X','x')
" augroup END

set wildignore+=*.retry
set guioptions+=e
"set guioptions+=a

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Matchit
runtime macros/matchit.vim

" For MacOSX
"set mouse=r

" yank to clipboard
if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard
endif

" Format JSON
"com! FormatJSON %!python -m json.tool

set nofoldenable
