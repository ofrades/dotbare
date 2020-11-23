" === === MAPS === === "
let mapleader = " "
nnoremap <SPACE> <Nop>
nnoremap <silent> <space>r :so $MYVIMRC<CR>
nnoremap <silent> <space>, :e ~/.config/nvim/coc-settings.json<CR>
nnoremap <silent> <space>r :so ~/.vimrc<CR>

" === FZF === "
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-f> :Rg<CR>
nnoremap <silent> <C-t> :Lines<CR>
nnoremap <silent> <A-b> :Buffers<CR>
nnoremap <silent> <A-m> :Maps<CR>
nnoremap <silent> <C-c> :Commands<CR>

" === COC === "
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gR <Plug>(coc-rename)
nnoremap <silent> gh :call <SID>show_documentation()<CR>
nnoremap <silent> ge :CocCommand explorer<CR>
nnoremap <silent> gl :CocList<CR>
" nnoremap <silent> td :CocCommand todolist.create<CR>
nnoremap <silent> ga :CocAction<CR>
nnoremap <silent> gq :CocFix<CR>
nnoremap <silent> gb :CocCommand bookmark.toggle<CR>
xmap <leader>f  <Plug>(coc-format-selected)

 " === Telescope === "
nnoremap <silent> <space>tf :Telescope current_buffer_fuzzy_find<CR>
nnoremap <silent> <space>tg :Telescope grep_string<CR>
nnoremap <silent> <space>tp :Telescope git_files<CR>
nnoremap <silent> <space>tt :Telescope treesitter<CR>
nnoremap <silent> <space>tc :Telescope commands<CR>
nnoremap <silent> <space>to :Telescope old_files<CR>
nnoremap <silent> <space>th :Telescope command_history<CR>
nnoremap <silent> <space>th :Telescope help_tags<CR>
nnoremap <silent> <space>tv :Telescope vim_options<CR>
nnoremap <silent> <space>tm :Telescope marks<CR>

" === Terminal === "
nnoremap <silent> <A-t> :FloatermToggle<CR>
tnoremap <silent> <A-t> <C-\><C-n>:FloatermToggle<CR>

" === Lazygit === "
nnoremap <silent> <C-g> :LazyGit<CR>

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

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

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
