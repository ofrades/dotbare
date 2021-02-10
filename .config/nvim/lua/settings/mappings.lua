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

-- Saga
map("n", "gh", ":Lspsaga hover_doc<CR>", {})
map("n", "gr", ":Lspsaga lsp_finder<CR>", {})
map("n", "ga", ":Lspsaga code_action<CR>", {})
map("n", "gs", ":Lspsaga signature_help<CR>", {})
map("n", "<leader>r", ":Lspsaga rename<CR>", {})
map("n", "gp", ":Lspsaga preview_definition<CR>", {})
map("n", "<leader>d", ":Lspsaga show_line_diagnostics<CR>",{})
map("n", "[", ":Lspsaga diagnostic_jump_prev<CR>",{})
map("n", "]", ":Lspsaga diagnostic_jump_next<CR>",{})

-- Hop
map("n", "f", ":HopWord<CR>", {})

-- Vista
map("n", "<leader>v", ":Vista<CR>", {})

-- Telescope
map("n", "<leader>cd", "<cmd>lua show_diagnostic()<CR>", {})
map("n", "<C-p>", "<CMD>lua TelescopeOpenPrewiev('oldfiles')<CR>")
map("n", "<leader>p", "<CMD>lua TelescopeOpenPrewiev('find_files')<CR>")
map("n", "<C-f>", "<CMD>lua TelescopeOpenPrewiev('live_grep')<CR>")
map("n", "<leader>bb", "<CMD>lua TelescopeOpen('buffers')<CR>")
map("n", "<leader>bt", "<CMD>lua TelescopeOpenPrewiev('current_buffer_tags')<CR>")
map("n", "<C-c>", "<CMD>lua TelescopeOpen('commands')<CR>")
map("n", "<leader>ll", "<CMD>lua TelescopeOpen('builtin')<CR>")
map("n", "<leader>lr", "<CMD>lua TelescopeOpenPrewiev('lsp_references')<CR>")
map("n", "<leader>ls", "<CMD>lua TelescopeOpenPrewiev('symbols')<CR>")
map("n", "<leader>gf", "<CMD>lua TelescopeOpenPrewiev('git_files')<CR>")
map("n", "<leader>gcc", "<CMD>lua TelescopeOpenPrewiev('git_commits')<CR>")
map("n", "<leader>gcb", "<CMD>lua TelescopeOpenPrewiev('git_bcommits')<CR>")
map("n", "<leader>gs", "<CMD>lua TelescopeOpenPrewiev('git_status')<CR>")
map("n", "<leader>gb", "<CMD>lua TelescopeOpenPrewiev('git_branches')<CR>")
map("n", "<leader>lsd", "<CMD>lua TelescopeOpenPrewiev('lsp_document_symbols')<CR>")
map("n", "<leader>lsw", "<CMD>lua TelescopeOpenPrewiev('lsp_workspace_symbols')<CR>")
map("n", "<leader>lca", "<CMD>lua TelescopeOpenPrewiev('lsp_code_actions')<CR>")
map("n", "<leader>cw", "<CMD>lua TelescopeOpenPrewiev('spell_suggest')<CR>")
map("n", "<leader>cm", "<CMD>lua TelescopeOpenPrewiev('keymaps')<CR>")
map("n", "<leader>cr", "<CMD>lua TelescopeOpenPrewiev('reloader')<CR>")
map("n", "<leader>cv", "<CMD>lua TelescopeOpenPrewiev('vim_options')<CR>")

-- Registers
map("n", "\"", "<CMD>lua TelescopeOpenPrewiev('registers')<CR>")

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