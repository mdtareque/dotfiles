syntax on
set number
set relativenumber

set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'ervandew/supertab'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'altercation/vim-colors-solarized'
" Plugin 'jiangmiao/auto-pairs'
Plugin 'bling/vim-airline'
Plugin 'tComment'
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'honza/vim-snippets'

call vundle#end()            " required
filetype plugin indent on    " required

syntax enable
colorscheme mustang
set guifont=Inconsolata\ for\ Powerline\ 10

set laststatus=2
set encoding=utf-8
set t_Co=256

set so=12
set wildignore=*.o,*~,*.pyc
set ruler
set cmdheight=1

set ignorecase
set smartcase
set hlsearch
nmap // :noh<cr>
set pastetoggle=<F2>

set showmatch
set mat=2

set noerrorbells
set novisualbell
set t_vb=
set tm=500

set encoding=utf8
set ffs=unix,dos,mac

set nobackup
set nowb
set noswapfile

map j gj
map k gk

set expandtab
set smarttab
set shiftwidth=4
set	tabstop=4

set ai
set si
set wrap

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

nnoremap H 0
nnoremap L $
vnoremap H 0
vnoremap L $

inoremap <A-x> <esc>

" Set leader key
let mapleader = ","
let g:mapleader = ","
let maplocalleader = "\\"

autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remove stray ^M
noremap <leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Open .vimrc
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>sv :so $MYVIMRC<cr>

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" " Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'"
let g:airline_powerline_fonts = 1

set hidden
nmap <leader>n :enew<cr>
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>

" Open Nerd Tree split explorer
nnoremap <leader><TAB> :NERDTreeToggle<cr>
" comment line
nmap <space> gcc
" comment selection
vmap <space> gc

" clang support for ycm
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
map <Leader> <Plug>(easymotion-prefix)
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

let g:ycm_autoclose_preview_window_after_completion = 1
" Sudo write hack
nnoremap <leader>sw :w !sudo tee %<CR>

" Competitive Programming Stuffs
" Open sample
nnoremap <leader>rr :r /media/Development/start.cpp<cr>ggddGkddko
nnoremap <leader>tt iin_T{<cr>}
" Open Input File
nnoremap <leader>ci :execute "vsplit %:r.in"<CR><C-W>r<CR>
" Execute
nnoremap <leader>cr :execute '!g++ --std=c++11 ' . shellescape(join([expand("%:r"),"cpp"],"."),1).
    \ ' && ./a.out < '. shellescape(join([expand("%:r"), "in"], "."), 1)<CR>
" Copy code to clipboard
nnoremap <leader>cc ggvG"+y``
":inoremap <esc> <nop>

vnoremap <leader>y "+y
nnoremap <leader>w :w<CR>
