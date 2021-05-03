-- Completion
require "lsp.compe"

local on_attach = function(client, bufnr)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    "documentation",
    "detail",
    "additionalTextEdits"
  }
}

require "lspinstall".setup()
local servers = require "lspinstall".installed_servers()
for _, server in pairs(servers) do
  require "lspconfig"[server].setup {
    on_attach = on_attach,
    capabilities = capabilities
  }
  if (server == "tsserver" or server == "typescript") then
    require "lspconfig"[server].setup {
      on_attach = function(client, bufnr)
        local ts_utils = require("nvim-lsp-ts-utils")
        ts_utils.setup {
          -- disable_commands = false,
          enable_import_on_completion = true,
          -- import_on_completion_timeout = 5000,
          -- eslint
          eslint_bin = "eslint_d",
          eslint_args = {"-f", "json", "--stdin", "--stdin-filename", "$FILENAME"},
          eslint_enable_diagnostics = true,
          -- eslint_diagnostics_debounce = 250,
          -- prettier
          enable_formatting = true,
          formatter = "prettier",
          formatter_args = {"--stdin-filepath", "$FILENAME"},
          format_on_save = true
        }
        -- required to enable ESLint code actions and formatting
        ts_utils.setup_client(client)
      end
    }
  end
end
-- TS
-- require "lsp.tsutils"

vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    underline = true,
    virtual_text = true,
    signs = false,
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
