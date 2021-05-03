local g = vim.g

local function globals(opts)
  for k, v in pairs(opts) do
    g[k] = v
  end
end

globals(
  {
    -- theme
    mapleader = " ",
    teppz_italic = true,
    teppz_italic_comments = 1,
    teppz_italic_keywords = 1,
    teppz_italic_functions = 1,
    -- setup
    python_host_prog = "/usr/bin/python",
    python3_host_prog = "/usr/bin/python3",
    -- colors
    Hexokinase_highlighters = {"virtual"},
    -- startify
    ascii = {
      " _|_     _|_     _|_     _|_     _|_     _|_     _|_     _|_     _|_     _|_     _|_     _|_     _|_     _|_     _|_     _|_     _|_ ",
      "  |       |       |       |       |       |       |       |       |       |       |       |       |       |       |       |       |  "
    },
    startify_custom_header = "startify#center(g:ascii)",
    startify_lists = {
      {type = "files", header = {"          Files"}},
      {type = "commands", header = {"        גּ  Commands"}},
      {type = "sessions", header = {"          Sessions"}},
      {type = "bookmarks", header = {"          Bookmarks"}}
    },
    startify_commands = {
      {o = {"Recent Files", ":Telescope oldfiles hidden=true"}},
      {p = {"Find Files", ":Telescope find_files hidden=true"}},
      {b = {"File Browser", ":Telescope file_browser"}},
      {t = {"Telescope builtin", ":Telescope"}},
      {g = {"Git", ":Neogit"}},
      {n = {"Nvim Files", ":lua TelescopeDotfiles()"}},
      {z = {"Notes", ":lua TelescopeNotes()"}},
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
    startify_session_dir = "~/.config/nvim/sessions/",
    startify_change_to_vcs_root = 1,
    startify_padding_left = 6,
    webdevicons_enable_startify = 1,
    startify_enable_special = 1,
    startify_files_number = 10,
    startify_update_oldfiles = 1
  }
)

-- icons
require "nvim-web-devicons".setup()

-- git
local neogit = require("neogit")
neogit.setup {}

require "toggleterm".setup {
  -- size = 10,
  open_mapping = [[<c-\>]]
  -- shade_filetypes = {},
  -- start_in_insert = false,
  -- persist_size = true,
  -- direction = "horizontal"
}

local api = vim.api
local fn = vim.fn

local prettier = {
  function()
    return {
      exe = "prettier",
      args = {
        "--stdin-filepath",
        api.nvim_buf_get_name(0)
      },
      stdin = true
    }
  end
}

local luafmt = {
  function()
    return {
      exe = "luafmt",
      args = {
        "--indent-count=2",
        "--stdin"
      },
      stdin = true
    }
  end
}

require("formatter").setup(
  {
    logging = false,
    filetype = {
      javascript = prettier,
      javascriptreact = prettier,
      typescript = prettier,
      typescriptreact = prettier,
      json = prettier,
      css = prettier,
      html = prettier,
      svelte = prettier,
      vue = prettier,
      lua = luafmt
    }
  }
)

vim.api.nvim_exec(
  [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.jsx,*.ts,*.tsx,*.vue,*.lua FormatWrite
augroup END
]],
  true
)
