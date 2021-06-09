  local nvim_lsp = require('lspconfig')
require'lspinstall'.setup()

local function setup_formatting(bufnr)
  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>F", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  vim.api.nvim_command("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
end

local function setup_async_formatting(bufnr)
  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>F", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  -- Use asynchronous formatting from null-ls
  vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")
end

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gsd', '<Cmd>tab split | lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gh', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'gsh', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', 'gtd', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gR', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'gse', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', 'g[', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', 'g]', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', 'gq', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gA', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)

  if client.resolved_capabilities.document_formatting then
    setup_formatting(bufnr)
  end
  if client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("v", "<leader>F", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end

  require'lsp_signature'.on_attach()
end

local servers = require'lspinstall'.installed_servers()
for _, lsp in pairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end

local null_ls = require("null-ls")
local null_ls_sources = {
  null_ls.builtins.formatting.prettier.with({
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "css", "html", "json", "markdown" }
  }),
  null_ls.builtins.formatting.stylua.with({
    filetypes = { "lua" }
  }),
}
null_ls.setup {
  sources = null_ls_sources,
}
-- Manually add formatting on save for file types that do not have their own LSPs
vim.cmd("autocmd BufWritePost *.scss,*.html,*.json,*.md,*.css,*.yml,*.yaml lua vim.lsp.buf.formatting()")

local function attach_tsserver(client, bufnr)
  -- Disable tsserver formatting, use prettierd from null-ls inside ts-utils
  client.resolved_capabilities.document_formatting = false
  on_attach(client, bufnr)
  setup_async_formatting(bufnr)

  local ts_utils = require("nvim-lsp-ts-utils")
  ts_utils.setup {
    eslint_bin = "eslint_d",
    eslint_enable_diagnostics = true,
    eslint_diagnostics_debounce = 500,
    enable_formatting = true,
    formatter = 'prettier',
  }
  ts_utils.setup_client(client)
end

nvim_lsp.typescript.setup {
  on_attach = attach_tsserver
}

local luadev = require("lua-dev").setup()

nvim_lsp.lua.setup(luadev)
