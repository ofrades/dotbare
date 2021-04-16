local g = vim.g

local function globals(opts)
  for k, v in pairs(opts) do
    g[k] = v
  end
end

globals(
  {
    mapleader = " ",
    -- theme
    teppz_italic = true,
    teppz_italic_comments = 1,
    teppz_italic_keywords = 1,
    teppz_italic_functions = 1,
    qs_highlight_on_keys = {"f", "F"},
    -- setup
    python_host_prog = "/usr/bin/python",
    python3_host_prog = "/usr/bin/python3",
    -- git
    gitblame_enabled = 0,
    gitblame_message_template = "     <author> • <summary> • <date>",
    -- colors
    Hexokinase_highlighters = {"virtual"},
    -- floaterm
    floaterm_autoclose = 0,
    floaterm_width = 0.85,
    floaterm_height = 0.65,
    floaterm_winblend = 0.7,
    floaterm_autoinsert = 1,
    floaterm_keymap_kill = "<F10>",
    floaterm_keymap_toggle = "<F12>",
    floaterm_title = "[$1/$2]",
    floaterm_borderchars = {"─", "│", "─", "│", "╭", "╮", "╯", "╰"},
    floaterm_rootmarkers = {".git", ".gitignore", "package.json"},
    -- startify
    ascii = {
      " _|_     _|_     _|_     _|_     _|_     _|_     _|_     _|_     _|_     _|_     _|_     _|_     _|_     _|_     _|_     _|_     _|_ ",
      "  |       |       |       |       |       |       |       |       |       |       |       |       |       |       |       |       |  "
    },
    startify_custom_header = "startify#center(g:ascii)",
    startify_lists = {
      {type = "sessions", header = {"          Sessions"}},
      {type = "commands", header = {"        גּ  Commands"}},
      {type = "files", header = {"          Files"}},
      {type = "bookmarks", header = {"          Bookmarks"}}
    },
    startify_commands = {
      {o = {"Recent Files", ":Telescope oldfiles"}},
      {p = {"Find Files", ":Telescope find_files"}},
      {b = {"File Browser", ":Telescope file_browser"}},
      {z = {"Telescope z", ":Telescope z list"}},
      {t = {"Telescope builtin", ":Telescope"}},
      {g = {"Git", ":Neogit"}},
      {n = {"Nvim Files", ":lua TelescopeDotfiles()"}},
      {h = {"Check Vim health", ":checkhealth"}},
      {i = {"Install Plugins", ":PackerInstall"}},
      {u = {"Update Plugin", ":PackerUpdate"}},
      {c = {"Clean Plugin", ":PackerClean"}}
    },
    startify_session_sort = 1,
    startify_change_to_dir = 1,
    startify_session_autoload = 1,
    startify_session_delete_buffers = 0,
    startify_session_persistence = 1,
    startify_change_to_vcs_root = 1,
    startify_padding_left = 6,
    webdevicons_enable_startify = 1,
    startify_enable_special = 1,
    startify_files_number = 10,
    startify_update_oldfiles = 1,
    -- tree
    nvim_tree_side = "left",
    nvim_tree_ignore = {
      ".git",
      "node_modules",
      "dist",
      ".cache"
    },
    nvim_tree_auto_open = 0,
    nvim_tree_auto_close = 0,
    nvim_tree_follow = 1,
    nvim_tree_indent_markers = 1,
    nvim_tree_hide_dotfiles = 0,
    nvim_tree_git_hl = 1,
    nvim_tree_root_folder_modifier = ":~",
    nvim_tree_tab_open = 0,
    nvim_tree_show_icons = {git = 0, folders = 1, files = 1},
    nvim_tree_icons = {
      default = "",
      symlink = "",
      git = {
        unstaged = "✗",
        staged = "✓",
        unmerged = "",
        renamed = "➜",
        untracked = "★"
      },
      folder = {default = "", open = " "}
    }
  }
)

-- rooter
require "rooter".setup {
  echo = false,
  patterns = {
    -- the patterns to find
    ".git/", -- same as patterns passed to nvim_lsp.util.root_pattern(patterns...)
    ".git", -- same as patterns passed to nvim_lsp.util.root_pattern(patterns...)
    "package.json",
    "init.lua",
    ".env"
  },
  non_project_files = "current"
}

-- icons
require "nvim-web-devicons".setup()

-- git
local neogit = require("neogit")
neogit.setup {}
