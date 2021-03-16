local map = require "settings.utils".map
local cmd = vim.cmd
local g = vim.g
local fn = vim.fn
local opts = { noremap=true, silent=true }

-- Search nvim config
map("n", "s.", ":lua TelescopeDotfiles()<CR>")

-- Map <leader> to space
map("n", "<Space>", "<Nop>")
map("n", "s", "<Nop>")

-- Mapleader
g.mapleader = " "

-- Lsp
map('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
map('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)

-- Saga
map("n", "gh", ":Lspsaga hover_doc<CR>", {})
map("n", "gr", ":Lspsaga lsp_finder<CR>", {})
-- map("n", "ga", ":Lspsaga code_action<CR>", {})
map("n", "ga", ":Telescope lsp_code_actions<CR>")
-- map("n", "gs", ":Lspsaga signature_help<CR>", {})
map("n", "<leader>r", ":Lspsaga rename<CR>", {})
map("n", "gp", ":Lspsaga preview_definition<CR>", {})
map("n", "<leader>d", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>",{})
map("n", "[", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>",{})
map("n", "]", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",{})

-- Hop
map("n", "f", ":HopWord<CR>", {})

-- Vista
-- map("n", "<leader>v", ":Vista<CR>", {})

-- Telescope
map("n", "st", ":Telescope<CR>")
map("n", "sp", ":Telescope find_files<CR>")
map("n", "sf", ":Telescope live_grep<CR>") -- <C-q> to send search to list
map("n", "so", ":Telescope oldfiles<CR>")
map("n", "sr", ":Telescope lsp_references<CR>")
map("n", "sd", ":Telescope lsp_document_diagnostic()<CR>", {})
map("n", "sP", ":Telescope git_files<CR>")
map("n", "sl", ":Telescope git_commits<CR>")
map("n", "sc", ":Telescope git_bcommits<CR>")
map("n", "ss", ":Telescope git_status<CR>")
map("n", "sb", ":Telescope git_branches<CR>")
map("n", "sx", ":Telescope lsp_document_symbols<CR>")

map("n", "<C-p>", ":Telescope find_files<CR>")
map("n", "<C-f>", ":Telescope live_grep<CR>")
map("n", "<leader>b", ":Telescope buffers<CR>")
map("n", "<C-c>", ":Telescope commands<CR>")
-- map("n", "gs", "<CMD>lua TelescopeOpenPrewiev('symbols')<CR>")
map("n", "<leader>lws", ":Telescope lsp_workspace_symbols<CR>")
map("n", "<leader>c", ":Telescope keymaps<CR>")
map("n", "<leader>v", ":Telescope vim_options<CR>")

-- Quick fix list
map("n", "<leader>n", ":cnext<CR>")
map("n", "<leader>N", ":cprev<CR>")

-- Registers
map("n", "\"", ":Telescope registers<CR>")

-- Neuron
map("n", "<C-z>", "<Nop>")
map("n", "zn", "<cmd>lua require'neuron/cmd'.new_edit(require'neuron'.config.neuron_dir)<CR>")
map("n", "sz", "<cmd>lua require'neuron/telescope'.find_zettels()<CR>")

-- Move lines
map("n", "<A-k>", ":<C-u>move-2<CR>==",{})
map("v", "<A-k>", ":move-2<CR>gv=gv",{})
map("n", "<A-j>", ":<C-u>move+<CR>==", {})
map("v", "<A-j>", ":move'>+<CR>gv=gv", {})

-- Save and exit
map("n", "<Leader>q", ":q<CR>")
map("n", "<Leader>s", ":w!<CR>")

-- Tree
map("n", "<Leader>e", ":NvimTreeToggle<CR>")

-- Better indenting
map("v", "<", "<gv", {})
map("n", "<", "<<", {})
map("n", ">", ">>", {})
map("v", ">", ">gv", {})

-- Yank till the end of line
map("n", "Y", "y$")

-- Terminal
map("n", "<leader><leader>", ":FloatermNew ranger<cr>", {})
map("t", "<leader><leader>", [[<C-\><C-n>:FloatermKill]], {})

-- Easier Moving between splits
map("n", "<C-J>", "<C-W><C-J>", {})
map("n", "<C-K>", "<C-W><C-K>", {})
map("n", "<C-L>", "<C-W><C-L>", {})
map("n", "<C-H>", "<C-W><C-H>", {})

-- Reload Config
map("n", "<leader>x", ":lua reload()<CR>", {})

-- Startify
map("n", "<leader>,", ":Startify<CR>", {})

-- Move to the end of yanked text after yank and paste
map("n", "p", "p`]")
map("v", "y", "y`]")
map("v", "p", "p`]")

-- Git
-- map("n", "<Leader>gs", ":Gstatus<CR>", {})
-- map("n", "<Leader>gb", ":GBranches<CR>", {})
-- map("n", "<Leader>go", ":GBrowse<CR>", {})

-- Terminal
map("n", "<leader>tt",      "<cmd>FloatermNew --height=0.3 --wintype=normal --position=bottom<CR>", {})
map("n", "<leader>tv",      "<cmd>FloatermNew --width=0.4 --wintype=normal --position=right<CR>", {})

-- Kitty
map("n", "<leader>kv", ":silent !kitty @ launch --copy-env --cwd=current nvim % <CR>", {})

map("n", "<leader>cc", ":normal gcc<CR>", {})
