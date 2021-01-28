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

-- Tab for autocompletion
map("i", "<Tab>", "pumvisible() ? '<C-n>' : '<Tab>'", {expr = true})
map("i", "<S-Tab>", "pumvisible() ? '<C-p>' : '<S-Tab>'", {expr = true})

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

-- Explorer
map("n", "<leader>e", ":NvimTreeToggle<CR>", {})

-- clear all the highlighted text from the previous search
map("n", "<Esc><Esc>", ":noh<CR>", {silent = true})

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

-- Searches
map("n", "<C-p>", ":Files<CR>", {})
map("n", "<C-f>", ":BLines<CR>", {})
map("n", "<Leader>f", ":Rg<CR>", {})
map("n", "<C-c>", ":Commands<CR>")
map("n", "<leader>n", "<cmd>lua require'telescope.builtin'.find_files{ cwd = '~/.config/nvim/' }<CR>", {})

-- Git
map("n", "<C-g>", ":LazyGit<CR>")

-- Terminal
map("n", "<F12>", "<cmd>FloatermToggle<CR>", {})

-- LSP
map("n", "gh", '<cmd>lua require"settings.utils".show_doc()<CR>', {noremap = true, silent = true})
map("n", "<leader>h", '<cmd>lua require"settings.utils".hover()<CR>', {noremap = true, silent = true})
map("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", {noremap = true, silent = true})
map("n", "gh", "<Cmd>lua vim.lsp.buf.hover()<CR>", {noremap = true, silent = true})
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", {noremap = true, silent = true})
map("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", {noremap = true, silent = true})
map("n", "gdt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", {noremap = true, silent = true})
map("n", "rn", "<cmd>lua vim.lsp.buf.rename()<CR>", {noremap = true, silent = true})
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", {noremap = true, silent = true})
map("n", "ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", {noremap = true, silent = true})
