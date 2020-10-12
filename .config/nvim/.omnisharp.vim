"""""OMNISHARP""""
" Set this to 1 to use ultisnips for snippet handling
let s:using_snippets = 0

let g:OmniSharp_selector_ui = 'fzf'                  " Use fzf.vim
let g:OmniSharp_popup_options = {
      \ 'highlight': 'Normal',
      \ 'padding': [1],
      \ 'border': [1]
      \}
let g:OmniSharp_popup_mappings = {
      \ 'sigNext': '<C-n>',
      \ 'sigPrev': '<C-p>',
      \ 'lineDown': ['<C-e>', 'j'],
      \ 'lineUp': ['<C-y>', 'k']
      \}

" Possible solution to get vscode omnisharp extension
let g:OmniSharp_server_path = fnamemodify(findfile('run',$HOME . '/.vscode/extensions/*/.omnisharp/*/'),':p')


augroup omnisharp_commands
  autocmd!

  " Show type information automatically when the cursor stops moving.
  " Note that the type is echoed to the Vim command line, and will overwrite
  autocmd CursorHold *.cs OmniSharpTypeLookup

  " The following commands are contextual, based on the cursor position.
  autocmd FileType cs nmap <silent> <buffer> ogd <Plug>(omnisharp_go_to_definition)
  autocmd FileType cs nmap <silent> <buffer> ogh <Plug>(omnisharp_documentation)
  autocmd FileType cs nmap <silent> <buffer> opd <Plug>(omnisharp_preview_definition)
  autocmd FileType cs nmap <silent> <buffer> opi <Plug>(omnisharp_preview_implementations)
  autocmd FileType cs nmap <silent> <buffer> ofu<Plug>(omnisharp_find_usages)
  autocmd FileType cs nmap <silent> <buffer> ofi <Plug>(omnisharp_find_implementations)
  autocmd FileType cs nmap <silent> <buffer> ot <Plug>(omnisharp_type_lookup)
  autocmd FileType cs nmap <silent> <buffer> ofs <Plug>(omnisharp_find_symbol)
  autocmd FileType cs nmap <silent> <buffer> ofu <Plug>(omnisharp_fix_usings)
  autocmd FileType cs nmap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)
  autocmd FileType cs imap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)

  " Navigate up and down by method/property/field
  autocmd FileType cs nmap <silent> <buffer> [[ <Plug>(omnisharp_navigate_up)
  autocmd FileType cs nmap <silent> <buffer> ]] <Plug>(omnisharp_navigate_down)
  " Find all code errors/warnings for the current solution and populate the quickfix window
  autocmd FileType cs nmap <silent> <buffer> <Leader>cgcc <Plug>(omnisharp_global_code_check)
  " Contextual code actions (uses fzf, CtrlP or unite.vim when available)
  autocmd FileType cs nmap <silent> <buffer> <Leader>cca <Plug>(omnisharp_code_actions)
  autocmd FileType cs xmap <silent> <buffer> <Leader>cca <Plug>(omnisharp_code_actions)

  autocmd FileType cs nmap <silent> <buffer> <Leader>ccf <Plug>(omnisharp_code_format)

  autocmd FileType cs nmap <silent> <buffer> <Leader>cr <Plug>(omnisharp_rename)

  autocmd FileType cs nmap <silent> <buffer> <Leader>csr <Plug>(omnisharp_restart_server)
  autocmd FileType cs nmap <silent> <buffer> <Leader>css <Plug>(omnisharp_start_server)
  autocmd FileType cs nmap <silent> <buffer> <Leader>csx <Plug>(omnisharp_stop_server)
augroup END


" set completeopt=menuone,noinsert,noselect,popuphidden
" set completepopup=highlight:Pmenu,border:off


" Sharpenup: {{{
" All sharpenup mappings will begin with `<Space>os`, e.g. `<Space>osgd` for
" :OmniSharpGotoDefinition
let g:sharpenup_map_prefix = '<Space>os'

let g:sharpenup_statusline_opts = { 'Text': '%s (%p/%P)' }
let g:sharpenup_statusline_opts.Highlight = 0

augroup OmniSharpIntegrations
  autocmd!
  autocmd User OmniSharpProjectUpdated,OmniSharpReady call lightline#update()
augroup END
" }}}

" OmniSharp: {{{
let g:OmniSharp_popup_position = 'peek'
if has('nvim')
  let g:OmniSharp_popup_options = {
  \ 'winhl': 'Normal:NormalFloat'
  \}
else
  let g:OmniSharp_popup_options = {
  \ 'highlight': 'Normal',
  \ 'padding': [0, 0, 0, 0],
  \ 'border': [1]
  \}
endif
let g:OmniSharp_popup_mappings = {
\ 'sigNext': '<C-n>',
\ 'sigPrev': '<C-p>',
\ 'pageDown': ['<C-f>', '<PageDown>'],
\ 'pageUp': ['<C-b>', '<PageUp>']
\}

if s:using_snippets
  let g:OmniSharp_want_snippet = 1
endif

let g:OmniSharp_highlight_groups = {
\ 'ExcludedCode': 'NonText'
\}
" }}}
