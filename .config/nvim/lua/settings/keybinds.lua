local map = require "settings.utils".map
local cmd = vim.cmd
local g = vim.g
local fn = vim.fn
local opts = { noremap=true, silent=true }

-- Map <leader> to space
map("n", "<Space>", "<Nop>")

-- Mapleader
g.mapleader = " "

-- Lsp
map('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
map('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
map('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
map('n', '<leader>d', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
-- map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
map('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
map('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
map('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
map('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
-- map('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
map('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
map('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
map('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

-- Sandwich
-- map('n', '<leader>sa', '<Plug>(operator-sandwich-add)<CR>', {})
-- map('n', '<leader>sd', '<Plug>(operator-sandwich-delete)<CR>', {})
-- map('n', '<leader>sr', '<Plug>(operator-sandwich-replace)<CR>', {})

-- Saga
map("n", "gh", ":Lspsaga hover_doc<CR>", {})
map("n", "gr", ":Lspsaga lsp_finder<CR>", {})
map("n", "ga", ":Lspsaga code_action<CR>", {})
map("n", "gs", ":Lspsaga signature_help<CR>", {})
map("n", "gR", ":Lspsaga rename<CR>", {})
map("n", "gp", ":Lspsaga preview_definition<CR>", {})
map("n", "gi", ":Lspsaga show_line_diagnostics<CR>",{})
map("n", "[", ":Lspsaga lsp_jump_diagnostic_next<CR>",{})
map("n", "]", ":Lspsaga lsp_jump_diagnostic_prev<CR>",{})

-- Move lines
map("n", "<A-k>", ":<C-u>move-2<CR>==",{})
map("v", "<A-k>", ":move-2<CR>gv=gv",{})
map("n", "<A-j>", ":<C-u>move+<CR>==", {})
map("v", "<A-j>", ":move'>+<CR>gv=gv", {})

-- Save and exit
map("n", "<Leader>q", ":q<CR>")
map("n", "<Leader>s", ":w<CR>")

-- Tree
map("n", "<Leader>e", ":NvimTreeToggle<CR>")

-- Better indenting
map("v", "<", "<gv", {})
map("n", "<", "<<", {})
map("n", ">", ">>", {})
map("v", ">", ">gv", {})

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

-- Move to the end of yanked text after yank and paste
map("n", "p", "p`]")
map("v", "y", "y`]")
map("v", "p", "p`]")

-- Git
-- map("n", "<Leader>gs", ":Gstatus<CR>", {})
-- map("n", "<Leader>gb", ":GBranches<CR>", {})
-- map("n", "<Leader>go", ":GBrowse<CR>", {})

-- vim-import-js
map("n", "<Leader>if", ":ImportJSFix<CR>", {})
map("n", "<Leader>iw", ":ImportJSWord<CR>", {})
map("n", "<Leader>ig", ":ImportJSGoto<CR>", {})

-- Terminal
map("n", "<leader>tt",      "<cmd>FloatermNew --height=0.3 --wintype=normal --position=bottom<CR>", {})
map("n", "<leader>tv",      "<cmd>FloatermNew --width=0.4 --wintype=normal --position=right<CR>", {})

-- Kitty
map("n", "<leader>kv", ":silent !kitty @ launch --copy-env --cwd=current nvim % <CR>", {})

map("n", "<leader>cc", ":normal gcc<CR>", {})
