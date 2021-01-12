local map = require "settings.utils".map
local cmd = vim.cmd
local g = vim.g
local fn = vim.fn

-- Mapleader
-- Map <leader> to space
map("n", "<Space>", "<Nop>")
g.mapleader = " "

-- save and quit
map("n", "<leader>q",      ":q<CR>", {})
map("n", "<leader>s",      ":w<CR>", {})

-- Better indenting
map("v", "<", "<gv", {})
map("n", "<", "<<", {})
map("n", ">", ">>", {})
map("v", ">", ">gv", {})


-- Move lines up and down
map("n", "<A-k>",   ":<C-u>move-2<CR>==", {})
map("n", "<A-j>",   ":<C-u>move+<CR>==", {})
map("v", "<A-k>",   ":move-2<CR>gv=gv", {})
map("v", "<A-j>",   ":move'>+<CR>gv=gv", {})

-- clear all the highlighted text from the previous search
map("n", "<Esc><Esc>", ":noh<CR>", {silent = true})

map("n", "|", "<Plug>LineLetters", {silent = true, noremap = false})

-- Easier Moving between splits
map("n", "<C-J>", "<C-W><C-J>", {})
map("n", "<C-K>", "<C-W><C-K>", {})
map("n", "<C-L>", "<C-W><C-L>", {})
map("n", "<C-H>", "<C-W><C-H>", {})

-- Sizing window
map("n", "<A-Right>", "<C-W>5<", {})
map("n", "<A-Left>", "<C-W>5>", {})
map("n", "<A-Up>", "<C-W>+5", {})
map("n", "<A-Down>", "<C-W>-5", {})

map("n", "<leader>.",  ":e $MYVIMRC<CR>", {})
map("n", "<leader>,",  ":Startify<CR>", {})

map("n", "<leader>r", ":luafile %<CR>", {})
-- map("n", "<leader>x", ':lua require"plenary.eload".reload_module"init"<CR>', {})
map("n", "<leader>x", ":luafile $MYVIMRC<CR>", {})

-- Telescope
-- map("n", "<C-p>", ":Telescope find_files<CR>")
-- map("n", "<C-f>", ":Telescope live_grep<CR>")
-- map("n", "<A-c>", ":Telescope commands<CR>")
map("n", "<leader>n", "<cmd>lua require'telescope.builtin'.find_files{ cwd = '~/.config/nvim/' }<CR>", {})

-- Searches
map("n", "<C-p>", ":Files<CR>", {})
map("n", "<C-f>", ":Rg<CR>", {})
map("n", "<leader>sb", ":BLines<CR>", {})
map("n", "<leader>bs", ":BLines<CR>", {})

-- Git
map("n", "<C-g>", ":LazyGit<CR>")

-- Terminal
map("n", "<A-t>", "<cmd>FloatermToggle<CR>", {})

-- Togglers
map("n", "<leader>tg", ":GitBlameToggle<CR>", {})
map("n", "<leader>tc", ":HexokinaseToggle<CR>", {})
map("n", "<leader>tu", ":UndotreeToggle<CR>", {})

-- Kitty
map("n", "<leader>kv", ":silent !kitty @ launch --copy-env --cwd=current nvim %", {})

