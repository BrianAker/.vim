" vim:set softtabstop=4 shiftwidth=4 expandtab :
" NOTE: vim-scripts is no longer being updated on Github, I am still using
" them for reference versions at this time
filetype off      " Vundle Requirement
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
let g:vundle_default_git_proto = 'git'


" let Syntastic take its turn
" Plugin 'scrooloose/syntastic'
Plugin 'w0rp/ale'

" let Polyglot take its turn
" Plugin 'sheerun/vim-polyglot'

" vim-scripts repos
Plugin 'airblade/vim-gitgutter.git'
Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
Plugin 'Absolight/vim-bind.git'
Plugin 'BrianAker/dhcpd.vim'
Plugin 'dkprice/vim-easygrep'
Plugin 'sjl/gundo.vim'
Plugin 'vim-scripts/gdbmgr'
Plugin 'pearofducks/ansible-vim'
Plugin 'Rip-Rip/clang_complete'
Plugin 'vim-scripts/cmdalias.vim'
" Plugin 'vim-legalese'
" Plugin 'vim-scripts/cpp.vim'
Plugin 'vim-jp/vim-cpp'
"
" additional vim c++ syntax 
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'darfink/vim-plist'

" Git made easy for vim
Plugin 'tpope/vim-fugitive'

" Plugin 'git-commit'
Plugin 'vim-scripts/gnupg.vim'
Plugin 'vim-scripts/ifdef-highlighting'
" Plugin 'ingydotnet/yaml-vim'
" Plugin 'vim-scripts/lodgeit.vim'
" Color scheme I do not use
" Plugin 'molokai'
Plugin 'mitsuhiko/vim-jinja'
" Plugin 'myint/syntastic-extras'
Plugin 'nvie/vim-flake8'
Plugin 'hashivim/vim-consul'
Plugin 'hashivim/vim-nomadproject'
Plugin 'hashivim/vim-ottoproject'
Plugin 'hashivim/vim-packer'
Plugin 'hashivim/vim-terraform'
Plugin 'hashivim/vim-vagrant'
Plugin 'hashivim/vim-vaultproject'
Plugin 'justinmk/vim-syntax-extra'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'saltstack/salt-vim'
"
Plugin 'vim-scripts/sqlite_c'
Plugin 'chrisbra/SudoEdit.vim'
Plugin 'vim-ctrlspace/vim-ctrlspace'
" Plugin 'kien/tabman.vim'
Plugin 'vim-scripts/taglist.vim'
Plugin 'vim-scripts/a.vim'
Plugin 'vim-scripts/c.vim'
Plugin 'vim-scripts/csv.vim'
Plugin 'vim-scripts/syntaxm4.vim'
Plugin 'sukima/xmledit'
Plugin 'xu-cheng/brew.vim'
" Color I use
Plugin 'altercation/vim-colors-solarized'
" Alternate color coding
" Plugin 'twerth/ir_black'
Plugin 'junegunn/vader.vim'
Plugin 'vim-scripts/vim-do'
Plugin 'will133/vim-dirdiff'
Plugin 'BrianAker/vim-groovy'
Plugin 'vim-scripts/grails-vim'
Plugin 'keith/swift.vim'
Plugin 'JulesWang/css.vim'
Plugin 'kurayama/systemd-vim-syntax'
Plugin 'leafgarland/typescript-vim'
Plugin 'uarun/vim-protobuf'
Plugin 'fatih/vim-go'
Plugin 'vim-scripts/vim-gtest'
Plugin 'dearrrfish/vim-applescript'
Plugin 'elzr/vim-json'
Plugin 'tpope/vim-jdaddy'
Plugin 'moll/vim-node'
" Plugin 'Yggdroot/indentLine'
Plugin 'tpope/vim-projectionist'
Plugin 'syngan/vim-vimlint'
Plugin 'ynkdir/vim-vimlparser'
Plugin 'vim-jekyll'
Plugin 'Clavelito/indent-sh.vim'

" Both required for Markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'JamshedVesuna/vim-markdown-preview'

" Vim Liquid runtime files with Jekyll enhancements
Plugin 'tpope/vim-liquid'

" Unused for the moment
Plugin 'mattn/webapi-vim'

" Unused for the moment
Plugin 'mattn/gist-vim'

" OpenHab
Plugin 'cyberkov/openhab-vim'

" Arduino
Plugin 'vim-scripts/Arduino-syntax-file'
"
"Plugin 'gu-fan/colorv.vim'
"
Plugin 'editorconfig/editorconfig-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
