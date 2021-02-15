local lsp = vim.lsp
local util = require "lspconfig/util"
local lspconfig = require "lspconfig"

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client)
    print("'" .. client.name .. "' server attached")
end

lspconfig.vuels.setup{
  root_dir = function(fname)
    return util.root_pattern("tsconfig.json")(fname) or
    util.root_pattern(".eslintrc","package.json", ".git", "vue.config.js")(fname);
  end,
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    config = {
      vetur = {
        completion = {
          autoImport = true,
          useScaffoldSnippets = true,
          scaffoldSnippetSources = {
            user = "🗒️",
            vetur = "✌",
            workspace = "␣"
          }
        },
        format = {
          defaultFormatter = {
            js = "prettier",
            ts = "prettier",
            html = "prettier",
            css = "prettier",
          }
        }
      }
    }
  }
}
