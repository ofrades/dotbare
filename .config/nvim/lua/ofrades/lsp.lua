require('lspkind').init()
require "ofrades.compe"
require "ofrades.servers"
require'nlspsettings'.setup()

vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    underline = true,
    virtual_text = true,
    signs = true,
    update_in_insert = false
  }
)

vim.lsp.handlers["textDocument/hover"] =
  vim.lsp.with(
  vim.lsp.handlers.hover,
  {
    border = "single"
  }
)
