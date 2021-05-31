-- auto
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  buf_set_keymap("n", "gh", "<Cmd>lua vim.lsp.buf.hover()<CR>", {})
  buf_set_keymap("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", {})
  buf_set_keymap("n", "<leader>[", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", {})
  buf_set_keymap("n", "<leader>]", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", {})
  buf_set_keymap("n", "gr", ":Telescope lsp_references<CR>")
  buf_set_keymap("n", "gy", ":Telescope lsp_document_symbols<CR>")
  buf_set_keymap("n", "gY", ":Telescope lsp_workspace_symbols<CR>")
  buf_set_keymap(
    "n",
    "ga",
    ":lua require'telescope.builtin'.lsp_code_actions(require('telescope.themes').get_dropdown({results_height = 10}))<CR>"
  )
  buf_set_keymap("n", "gx", ":Telescope lsp_document_diagnostics<CR>", {})
  buf_set_keymap("n", "gX", ":Telescope lsp_workspace_diagnostics<CR>", {})
  buf_set_keymap("n", "gd", ":Telescope lsp_definitions<CR>", {})

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end
  if client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("v", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end
end

local on_init = function(client)
  if client.config.flags then
    client.config.flags.allow_incremental_sync = true
  end
end

local function make_config()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits"
    }
  }
  return {
    capabilities = capabilities,
    on_init = on_init,
    on_attach = on_attach
  }
end

local function setup_servers()
  require "lspinstall".setup()
  local servers = require "lspinstall".installed_servers()
  for _, server in ipairs(servers) do
    local config = make_config()
    require "lspconfig"[server].setup {config}
  end
end

setup_servers()

require "lspinstall".post_install_hook = function()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

-- ts
require "lspconfig".typescript.setup {
  config = make_config(),
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

require "lspconfig".jsonls.setup {
  -- Set the schema so that it can be completed in settings json file.
  settings = {
    json = {
      schemas = require "nlspsettings.jsonls".get_default_schemas()
    }
  }
}

local luadev = require("lua-dev").setup()

local lspconfig = require("lspconfig")
lspconfig.lua.setup(luadev)
