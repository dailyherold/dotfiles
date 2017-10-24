set nocompatible              " be iMproved
filetype off                  " required!
syntax enable
let mapleader=" "
set hidden

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"===================
"  VUNDLE/PLUGINS      
"===================
" let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'rking/ag.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tmux-plugins/vim-tmux-focus-events'
Plugin 'airblade/vim-gitgutter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'pearofducks/ansible-vim'

"Plugin 'Lokaltog/vim-easymotion'
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"Plugin 'L9'
"Plugin 'FuzzyFinder'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"===================
"  PLUGIN OPTIONS     
"===================

"airline/powerline
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
set noshowmode

"nerdtree
map <leader>n :NERDTreeToggle<CR>
nmap <leader>j :NERDTreeFind<CR>
let NERDTreeShowHidden=1

"solarized
call togglebg#map("<F5>")
let g:solarized_bold=0
"let g:solarized_termcolors=256
set background=dark
colorscheme solarized

"transparent bg
hi Normal ctermbg=none
hi NonText ctermbg=none

"gitgutter
set signcolumn=yes

"===================
"   VIM SETTINGS
"===================

set number
set relativenumber
set autoread
set colorcolumn=90
set pastetoggle=<F3>
set hlsearch
set nowrap

" canonical dirs for backups and swap files
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//

" Esc search
"nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>

" Quick reload of .vimrc
nmap <leader>r :source ~/.vimrc<CR>

" keymap to toggle line numbers
nmap <F2> :set invnumber invrelativenumber<CR>

" Toggle relative numbers on FocusLost
autocmd FocusLost * :set number norelativenumber
" Using vim-tmux-navigator, on FocusLost ^[[O was left behind
" https://github.com/tmux-plugins/vim-tmux-focus-events/issues/2
autocmd FocusLost * silent redraw!
autocmd FocusGained * :set number relativenumber
" Toggle relative numbers in insert mode
autocmd InsertEnter * :set number norelativenumber
autocmd InsertLeave * :set number relativenumber

"quick change modes
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

