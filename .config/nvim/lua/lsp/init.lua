vim.cmd [[packadd vim-vsnip]]
vim.cmd [[packadd vim-vsnip-integ]]
vim.cmd [[packadd nvim-lspconfig]]

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local map = require "settings.utils".map
local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
  print("LSP started...");
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
        autocmd!
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

-- errors, signs and stuff
require "lsp.diagnostics"

-- add servers
local servers = { "tsserver", "html", "bashls", "cssls", "jsonls", "elixirls" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach, capabilities = capabilities }
end


-- compe

vim.g.diagnostic_enable_virtual_text = 1

local function lsp_reload(buffer)
    vim.lsp.stop_client(vim.lsp.get_active_clients(buffer))
    vim.cmd("edit")
end

local function lsp_stop(buffer)
    vim.lsp.diagnostic.clear(buffer)
    vim.lsp.stop_client(vim.lsp.get_active_clients(buffer))
end

require'compe'.setup {
  enabled = true,
  debug = false,
  min_length = 1,
  preselect = 'always',

  source = {
      path = {
        priority = 8,
      },
      buffer = {
        priority = 9,
      },
      vsnip = {
        priority = 9,
      },
      nvim_lsp = {
        priority = 9,
        sort = false
      },
    -- nvim_lua = { ... overwrite source configuration ... };
  };
}

return{
    lsp_reload = lsp_reload,
    lsp_stop = lsp_stop
}
