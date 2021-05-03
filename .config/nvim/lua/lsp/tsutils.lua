require("lspconfig").typescript.setup {
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
