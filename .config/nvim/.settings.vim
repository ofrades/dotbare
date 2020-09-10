""""STYLE""""

set nocompatible
syntax enable
let g:seoul256_srgb = 1
set termguicolors
"" Unified color scheme (default: dark)
color seoul256

" Light color scheme
color seoul256-light
" Switch
set background=dark
set t_Co=256

" Italics
    highlight htmlArg cterm=italic gui=italic
    highlight Comment cterm=italic gui=italic
    highlight Type    cterm=italic gui=italic

let g:echodoc#enable_at_startup = 1

set completeopt=preview,longest,menuone,noinsert,noselect
" set completepopup=highlight:Pmenu,border:on

set previewheight=5
set cmdheight=2

" vim-highlightedyank different color
hi HighlightedyankRegion cterm=none guibg=#333333
hi Normal ctermbg=none guibg=none
hi LineNr guibg=none ctermbg=none

" center cursor middle of screen
set so=999

" This enables file type detection (like filetype on)
filetype plugin indent on

set autoindent   " Copy indent from current line when starting a new line
set smartindent
set clipboard=unnamed " use system clipboard
set showcmd      " display incomplete commands
set showmode     " display the mode you're in
set backspace=indent,eol,start "intuitive backspacing"
set wildmenu     " enhanced command line completion
" set wildmode=list:longest,full"

""" Search
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
set scrolloff=3  " show 3 lines of context around cursor
set display+=lastline "Display as much as possible of a window's last line
set title        " show terminal title
set visualbell   " no beeping

"" Global tabs/spaces
set smarttab     " use spaces instead of tabs
set tabstop=2    " global tab width
set shiftwidth=2
set laststatus=2 " Always show a status line
set expandtab
set softtabstop=2

set noswapfile " No swap files
set autoread " Automatically re-read files changed outside of vim

set encoding=utf-8

set mouse=a
