" === === MAPS === === "
let mapleader = " "
nnoremap <SPACE> <Nop>
nnoremap <silent> <space>, :e ~/.config/nvim/coc-settings.json<CR>
nnoremap <silent> <space>r :so ~/.vimrc<CR>

" === FZF === "
nnoremap <silent> <C-p> :Telescope fd<CR>
nnoremap <silent> <C-f> :Telescope live_grep<CR>
nnoremap <silent> <space>f :Telescope grep_string<CR>
nnoremap <silent> <C-t> :Telescope current_buffer_fuzzy_find<CR>
nnoremap <silent> <A-b> :Telescope buffers<CR>
nnoremap <silent> <A-m> :Telescope keymaps<CR>
nnoremap <silent> <C-c> :Telescope commands<CR>

" === COC === "
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gR <Plug>(coc-rename)
nnoremap <silent> ge :CocCommand explorer<CR>
nnoremap <silent> gl :CocList<CR>
" nnoremap <silent> td :CocCommand todolist.create<CR>
nnoremap <silent> ga :CocAction<CR>
nnoremap <silent> gq :CocFix<CR>
nnoremap <silent> gb :CocCommand bookmark.toggle<CR>
xmap <leader>f  <Plug>(coc-format-selected)

 " === Telescope === "
nnoremap <silent> <space>gc :Telescope git_commits<CR>
nnoremap <silent> <space>gb :Telescope git_bcommits<CR>
" nnoremap <silent> <space>gb :Telescope git_branches<CR>
nnoremap <silent> <space>gs :Telescope git_status<CR>
nnoremap <silent> <space>h :Telescope command_history<CR>
nnoremap <silent> <space>t :Telescope builtin<CR>
" nnoremap <silent> <space>tt :Telescope treesitter<CR>
" nnoremap <silent> <space>tm :Telescope marks<CR>

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

nnoremap <Leader>n <cmd>lua require'telescope.builtin'.find_files{ cwd = "~/.config/nvim/" }<CR>

" === Move lines up and down === "
nnoremap <silent> <A-k>   :<C-u>move-2<CR>==
xnoremap <silent> <A-k>   :move-2<CR>gv=gv
nnoremap <silent> <A-j> :<C-u>move+<CR>==
xnoremap <silent> <A-j> :move'>+<CR>gv=gv

" === Resize Splits === "
nnoremap <silent> <A-h> <C-W><
nnoremap <silent> <A-l> <C-W>>
