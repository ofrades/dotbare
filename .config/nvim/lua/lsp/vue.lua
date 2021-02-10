local lsp = vim.lsp
local lspconfig = require "lspconfig"

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client)
    print("'" .. client.name .. "' server attached")
end

lspconfig.vuels.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}
