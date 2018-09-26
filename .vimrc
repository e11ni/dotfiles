" General
set number      " Show line numbers
set relativenumber

" Show lines as is
set textwidth=0
set nowrap

set syntax=on

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

set laststatus=2

" Toggle Tree on C-o
map <C-o> :NERDTreeToggle<CR>

" Toggle show hidden characters show on F5
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·
nnoremap <F5> :set list!<CR>

" Map swap lines commands
nnoremap <C-S-j> :m .+1<CR>==
nnoremap <C-S-k> :m .-2<CR>==
inoremap <C-S-j> <Esc>:m .+1<CR>==gi
inoremap <C-S-k> <Esc>:m .-2<CR>==gi
vnoremap <C-S-j> :m '>+1<CR>gv=gv
vnoremap <C-S-k> :m '<-2<CR>gv=gv

" Map clean search result highlighting till next search
nnoremap <C-i> :nohls<CR>

" Map toggle comments
nmap <C-_> <leader>c<Space>
vmap <C-_> <leader>c<Space>
let g:NERDSpaceDelims = 1

" Plugins section
call plug#begin('~/.vim/plugged')
  Plug 'itchyny/lightline.vim'
  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'tpope/vim-eunuch'
  Plug 'tpope/vim-surround'
  Plug 'scrooloose/nerdtree'
  Plug 'scrooloose/nerdcommenter'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'mattn/emmet-vim'
  Plug 'w0rp/ale'
  Plug 'myusuf3/numbers.vim'
  Plug 'sheerun/vim-polyglot'
  Plug 'chriskempson/base16-vim'
call plug#end()

" Set colorscheme
colorscheme base16-chalk
highlight Error ctermfg=white
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

" Highlight line numbers
highlight LineNr ctermfg=246 ctermbg=236
highlight CursorLineNr ctermfg=37 ctermbg=236 cterm=bold

" Highlight current line
set cursorline
highlight CursorLine ctermbg=235 cterm=none

" Highlight selected in visual mode with inverted color
if !$COLOR256_AVAIL
  highlight Comment ctermfg=darkblue
  highlight Visual cterm=reverse ctermbg=black
else
  highlight Visual ctermbg=237
endif

" Highlight line after textwidth
set colorcolumn=101
highlight ColorColumn ctermbg=95

" Highlight search results
highlight Search ctermbg=29

