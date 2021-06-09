local g = vim.g

local function globals(opts)
  for k, v in pairs(opts) do
    g[k] = v
  end
end
globals(
  {
    -- theme
    vimruntime = true,
    mapleader = " ",
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
vim.o.runtimepath = vim.o.runtimepath .. ",/home/ofrades/.local/share/nvim/site/pack/packer/start/himalaya/vim/"
vim.g["himalaya_mailbox_picker"] = "telescope"

-- icons
require "nvim-web-devicons".setup()

-- git
local neogit = require("neogit")
neogit.setup {}

