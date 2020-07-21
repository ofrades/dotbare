" =========================
" REMEMBER THIS
" =========================
" you will need vim 8.2+ or neovim
" FZF KEYMAPS
"     F1 - All commands
"     C-p - open files
"     C-f - find in files
"     Leader p - Open buffers
"       C-t - tab split
"       C-x - h split
"       C-v - v split
" most of the time you will be able to go up and down with c-j and c-k
" but c-n and c-p will be better when in tmux
" c-o and c-i to go to previous and next position of cursor
" c-w followed by v or h will split pane
" gh see info, gd go to definition, gt gT next previous tab

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

" Editing
Plug 'neoclide/coc.nvim', {'branch': 'release'}    " Conquer of Completion
Plug 'tpope/vim-surround'                          " Quoting parenthesing made simple - ysiw
Plug 'tpope/vim-commentary'                        " Comments - gc/gcc
Plug 'justinmk/vim-sneak'                          " Jump to any location specified by two characters - s/S followed by 2 characters
  let g:sneak#label = 1

" File system
Plug 'christoomey/vim-tmux-navigator'                 " interaction with tmux - C-h/j/k/l
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }   " fuzzy file search
Plug 'junegunn/fzf.vim'                               " fuzzy file search - C-p
Plug 'junegunn/vim-peekaboo'                          " use  and @ in normal mode and C-t in insert mode to see registers
Plug 'preservim/nerdtree'                             " File tree explorer - F3
Plug 'terryma/vim-multiple-cursors'                   " Multiple cursors - add cursor next/previous C-n/p, skip next match C-x, Leader n select all
Plug 'terryma/vim-expand-region'                      " Expand selection - +/_ 
Plug 'machakann/vim-highlightedyank'                  " highlight yanked text

" Git 
Plug 'tpope/vim-fugitive'     " git wrapper
Plug 'airblade/vim-gitgutter'  " git diff in the sign column
Plug 'junegunn/gv.vim'        " commit window - :GV open commit browser, :GV! commits affected current file
Plug 'jreybert/vimagit'       " git workflow in new buffer - :Magit

" Languages
source ~/.vimrc-omnisharp       " C#

call plug#end()

" ========================
" KEYMAPS
" ========================
" Leader Key
nnoremap <SPACE> <Nop>
let mapleader = "\<Space>"
" SIDEBAR
nmap <F3> :NERDTreeToggle<CR>
nmap <F4> :terminal<CR>
" SHOW COMMANDS
nnoremap <silent> <F1> :Commands<CR>
" FILES IN PROJECT
nnoremap <silent> <C-p> :Files<CR>
" OPEN FILES IN PROJECT
nnoremap <silent> <Leader>p :Buffers<CR>
" FIND IN FILES
nnoremap <silent> <C-f> :Rg<CR>
" SEARCH LINE
nnoremap <silent> <Leader>L :Lines<CR>
" CLOSE
nnoremap <silent> <Leader>q :q<CR>
" SAVE
nnoremap <silent> <Leader>w :w<CR>
" NAVIGATE OPTIONS
inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "\<C-k>"
" jk TO ESCAPE
inoremap jk <Esc>
xnoremap jk <Esc>
cnoremap jk <C-c>
" Goyo
nnoremap <silent> <Leader>G :Goyo<CR>
" Limelight
nnoremap <silent> <Leader>L :Limelight!!<CR>
" Edit .vimrc quickly
map <Leader>v :sp ~/.vimrc<cr>

let g:multi_cursor_use_default_mapping=0

let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<Leader>a'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'


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

"" Unified color scheme (default: dark)
color seoul256

" Light color scheme
color seoul256-light
" Switch
set background=dark
set t_Co=256

" Italics
    highlight htmlArg cterm=italic
    highlight Comment cterm=italic
    highlight Type    cterm=italic

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

" ================================ 
" coc.nvim
" ================================

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

set pumheight=10    " Makes popup smaller
set ruler
set cursorline

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <F1> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use gh to show documentation in preview window.
nnoremap <silent> gh :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}


" ==========================
" Mappings for CoCList
" ==========================

" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

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

" ============================================================================
" SNIPPETS
" ============================================================================

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

