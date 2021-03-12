local map = require "settings.utils".map
vim.cmd [[packadd telescope-fzy-native.nvim]]
local finders = require "telescope.builtin"
local actions = require 'telescope.actions'
local telescope = require "telescope"
local transform_mod = require("telescope.actions.mt").transform_mod

require("telescope").load_extension("fzy_native")

telescope.setup {
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_position = "bottom",
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    scroll_strategy = "cycle",
    layout_strategy = "horizontal",
    layout_defaults = {
      horizontal = {
        mirror = false,
        scroll_speed = 1,
      },
      vertical = {
        mirror = false,
        scroll_speed = 1,
      },
    },
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
      }
    },
    file_ignore_patterns = {".git/*", "node-modules"},
    shorten_path = true,
    winblend = 0,
    width = 0.8,
    preview_cutoff = 120,
    results_height = 1,
    results_width = 0.8,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_sorter =  require'telescope.sorters'.get_fzy_sorter,
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true
    }
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

function _G.fzf_omni()
  if vim.fn.isdirectory(".git") == 1 then
    return "git_files"
  else
    return "find_files"
  end
end

function TelescopeDotfiles()
  require("telescope.builtin").find_files({
    prompt_title = "Dotfiles",
    cwd = "~/.config/nvim/lua/",
  })
end

function _G.show_diagnostic(opts)
  opts = opts or {}
  vim.lsp.diagnostic.set_loclist({open_loclist = false})

  require "settings.utils".move_cursor_from_tree()
  finders.loclist(require("telescope.themes").get_dropdown({}))
end

