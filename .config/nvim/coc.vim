" === MAPS === "
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

nnoremap <silent> gh :call <SID>show_documentation()<CR>
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" === options === "

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

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

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" === extensions === "
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-actions',
  \ 'coc-yank',
  \ 'coc-bookmark',
  \ 'coc-marketplace',
  \ 'coc-tabnine',
  \ 'coc-smartf',
  \ 'coc-highlight',
  \ 'coc-calc',
  \ 'coc-todolist',
  \ 'coc-lists',
  \ 'coc-emmet',
  \ 'coc-tasks',
  \ 'coc-pairs',
  \ 'coc-yank',
  \ 'coc-floaterm',
  \ 'coc-fzf-preview',
  \ 'coc-gist',
  \ 'coc-emoji',
  \ 'coc-explorer',
  \ 'coc-svg',
  \ 'coc-prettier',
  \ 'coc-eslint',
  \ 'coc-stylelint',
  \ 'coc-git',
  \ 'coc-vimlsp',
  \ 'coc-sh',
  \ 'coc-html',
  \ 'coc-markdownlint',
  \ 'coc-tsserver',
  \ 'coc-jest',
  \ 'coc-css',
  \ 'coc-styled-components',
  \ 'coc-cssmodules',
  \ 'coc-tailwindcss',
  \ 'coc-vetur',
  \ 'coc-svelte',
  \ 'coc-react-refactor',
  \ 'coc-angular',
  \ 'coc-omnisharp',
  \ 'coc-sql',
  \ 'coc-yaml',
  \ 'coc-python',
  \ 'coc-pyright',
  \ 'coc-xml',
  \ 'coc-json',
  \ ]
