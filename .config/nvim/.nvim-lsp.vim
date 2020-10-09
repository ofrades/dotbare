""""NVIM-LSP""""

autocmd Filetype cs setl omnifunc=v:lua.vim.lsp.omnifunc
" Add keybindings for LSP
nnoremap <silent> gd      <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gh      <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gi      <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gr      <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> ge      <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gR      <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> ga      <cmd>lua vim.lsp.buf.code_action()<CR>
inoremap <silent> <c-k>   <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gt      <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gF      <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <silent> gs      <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gS      <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gW      <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gl      <cmd>lua vim.lsp.util.show_line_diagnostics()<CR>
"-----------------------------------------------------------------------------
" nvim-lsp Settings
"-----------------------------------------------------------------------------

let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_insert_delay = 1
let g:diagnostic_virtual_text_prefix = ' '
let g:space_before_virtual_text = 5

let g:vcm_direction = 'n'

"-----------------------------------------------------------------------------
" lua callbacks
"-----------------------------------------------------------------------------

lua << EOF

  local on_attach_vim = function(client)
    require'completion'.on_attach(client)
    require'diagnostic'.on_attach(client)
  end

  local lsp = require'nvim_lsp'
  lsp.vuels.setup{ on_attach=on_attach_vim }
  lsp.html.setup{ on_attach=on_attach_vim }
  lsp.jsonls.setup{ on_attach=on_attach_vim }
  lsp.omnisharp.setup{ on_attach=on_attach_vim }
  lsp.tsserver.setup{ on_attach=on_attach_vim }
  lsp.cssls.setup{ on_attach=on_attach_vim }
  lsp.bashls.setup{ on_attach=on_attach_vim }
EOF

" Statusline
function! LspStatus() abort
  if luaeval('#vim.lsp.buf_get_clients() > 0')
    return luaeval("require('lsp-status').status()")
  endif

  return ''
endfunction

sign define LspDiagnosticsErrorSign text=!
sign define LspDiagnosticsWarningSign text=x
sign define LspDiagnosticsInformationSign text=i
sign define LspDiagnosticsHintSign text=>

let g:completion_enable_snippet = 'ultisnips'

set omnifunc=v:lua.vim.lsp.omnifunc
"autocmd Filetype rust setlocal omnifunc=v:lua.vim.lsp.omnifunc
" autocmd BufWritePre Filetype rust lua vim.lsp.buf.formatting_sync(nil, 1000)


lua vim.lsp.set_log_level("debug")
command! OpenLspLog execute '!open ' . v:lua.vim.lsp.get_log_path()

command! OpenInFinder execute '!open ' . expand("%:p:h")

""""SUPERTAB"""""
" Press Tab to scroll _down_ a list of auto-completions
let g:SuperTabDefaultCompletionType = "<c-n>"
