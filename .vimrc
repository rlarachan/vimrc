set nocompatible                       " required
filetype off                           " required
set rtp+=~/.vim/bundle/Vundle.vim      " required
call vundle#begin()                    " required

" Let Vundle manage itself
Plugin 'gmarik/Vundle.vim'

" Colorschemes
Plugin 'tomasr/molokai'

" Files
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'janko-m/vim-test'

" Utility
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-rake'
Plugin 'flazz/vim-colorschemes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Lokaltog/vim-powerline'
Plugin 'slim-template/vim-slim'
Plugin 'xero/sourcerer.vim'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-bundler'
Plugin 'airblade/vim-gitgutter'
Plugin 'Shougo/neocomplete.vim'

" Rails
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'

" Elixir
Plugin 'elixir-lang/vim-elixir'
Plugin 'slashmili/alchemist.vim'

" HTML / CSS / JS
Plugin 'tpope/vim-haml'
Plugin 'kchmck/vim-coffee-script'
Plugin 'alfredodeza/jacinto.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" Git
Plugin 'tpope/vim-fugitive'

call vundle#end()      " required

" Enable Solarized Theme
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_visibility="low"

set background=dark

syntax on
colorscheme molokai

filetype plugin indent on      " required

let mapleader=","

set ttymouse=xterm
set cursorline
set expandtab
set modelines=0
set mouse=ia
set shiftwidth=2
set clipboard=unnamed
set synmaxcol=128
set ttyscroll=10
set encoding=utf-8
set tabstop=2
set nowrap
set number
set expandtab
set nowritebackup
set noswapfile
set nobackup
set hlsearch
set ignorecase
set smartcase

" Automatic formatting
autocmd BufWritePre *.rb :%s/\s\+$//e
autocmd BufWritePre *.haml :%s/\s\+$//e
autocmd BufWritePre *.html :%s/\s\+$//e
autocmd BufWritePre *.scss :%s/\s\+$//e
autocmd BufWritePre *.slim :%s/\s\+$//e

au BufNewFile * set noeol
" Coffee Script
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
au BufNewFile,BufReadPost *.coffee setl tabstop=2 softtabstop=2 shiftwidth=2 expandtab

au BufRead,BufNewFile *.go set filetype=go

" No show command
autocmd VimEnter * set nosc

" Quick ESC
imap jj <ESC>

" NERDCommenter
nmap <leader># :call NERDComment(0, "invert")<cr>
vmap <leader># :call NERDComment(0, "invert")<cr>

" JS
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab

au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
au BufNewFile,BufReadPost *.coffee setl tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" Jump to the next row on long lines
map <Down> gj
map <Up>   gk
nnoremap j gj
nnoremap k gk

" format the entire file
nmap <leader>fef ggVG=

" Open new buffers
nmap <leader>s<left>   :leftabove  vnew<cr>
nmap <leader>s<right>  :rightbelow vnew<cr>
nmap <leader>s<up>     :leftabove  new<cr>
nmap <leader>s<down>   :rightbelow new<cr>

" Tab between buffers
noremap <tab> <c-w><c-w>

" Switch between last two buffers
nnoremap <leader><leader> <C-^>

" Resize buffers
if bufwinnr(1)
  nmap Ä <C-W><<C-W><
  nmap Ö <C-W>><C-W>>
  nmap ö <C-W>-<C-W>-
  nmap ä <C-W>+<C-W>+
endif

" NERDTree
" nmap <leader>n :NERDTreeToggle<CR>
map <tab> :NERDTreeToggle<CR>
map <c-h> <c-w><left>
map <c-k> <c-w><up>
map <c-j> <c-w><down>
map <c-l> <c-w><right>

let NERDTreeHighlightCursorline=1
let NERDTreeIgnore = ['tmp', '.yardoc', 'pkg']

" CtrlP
nnoremap <silent> t :CtrlP<cr>
let g:ctrlp_working_path_mode = ''
let g:ctrlp_max_files = 600
let g:ctrlp_max_depth = 5

" CLIPBOARD
let os=substitute(system('uname'), '\n', '', '')
if os == 'Darwin' || os == 'Mac'
  vmap <C-c> y:call system("pbcopy", getreg("\""))<CR>
elseif os == 'Linux'
  vmap <C-c> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>
endif

let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['jshint']

let g:syntastic_error_symbol="❌"
let g:syntastic_warning_symbol = '❗️'
let g:syntastic_enable_balloons=1
let g:syntastic_loc_list_height = 5

" Run test
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
map ,mt :!mix test --stale<cr>
map ,rs :!rspec spec<cr>

" Quit with :Q
command -nargs=0 Quit :qa!
:command W w
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/node_modules/*,*/bower_components/*,*/tmp/*,*/deps/*
