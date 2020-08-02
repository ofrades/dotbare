" =========================
" REMEMBER THIS
" =========================
" you will need vim 8.2+ or neovim
" press space <leader> to see available keybindings

if empty(glob('~/.vim/autoload/plug.vim'))
silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ==========================
" Plugins
" ==========================

call plug#begin('~/.vim/plugged')

" Style
Plug 'junegunn/seoul256.vim'
Plug 'morhetz/gruvbox'
  let g:gruvbox_italic=1
Plug 'ap/vim-css-color'                               " show color preview
Plug 'mhinz/vim-startify'                             " nice start when vim is called without file
Plug 'junegunn/goyo.vim'                              " distraction free writing in vim - Leader G or :Goyo
Plug 'junegunn/limelight.vim'                         " focus where you are and darkens the rest - Leader L or :Limelight!!

" Features
Plug 'tpope/vim-surround'                          " Quoting parenthesing made simple - ysiw
Plug 'tpope/vim-commentary'                        " Comments - gc/gcc
Plug 'justinmk/vim-sneak'                          " Jump to any location specified by two characters - s/S followed by 3 characters
  let g:sneak#label = 1
Plug 'christoomey/vim-tmux-navigator'                 " interaction with tmux - C-h/j/k/l
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }   " fuzzy file search
Plug 'junegunn/fzf.vim'                               " fuzzy file search - C-p
Plug 'junegunn/vim-peekaboo'                          " use  and @ in normal mode and C-t in insert mode to see registers
Plug 'mg979/vim-visual-multi', {'branch': 'master'}   " Multiple cursors C-n, C-up/down to create cursors and \\A to select all occurrences
Plug 'terryma/vim-expand-region'                      " Expand selection - +/_ 
Plug 'machakann/vim-highlightedyank'                  " highlight yanked text
Plug 'voldikss/vim-floaterm'                          " popup terminal - F4
Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}       " Ranger in vim supports C-T(open to tag) C-X(horizontal) /C-V(vertical) and q to close

" Git 
Plug 'tpope/vim-fugitive'     " git wrapper
Plug 'airblade/vim-gitgutter'  " git diff in the sign column
Plug 'junegunn/gv.vim'        " commit window - :GV open commit browser, :GV! commits affected current file
Plug 'jreybert/vimagit'       " git workflow in new buffer - :Magit

" Languages
" source ~/.vimrc-omnisharp     " OmniSharp
Plug 'neoclide/coc.nvim', {'branch': 'release'}    " Conquer of Completion
Plug 'liuchengxu/vista.vim'                        " list of symbols

" Keymaps
Plug 'liuchengxu/vim-which-key'       " menu

call plug#end()

" ========================
" KEYMAPS
" ========================
" Leader Key
nnoremap <SPACE> <Nop>
let mapleader = "\<Space>"

source ~/.vimrc-which-key       " options for which_key
source ~/.vimrc-coc             " options for coc.nvim

" FILES IN PROJECT
nnoremap <silent> <C-p> :Files<CR>
" FIND IN FILES
nnoremap <silent> <C-f> :Rg<CR>
" NAVIGATE OPTIONS
inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "\<C-k>"
" jk TO ESCAPE
inoremap jk <Esc>

" TMUX
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>

let g:tmux_navigator_save_on_switch = 1
let g:fzf_prefer_tmux = 1

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let options = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  let options = fzf#vim#with_preview(options, 'right', 'ctrl-/')
  call fzf#vim#grep(initial_command, 1, options, a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   "rg --column --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>), 1,
  \   fzf#vim#with_preview('right', 'ctrl-/'), <bang>0)

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>, fzf#vim#with_preview('right', 'ctrl-/'), <bang>0)

" =========================
" STYLE
" =========================
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

" set completeopt=popup,preview
" set completepopup=highlight:Pmenu,border:on

set previewheight=5

" vim-highlightedyank different color
hi HighlightedyankRegion cterm=NONE ctermbg=239 guibg=#4e4e4e

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

" =================
" STATUS LINE
" ================

function! s:statusline_expr()
  let user = $USER
  let mod = "%{&modified ? '[+] ' : !&modifiable ? '[x] ' : ''}"
  let ro  = "%{&readonly ? '[RO] ' : ''}"
  let ft  = "%{len(&filetype) ? '['.&filetype.'] ' : ''}"
  let fug = "%{exists('g:loaded_fugitive') ? fugitive#statusline() : ''}"
  let sep = ' %= '
  let pos = ' %-12(%l : %c%V%) '
  let pct = ' %P'

  return '[%n] %F %<'.mod.ro.ft.fug.sep.pos.'%*'.pct
endfunction
let &statusline = s:statusline_expr()



" ============================================================================
" FZF
" ============================================================================
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
let $FZF_DEFAULT_OPTS .= ' --inline-info'

" All files
command! -nargs=? -complete=dir AF
  \ call fzf#run(fzf#wrap(fzf#vim#with_preview({
  \   'source': 'fd --type f --hidden --follow --exclude .git --no-ignore . '.expand(<q-args>)
  \ })))

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Terminal buffer options for fzf
autocmd! FileType fzf
autocmd  FileType fzf set noshowmode noruler nonu


function! s:plug_help_sink(line)
  let dir = g:plugs[a:line].dir
  for pat in ['doc/*.txt', 'README.md']
    let match = get(split(globpath(dir, pat), "\n"), 0, '')
    if len(match)
      execute 'tabedit' match
      return
    endif
  endfor
  tabnew
  execute 'Explore' dir
endfunction

command! PlugHelp call fzf#run(fzf#wrap({
  \ 'source': sort(keys(g:plugs)),
  \ 'sink':   function('s:plug_help_sink')}))

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let options = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  let options = fzf#vim#with_preview(options, 'right', 'ctrl-/')
  call fzf#vim#grep(initial_command, 1, options, a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   "rg --column --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>), 1,
  \   fzf#vim#with_preview('right', 'ctrl-/'), <bang>0)

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>, fzf#vim#with_preview('right', 'ctrl-/'), <bang>0)

function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()

