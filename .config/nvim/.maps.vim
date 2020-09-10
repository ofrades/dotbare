""""MAPS""""

nnoremap <SPACE> <Nop>
let mapleader = "\<Space>"

source ~/.config/nvim/.which-key.vim       " options for which_key

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
