local lspconfig = require "lspconfig"

local on_attach = function(client)
  print("'" .. client.name .. "' server attached")
end

lspconfig.elixirls.setup {
  cmd = {"/home/ofrades/elixir-ls/language_server.sh"},
  on_attach = on_attach,
}
