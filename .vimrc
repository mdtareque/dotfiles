set nocompatible              " be iMproved
syntax on
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'scrooloose/syntastic'
" Plugin 'jiangmiao/auto-pairs'
Plugin 'bling/vim-airline'
Plugin 'tComment'
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/nerdtree'
" Plugin 'Lokaltog/vim-easymotion'
Plugin 'honza/vim-snippets'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

Plugin 'Rip-Rip/clang_complete'
Plugin 'Shougo/neocomplete.vim'
Plugin 'SirVer/ultisnips'

call vundle#end()

filetype plugin indent on     " Auto indent

set number                    " Show line numbers
set relativenumber            " Make the line numbers relative to current position

syntax enable
colorscheme mustang
set guifont=Inconsolata\ for\ Powerline\ 10

set laststatus=2
set encoding=utf-8
set ffs=unix,dos,mac
set t_Co=256

set so=12                     " Avoid cursor getting to bottom/top
set wildignore=*.o,*~,*.pyc
set ruler
set cmdheight=1

" Search options
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

set nobackup
set nowb
set noswapfile

set expandtab
set smarttab
set shiftwidth=4
set	tabstop=4

set ai
set si
set wrap

map j gj
map k gk

" move between viewports
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

nnoremap H 0
nnoremap L $
vnoremap H 0
vnoremap L $

inoremap <C-Space> <esc>

" Set leader key
let g:mapleader = ","

" Open at the previous cursor position
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

" map <Leader> <Plug>(easymotion-prefix)

let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
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

" Copy to clipboard
vnoremap <leader>y "+y
" Paste from clipboard
vnoremap <leader>p "+p

nnoremap <leader>w :w<CR>

let g:vim_markdown_folding_disabled=1

" neocomplete
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" " Plugin key-mappings.
" inoremap <expr><C-g>     neocomplete#undo_completion()
" inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  " For no inserting <CR> key.
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><C-j>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-k>  pumvisible() ? "\<C-p>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

let g:neocomplete#enable_auto_close_preview = 1


" clang_complete + neovim
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.c =
            \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
let g:neocomplete#force_omni_input_patterns.cpp =
            \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
let g:clang_complete_auto = 0
let g:clang_auto_select = 0
let g:clang_default_keymappings = 0
let g:clang_use_library = 1

