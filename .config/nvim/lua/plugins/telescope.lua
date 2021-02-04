vim.cmd [[packadd telescope-fzy-native.nvim]]
local map = require "settings.utils".map
local finders = require "telescope.builtin"
local actions = require "telescope.actions"
local telescope = require "telescope"
local sorters = require "telescope.sorters"
local previewers = require "telescope.previewers"
local transform_mod = require("telescope.actions.mt").transform_mod

require("telescope").load_extension("fzy_native")

telescope.setup {
  defaults = {
    prompt_position = "top",
    prompt_prefix = " ❯",
    file_ignore_patterns = {".git/*", "node-modules"},
    shorten_path = true,
    color_devicons = true,
    winblend = 0,
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-h>"] = actions.goto_file_selection_split,
        ["<C-v>"] = actions.goto_file_selection_vsplit
      },
      n = {
        ["<esc>"] = actions.close
      }
    },
    file_sorter = sorters.get_fzy_sorter,
    generic_sorter = sorters.get_fzy_sorter,
    file_previewer = previewers.vim_buffer_cat.new,
    grep_previewer = previewers.vim_buffer_vimgrep.new,
    qflist_previewer = previewers.vim_buffer_qflist.new
  }
}

function TelescopeOpen(fn)
  require "settings.utils".move_cursor_from_tree()
  finders[fn](require("telescope.themes").get_dropdown({previewer = false}))
end

function TelescopeOpenPrewiev(fn)
  require "settings.utils".move_cursor_from_tree()
  finders[fn](require("telescope.themes").get_dropdown({}))
end

map("n", "<C-p>", "<CMD>lua TelescopeOpenPrewiev('oldfiles')<CR>")
map("n", "<leader>p", "<CMD>lua TelescopeOpenPrewiev('find_files')<CR>")
map("n", "<C-f>", "<CMD>lua TelescopeOpenPrewiev('live_grep')<CR>")
map("n", "<leader>bb", "<CMD>lua TelescopeOpen('buffers')<CR>")
map("n", "<leader>bt", "<CMD>lua TelescopeOpenPrewiev('current_buffer_tags')<CR>")
map("n", "<C-c>", "<CMD>lua TelescopeOpen('commands')<CR>")
map("n", "<leader>ll", "<CMD>lua TelescopeOpen('builtin')<CR>")
map("n", "<leader>lr", "<CMD>lua TelescopeOpenPrewiev('lsp_references')<CR>")
map("n", "<leader>ls", "<CMD>lua TelescopeOpenPrewiev('symbols')<CR>")
map("n", "<leader>gf", "<CMD>lua TelescopeOpenPrewiev('git_files')<CR>")
map("n", "<leader>gcc", "<CMD>lua TelescopeOpenPrewiev('git_commits')<CR>")
map("n", "<leader>gcb", "<CMD>lua TelescopeOpenPrewiev('git_bcommits')<CR>")
map("n", "<leader>gs", "<CMD>lua TelescopeOpenPrewiev('git_status')<CR>")
map("n", "<leader>gb", "<CMD>lua TelescopeOpenPrewiev('git_branches')<CR>")
map("n", "<leader>lsd", "<CMD>lua TelescopeOpenPrewiev('lsp_document_symbols')<CR>")
map("n", "<leader>lsw", "<CMD>lua TelescopeOpenPrewiev('lsp_workspace_symbols')<CR>")
map("n", "<leader>lca", "<CMD>lua TelescopeOpenPrewiev('lsp_code_actions')<CR>")
map("n", "<leader>cw", "<CMD>lua TelescopeOpenPrewiev('spell_suggest')<CR>")
map("n", "<leader>cm", "<CMD>lua TelescopeOpenPrewiev('keymaps')<CR>")
map("n", "<leader>cr", "<CMD>lua TelescopeOpenPrewiev('reloader')<CR>")
map("n", "<leader>cv", "<CMD>lua TelescopeOpenPrewiev('vim_options')<CR>")

-- map("n", "<leader>",  "<CMD>lua TelescopeOpenPrewiev('')<CR>")

function _G.fzf_omni()
  if vim.fn.isdirectory(".git") == 1 then
    return "git_files"
  else
    return "find_files"
  end
end

-- map("n", "<C-f>", ":lua TelescopeOpenPrewiev(fzf_omni())<CR>")

function _G.show_diagnostic(opts)
  opts = opts or {}
  vim.lsp.diagnostic.set_loclist({open_loclist = false})

  require "settings.utils".move_cursor_from_tree()
  finders.loclist(require("telescope.themes").get_dropdown({}))
end

map("n", "<leader>cd", "<cmd>lua show_diagnostic()<CR>", {})
