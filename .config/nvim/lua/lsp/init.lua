local map = require "settings.utils".map

require "lsp.compe"
-- require "lsp.js"
require "lsp.ts"
require "lsp.html"
require "lsp.css"
require "lsp.json"
require "lsp.lua"
require "lsp.elixir"
require "lsp.bash"
-- require "lsp.efm"
-- require "lsp.dap"
require "lsp.saga"
require "lsp.diagnostics"

FormatRange = function()
  local start_pos = vim.api.nvim_buf_get_mark(0, "<")
  local end_pos = vim.api.nvim_buf_get_mark(0, ">")
  vim.lsp.buf.range_formatting({}, start_pos, end_pos)
end

vim.lsp.handlers["textDocument/formatting"] = function(err, _, result, _, bufnr)
  if err ~= nil or result == nil then
    return
  end
  if not vim.bo[bufnr].modified then
    local view = vim.fn.winsaveview()
    vim.lsp.util.apply_text_edits(result, bufnr)
    vim.fn.winrestview(view)
    if bufnr == vim.api.nvim_get_current_buf() then
      vim.cmd("noautocmd :update")
    end
  end
end

vim.cmd([[
  command! -range FormatRange  execute 'lua FormatRange()'
]])

vim.cmd([[
  command! LSPFormat  execute 'lua vim.lsp.buf.formatting()'
]])



