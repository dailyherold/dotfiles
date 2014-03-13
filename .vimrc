set nocompatible              " be iMproved
filetype off                  " required!
syntax enable

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"===================
"      BUNDLES      
"===================
" let Vundle manage Vundle
Bundle 'gmarik/vundle'

Bundle 'altercation/vim-colors-solarized'
Bundle 'bling/vim-airline'

"Bundle 'tpope/vim-fugitive'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" vim-scripts repos
"Bundle 'L9'
"Bundle 'FuzzyFinder'

"===================
"      OPTIONS     
"===================
filetype plugin indent on     " required!

"airline/powerline
let g:airline_powerline_fonts=1
set laststatus=2
set noshowmode
"solarized
call togglebg#map("<F5>")
let g:solarized_bold=0
"let g:solarized_termcolors=256
set background=light
colorscheme solarized

"quick change modes
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif


"===================
"     SETTINGS     
"===================


"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.
