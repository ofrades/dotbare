local lspconfig = require "lspconfig"

-- function to attach completion when setting up lsp
local on_attach = function(client)
  print("'" .. client.name .. "' server attached")
end

lspconfig.bashls.setup {
  cmd = {"bash-language-server", "start"},
  filetypes = {"sh", "bash", "conf"},
  settings = {},
  on_attach = on_attach
}
