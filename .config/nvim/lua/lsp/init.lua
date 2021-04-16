local sign_define = vim.fn.sign_define
local lsp = vim.lsp

-- Completion
require "lsp.compe"

local on_attach = function(client, bufnr)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
    augroup lsp_document_highlight
    autocmd! * <buffer>
    autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
    autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    augroup END
    ]],
      false
    )
  end
end

-- config that activates keymaps and enables snippet support
local function make_config()
  local capabilities = lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  return {
    -- enable snippet support
    capabilities = capabilities,
    -- map buffer local keybindings when the language server attaches
    on_attach = on_attach
  }
end

local function setup_servers()
  require "lspinstall".setup()
  local servers = require "lspinstall".installed_servers()
  for _, server in pairs(servers) do
    local config = make_config()
    --[[ if server == "efm" then
      config = vim.tbl_extend("force", config, require'lsp.efm')
      print('Starting efm server...')
    end ]]
    require "lspconfig"[server].setup {config}
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require "lspinstall".post_install_hook = function()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end
-- TODO require efm until fix lspinstall efm
require "lsp.efm"

local saga = require "lspsaga"
saga.init_lsp_saga()

lsp.handlers["textDocument/publishDiagnostics"] =
  lsp.with(
  lsp.diagnostic.on_publish_diagnostics,
  {
    underline = true,
    virtual_text = true,
    signs = true,
    update_in_insert = true
  }
)

lsp.handlers["textDocument/hover"] =
  lsp.with(
  lsp.handlers.hover,
  {
    border = "single"
  }
)

--[[ sign_define(
  "LspDiagnosticsSignError",
  {
    text = " "
  }
)

sign_define(
  "LspDiagnosticsSignWarning",
  {
    text = " "
  }
)

sign_define(
  "LspDiagnosticsSignInformation",
  {
    text = " "
  }
)

sign_define(
  "LspDiagnosticsSignHint",
  {
    text = " "
  }
) ]]
