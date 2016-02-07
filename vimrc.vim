" vim:set softtabstop=4 shiftwidth=4 expandtab :
set nocompatible  " be iMproved, required for Vundle

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


if has("autocmd")
    filetype off      " Vundle Requirement

    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    " let Vundle manage Vundle, required
    Plugin 'VundleVim/Vundle.vim'

    " let Syntastic take its turn
    Plugin 'scrooloose/syntastic'

    " let Polyglot take its turn
    Plugin 'sheerun/vim-polyglot'

    " vim-scripts repos
    Plugin 'airblade/vim-gitgutter.git'
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'Absolight/vim-bind.git'
    Plugin 'BrianAker/dhcpd.vim'
    Plugin 'BrianAker/shell-commands'
    Plugin 'EasyGrep'
    Plugin 'Gundo'
    Plugin 'YankRing.vim'
    " Plugin 'chase/vim-ansible-yaml'
    Plugin 'clang-complete'
    Plugin 'cmdalias.vim'
    " Plugin 'cpp.vim'
    Plugin 'darfink/vim-plist'
     
    " Git made easy for vim
    Plugin 'fugitive.vim'

    Plugin 'git-commit'
    Plugin 'gnupg.vim'
    Plugin 'ifdef-highlighting'
    " Plugin 'ingydotnet/yaml-vim'
    Plugin 'lodgeit.vim'
    Plugin 'matchit.zip'
    Plugin 'molokai'
    Plugin 'mitsuhiko/vim-jinja'
    Plugin 'myint/syntastic-extras'
    Plugin 'pep8'
    Plugin 'hashivim/vim-consul'
    Plugin 'hashivim/vim-nomadproject'
    Plugin 'hashivim/vim-ottoproject'
    Plugin 'hashivim/vim-packer'
    Plugin 'hashivim/vim-terraform'
    Plugin 'hashivim/vim-vagrant'
    Plugin 'hashivim/vim-vaultproject'
    Plugin 'justinmk/vim-syntax-extra'
    " Plugin 'ruby.vim'
    Plugin 'saltstack/salt-vim'
    Plugin 'scrooloose/nerdtree'
    Plugin 'snipMate'
    Plugin 'sqlite_c'
    Plugin 'SudoEdit.vim'
    Plugin 'vim-ctrlspace/vim-ctrlspace'
    Plugin 'tabman.vim'
    Plugin 'taglist.vim'
    Plugin 'tpope/vim-pastie'
    Plugin 'tpope/vim-speeddating'
    Plugin 'vim-scripts/a.vim'
    Plugin 'vim-scripts/c.vim'
    Plugin 'vim-scripts/csv.vim'
    Plugin 'vim-scripts/syntaxm4.vim'
    Plugin 'xmledit'
    Plugin 'altercation/vim-colors-solarized'
    Plugin 'twerth/ir_black'

    " All of your Plugins must be added before the following line
    " Plugin 'git://github.com/seveas/bind.vim.git'
    " Plugin 'git://repo.or.cz/vcscommand'
    " Plugin 'refactor'
    " Plugin 'tomtom/checksyntax_vim'
    " Plugin 'tomtom/quickfixsigns_vim'
    " Plugin 'vcslogdiff'
    call vundle#end()            " required
    filetype plugin indent on    " required
endif

if has('gui_running')
    if has('gui_mac')
        set gfn=Menlo\ Regular:h18
        set go-=T
        " Settings for MacVim and Inconsolata font
        " let g:CtrlSpaceSymbols = { "File": "◯", "CTab": "▣", "Tabs": "▢" }
    endif
endif

if filereadable( expand("$HOME/.vim/colors/solarized.vim") )
    "
    " lazy method of appending this onto your .vimrc ":w! >> ~/.vimrc"
    " ------------------------------------------------------------------
    " this block of commands has been autogenerated by solarized.vim and
    " includes the current, non-default Solarized option values.
    " To use, place these commands in your .vimrc file (replacing any
    " existing colorscheme commands). See also ":help solarized"

    " ------------------------------------------------------------------
    " Solarized Colorscheme Config
    " ------------------------------------------------------------------
    set background=dark
    colorscheme solarized
    " ------------------------------------------------------------------

    " The following items are available options, but do not need to be
    " included in your .vimrc as they are currently set to their defaults.

    let g:solarized_termtrans=1
    " let g:solarized_degrade=0
    " let g:solarized_bold=1
    " let g:solarized_underline=1
    " let g:solarized_italic=1
    " let g:solarized_termcolors=16
    " let g:solarized_contrast="normal"
    " let g:solarized_visibility="normal"
    " let g:solarized_diffmode="normal"
    " let g:solarized_hitrail=0
    " let g:solarized_menu=1
endif


if has("macunix")
    set makeprg=gmake
endif

set autowrite " please vim to save file any time I go to the command mode
set backspace=indent,eol,start
" set sts=2
syn on
set modelines=5
set modeline
set hlsearch
set wildignore=*.o,*.lo,*.swp,*.bak,*.pyc,*.class
set incsearch
set showmatch
" Required for vim-ctrlspace
set hidden " let hide unwritten buffers
set showcmd " show uncomplete command
set title " set xterm title to current file
set titleold=xterm " if title can not be restored, set it to this value
set ruler
set nostartofline
"set cino=(4
"set cino+=(0
set mps+=<:>
if has("autocmd")
    " Recognize yy files as Yacc
    autocmd BufRead,BufNewFile *.yy setfiletype yacc
    " autocmd BufRead *.test set syntax=mysql_test     
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost * if line("'\"") && line("'\"") <= line("$") | exe "normal `\"" | endif
endif

set path=**2
set mousehide           " Hide the mouse when typing text
set visualbell t_vb=

" autocmd BufNewFile,BufRead *.i set filetype=swig 
" autocmd BufNewFile,BufRead *.swg set filetype=swig 
" autocmd BufNewFile,BufRead *.j2 set filetype=jinja

map  :Lodgeit<CR> 


if has("autocmd")
    " BEGIN syntax/m4.vim
    let g:m4_default_quote="`,'" 
    let g:m4_default_comment='#' 
    " END syntax/m4.vim

    " BEGIN vim-markdown
    let g:vim_markdown_folding_disabled=1
    " END vim-markdown

    " BEGIN Syntastic configuration
    if filereadable( expand('~/.vim/bundle/syntastic/LICENCE') )
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
        let g:syntastic_sh_checkers = ['shellcheck']
        let g:syntastic_quiet_messages = { 'regex': 'SC2148\|SC1090' }
        " chase/ansible
        let g:ansible_options = {'ignore_blank_lines': 0}
    endif
    " End Syntastic configuration


    " Airline
    let g:airline#extensions#tabline#enabled = 1
endif

set nofoldenable    " disable folding

" Mix opinion on
" set noswapfile
set nobackup

set wildmenu
set wildmode=list:longest

augroup vimrcEx
    autocmd VimEnter * call CmdAlias('X','x')
augroup END
