" === === MAPS === === "
let mapleader = " "
nnoremap <SPACE> <Nop>

" === FZF === "
 nnoremap <silent> <C-p> :Files<CR>
 nnoremap <silent> <C-f> :Rg<CR>
 nnoremap <silent> <A-b> :Buffers<CR>
 nnoremap <silent> <A-m> :Maps<CR>
 nnoremap <silent> <C-c> :Commands<CR>

" === Terminal === "
nnoremap   <silent>   <C-t>   :FloatermToggle<CR>
tnoremap   <silent>   <C-t>   <C-\><C-n>:FloatermToggle<CR>
" === Lazygit === "
 nnoremap <silent> <C-g> :FloatermNew lazygit<CR>
" === Ranger === "
 nnoremap <silent> <A-r> :FloatermNew ranger<CR>

" === Navigate list === " 
inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "\<C-k>"

" === Scroll === "
nnoremap <Up> <C-y>
nnoremap <Down> <C-e>

" === Switch between tabs === "
nnoremap <Right> gt
nnoremap <Left>  gT

" === TMUX === "
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>

" === easymotion === "
nmap s <Plug>(easymotion-s2)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" === Telescope === "
nnoremap <Leader>tb <cmd>lua require'telescope.builtin'.builtin{}<CR>
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

" === Move lines up and down === "
nnoremap <silent> <A-k>   :<C-u>move-2<CR>==
xnoremap <silent> <A-k>   :move-2<CR>gv=gv
nnoremap <silent> <A-j> :<C-u>move+<CR>==
xnoremap <silent> <A-j> :move'>+<CR>gv=gv
 
" === Resize Splits === "
nnoremap <silent> <A-h> <C-W><
nnoremap <silent> <A-l> <C-W>>
