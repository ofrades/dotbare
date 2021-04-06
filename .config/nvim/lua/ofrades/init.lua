require "ofrades.packages"
require "ofrades.startify"
require "ofrades.rooter"
require "ofrades.formatter"
require "ofrades.tree"
require "ofrades.tsitter"
require "ofrades.telescope"
require "ofrades.neuron"
require "ofrades.theme"
require "ofrades.statusline"

require "nvim-web-devicons".setup()

local map = require "settings.utils".map
local g = vim.g

g.floaterm_autoclose = 0
g.floaterm_width = 0.85
g.floaterm_height = 0.65

-- g.floaterm_winblend=0.7
g.floaterm_autoinsert = 1
g.floaterm_keymap_kill = "<F10>"
g.floaterm_keymap_toggle = "<F12>"
g.floaterm_title = "[$1/$2]"
-- g.floaterm_title = require"settings.utils".get_toggleterm_name()

-- g.floaterm_borderchars = {'─', '│', '─', '│', '╭', '╮', '╯', '╰'}
g.floaterm_rootmarkers = {".git", ".gitignore", "package.json"}

-- map("n", "<F12>", ":FloatermToggle<CR>")
map("t", "<Esc><Esc>", "<C-\\><C-n>:FloatermToggle<CR>")

-- Neogit
local neogit = require("neogit")
neogit.setup {}
