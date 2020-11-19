" === persist undo === "
set undodir=~/.vim/undodir
set undofile

" === style === "
set termguicolors
syntax enable

" === teppz === "
let g:teppz_enable_italic = 1
let g:teppz_disable_italic_comment = 0
colorscheme teppz
set background=dark
set t_Co=256

" === italics === "
highlight htmlArg cterm=italic gui=italic
highlight Comment cterm=italic gui=italic
highlight Type    cterm=italic gui=italic

" === list === "
set completeopt=preview,longest,menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'subtring', 'fuzzy']
set previewheight=5

set cmdheight=2

" === highlightedyank === "
hi HighlightedyankRegion cterm=none guibg=#58659A guifg=#eeeeee
" hi Normal ctermbg=none guibg=none
" hi LineNr guibg=none ctermbg=none

" center cursor middle of screen
set scrolloff=10

" This enables file type detection (like filetype on)
filetype plugin indent on

set autoindent   " Copy indent from current line when starting a new line
set smartindent
set clipboard=unnamedplus " use system clipboard
set noshowmode
set noshowcmd      " display incomplete commands
set backspace=indent,eol,start "intuitive backspacing"
set wildmenu     " enhanced command line completion
" set wildmode=list:longest,full"

" === Search === "
set ignorecase   " case-insensitive search
set smartcase    " but case-sensitive if expression contains a capital letter
set relativenumber "show relative line number
set number         "show the line number of the current line
set ruler        " show cursor position
set incsearch    " highlight matches as you type
set hlsearch     " highlight matches

""" Regex
set gdefault     " use global option in regex by default

set nowrap         " turn on line wrapping
set display+=lastline "Display as much as possible of a window's last line
set visualbell   " no beeping

"" Global tabs/spaces
set smarttab     " use spaces instead of tabs
set tabstop=2    " global tab width
set shiftwidth=2
set expandtab
set softtabstop=2

set noswapfile " No swap files
set autoread " Automatically re-read files changed outside of vim

set encoding=utf-8

" === enable mouse === "
set mouse=a
