""""MAPS""""

let mapleader = " "
nnoremap <SPACE> <Nop>

" FZF
 nnoremap <silent> <C-p> :GFiles<CR>
 nnoremap <leader>p :Files<CR>
 nnoremap <silent> <C-f> :Rg<CR>
 nnoremap <silent> <C-b> :Buffers<CR>
 " nnoremap <silent> <C-m> :Maps<CR>
 nnoremap <silent> <C-c> :Commands<CR>

" NAVIGATE OPTIONS
inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "\<C-k>"
" jk TO ESCAPE
inoremap jk <Esc>

nnoremap <Up> <C-y>
nnoremap <Down> <C-e>
" Switch between tabs
nnoremap <Right> gt
nnoremap <Left>  gT

" TMUX
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>

nmap s <Plug>(easymotion-s2)
" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" For long, wrapped lines
nnoremap k gk
" For long, wrapped lines
nnoremap j gj

" For moving quickly up and down,
" Goes to the first line above/below that isn't whitespace
" Thanks to: http://vi.stackexchange.com/a/213
nnoremap gj :let _=&lazyredraw<CR>:set lazyredraw<CR>/\%<C-R>=virtcol(".")<CR>v\S<CR>:nohl<CR>:let &lazyredraw=_<CR>
nnoremap gk :let _=&lazyredraw<CR>:set lazyredraw<CR>?\%<C-R>=virtcol(".")<CR>v\S<CR>:nohl<CR>:let &lazyredraw=_<CR>

" Telescope
" nnoremap <Leader>tb <cmd>lua require'telescope.builtin'.builtin{}<CR>
nnoremap <Leader>p <cmd>lua require'telescope.builtin'.find_files{}<CR>
nnoremap <Leader>f <cmd>lua require'telescope.builtin'.quickfix{}<CR>
nnoremap <Leader>b <cmd>lua require'telescope.builtin'.buffers{}<CR>
nnoremap <Leader>n <cmd>lua require'telescope.builtin'.find_files{ cwd = "~/.config/nvim/" }<CR>

nnoremap <Leader>gf <cmd>lua require'telescope.builtin'.git_files{}<CR>
nnoremap <Leader>tg <cmd>lua require'telescope.builtin'.live_grep{}<CR>
nnoremap <Leader>tgs <cmd>lua require'telescope.builtin'.grep_string{}<CR>
nnoremap <Leader>tll <cmd>lua require'telescope.builtin'.loclist{}<CR>
nnoremap <Leader>tlr <cmd>lua require'telescope.builtin'.lsp_references{}<CR>
nnoremap <Leader>ta <cmd>lua require'telescope.builtin'.lsp_code_actions{}<CR>
nnoremap <Leader>tlds <cmd>lua require'telescope.builtin'.lsp_document_symbols{}<CR>
nnoremap <Leader>tch <cmd>lua require'telescope.builtin'.command_history{}<CR>
nnoremap <Leader>tlws <cmd>lua require'telescope.builtin'.lsp_workspace_symbols{}<CR>
nnoremap <Leader>tt <cmd>lua require'telescope.builtin'.treesitter{}<CR>
nnoremap <Leader>tp <cmd>lua require'telescope.builtin'.planets{}<CR>
nnoremap <Leader>tcb <cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find{}<CR>

" Move lines up and down
nnoremap <silent> <A-k>   :<C-u>move-2<CR>==
xnoremap <silent> <A-k>   :move-2<CR>gv=gv
nnoremap <silent> <A-j> :<C-u>move+<CR>==
xnoremap <silent> <A-j> :move'>+<CR>gv=gv
 
" Resize Splits
nnoremap <A-h> :vertical resize -5<CR>
nnoremap <A-j> :resize +5<CR>
nnoremap <A-k> :resize -5<CR>
nnoremap <A-h> :vertical resize +5<CR>
