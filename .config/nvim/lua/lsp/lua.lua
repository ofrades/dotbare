local lspconfig = require 'lspconfig'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- function to attach completion when setting up lsp
local on_attach = function(client)
    print("'" .. client.name .. "' server attached")
end

lspconfig.sumneko_lua.setup {
  cmd = {"/home/ofrades/lua-language-server/bin/Linux/lua-language-server", "-E", "/home/ofrades/lua-language-server/main.lua"};
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {version = "LuaJIT"},
      diagnostics = {enable = true, globals = {"vim", "use", "lua"}},
      workspace = {
        library = {[vim.fn.expand("$VIMRUNTIME/lua")] = true, [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true}
      }
    }
  }
}
