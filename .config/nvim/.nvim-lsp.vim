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
" diagnostic
let g:diagnostic_show_sign = 1
let g:diagnostic_enable_underline = 1
let g:diagnostic_auto_popup_while_jump = 1
let g:diagnostic_virtual_text_prefix = '!'
let g:diagnostic_enable_virtual_text = 1
let g:space_before_virtual_text = 5
" let g:diagnostic_trimmed_virtual_text = '20'
let g:diagnostic_insert_delay = 0

let g:vcm_direction = 'n'

"-----------------------------------------------------------------------------
" lua callbacks
"-----------------------------------------------------------------------------

lua << EOF

local lsp = require'nvim_lsp'
local map = function(type, key, value)
	vim.fn.nvim_buf_set_keymap(0,type,key,value,{noremap = true, silent = true});
end

local on_attach_common = function(client)
	print("LSP started.");
	require'completion'.on_attach(client)

	-- GOTO mappings
	map('n','gD','<cmd>lua vim.lsp.buf.declaration()<CR>')
	map('n','gd','<cmd>lua vim.lsp.buf.definition()<CR>')
	map('n','K','<cmd>lua vim.lsp.buf.hover()<CR>')
	map('n','gr','<cmd>lua vim.lsp.buf.references()<CR>')
	map('n','gs','<cmd>lua vim.lsp.buf.signature_help()<CR>')
	map('n','gi','<cmd>lua vim.lsp.buf.implementation()<CR>')
	map('n','<leader>gt','<cmd>lua vim.lsp.buf.type_definition()<CR>')
	map('n','<leader>gw','<cmd>lua vim.lsp.buf.document_symbol()<CR>')
	map('n','<leader>gW','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')

	-- ACTION mappings
	map('n','<leader>ah',  '<cmd>lua vim.lsp.buf.hover()<CR>')
	map('n','<leader>af', '<cmd>lua vim.lsp.buf.code_action()<CR>')
	map('n','<leader>ee', '<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>')
	map('n','<leader>ar',  '<cmd>lua vim.lsp.buf.rename()<CR>')

	-- Few language severs support these three
	map('n','<leader>=',  '<cmd>lua vim.lsp.buf.formatting()<CR>')
	map('n','<leader>ai',  '<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
	map('n','<leader>ao',  '<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')

	-- -- if diagnostic plugin is installed
	-- map('n','<leader>ep','<cmd>PrevDiagnosticCycle<CR>')
	-- map('n','<leader>en','<cmd>NextDiagnosticCycle<CR>')
end

local servers = {
  'tsserver',
  'omnisharp',
  'cssls',
  'bashls',
  'diagnosticls',
  'html',
  'jsonls',
  'pyls',
  'vimls',
  'vuels'
}

lsp.tsserver.setup{on_attach=on_attach_common}
lsp.omnisharp.setup{on_attach=on_attach_common}
lsp.cssls.setup{on_attach=on_attach_common}
lsp.bashls.setup{on_attach=on_attach_common}
lsp.diagnosticls.setup{on_attach=on_attach_common}
lsp.html.setup{on_attach=on_attach_common}
lsp.jsonls.setup{on_attach=on_attach_common}
lsp.pyls.setup{on_attach=on_attach_common}
lsp.vimls.setup{on_attach=on_attach_common}
lsp.vuels.setup{on_attach=on_attach_common}

local strategy = { 'exact', 'substring', 'fuzzy' }
vim.g.completion_matching_strategy_list = strategy

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

let g:completion_enable_snippet = 'UltiSnips'

set omnifunc=v:lua.vim.lsp.omnifunc
"autocmd Filetype rust setlocal omnifunc=v:lua.vim.lsp.omnifunc
" autocmd BufWritePre Filetype rust lua vim.lsp.buf.formatting_sync(nil, 1000)


lua vim.lsp.set_log_level("debug")
command! OpenLspLog execute '!open ' . v:lua.vim.lsp.get_log_path()

command! OpenInFinder execute '!open ' . expand("%:p:h")

""""SUPERTAB"""""
" Press Tab to scroll _down_ a list of auto-completions
let g:SuperTabDefaultCompletionType = "<c-n>"
