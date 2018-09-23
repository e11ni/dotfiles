" General
set number      " Show line numbers
set relativenumber

" Show lines as is
set textwidth=0
set nowrap

set showmatch   " Highlight matching brace
set visualbell  " Use visual bell (no beeping)

set hlsearch    " Highlight all search results
set smartcase   " Enable smart-case search
set ignorecase  " Always case-insensitive
set incsearch   " Searches for strings incrementally

set autoindent   " Auto-indent new lines
set shiftwidth=4        " Number of auto-indent spaces
set smartindent " Enable smart-indent
set smarttab    " Enable smart-tabs
set softtabstop=4       " Number of spaces per Tab

set ruler       " Show row and column ruler information

set undolevels=1000     " Number of undo levels
set backspace=indent,eol,start  " Backspace behaviour

" Enable lightline plugin
set laststatus=2

" Toggle Tree on C-o
map <C-o> :NERDTreeToggle<CR>

" Highlight line numbers
highlight LineNr ctermfg=grey ctermbg=237
highlight CursorLineNr ctermfg=87 ctermbg=237 cterm=bold

" Highlight current line
set cursorline
highlight CursorLine ctermbg=60 cterm=bold

" Highlight line after textwidth
set colorcolumn=101
highlight ColorColumn ctermbg=95

" Toggle show hidden characters show on F5
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·
nnoremap <F5> :set list!<CR>

" Map swap lines commands
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Plugins section
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'w0rp/ale'
Plug 'dracula/vim'
Plug 'myusuf3/numbers.vim'
call plug#end()

