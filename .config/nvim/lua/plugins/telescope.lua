vim.cmd [[packadd telescope-fzy-native.nvim]]
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

