local map = require "settings.utils".map
local cmd = vim.cmd
local g = vim.g
local fn = vim.fn
local opts = { noremap=true, silent=true }

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
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
map('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
map('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
map('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)



map("n", "gh", "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", {})
map("n", "gf", "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>", {})
map("n", "ga", "<cmd>lua require('lspsaga.codeaction').code_action()<CR>", {})
map("n", "gs", "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>", {})
map("n", "<leader>r", "<cmd>lua require('lspsaga.rename').rename()<CR>", {})
map("n", "gp", "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>", {})
-- map("n", "gi", ":LspSagaShowLineDiags<CR>",{})

map("n", "<A-k>", ":<C-u>move-2<CR>==",{})
map("v", "<A-k>", ":move-2<CR>gv=gv",{})
map("n", "<A-j>", ":<C-u>move+<CR>==", {})
map("v", "<A-j>", ":move'>+<CR>gv=gv", {})

-- Map <leader> to space
map("n", "<Space>", "<Nop>")

-- Mapleader
g.mapleader = " "

map("n", "<Leader>q", ":q<CR>")
map("n", "<Leader>w", ":w<CR>")
-- Tree
map("n", "<Leader>e", ":NvimTreeToggle<CR>")
-- Better indenting
map("v", "<", "<gv", {})
map("n", "<", "<<", {})
map("n", ">", ">>", {})
map("v", ">", ">gv", {})

map("n", "<leader><leader>", ":FloatermNew ranger<cr>", {})
map("t", "<leader><leader>", [[<C-\><C-n>:FloatermKill]], {})

-- Easier Moving between splits
map("n", "<C-J>", "<C-W><C-J>", {})
map("n", "<C-K>", "<C-W><C-K>", {})
map("n", "<C-L>", "<C-W><C-L>", {})
map("n", "<C-H>", "<C-W><C-H>", {})

map("n", "<leader>.", ":e $MYVIMRC<CR>", {})
map("n", "<leader>,", ":Startify<CR>", {})

map("n", "<leader>r", ":luafile %<CR>", {})
map("n", "<leader>x", ":lua reload()<CR>", {})

-- Move to the end of yanked text after yank and paste
map("n", "p", "p`]")
map("v", "y", "y`]")
map("v", "p", "p`]")

-- Git
map("n", "<Leader>gs", ":Gstatus<CR>", {})
map("n", "<Leader>gb", ":GBranches<CR>", {})
map("n", "<Leader>go", ":GBrowse<CR>", {})

-- vim-import-js
map("n", "<Leader>if", ":ImportJSFix<CR>", {})
map("n", "<Leader>iw", ":ImportJSWord<CR>", {})
map("n", "<Leader>ig", ":ImportJSGoto<CR>", {})

map("n", "<leader>st", ":Rg!<CR>", {})
map("n", "<leader>sw", ':Rg' .. fn.expand('<cword>'), {})

-- Terminal
map("n", "<leader>tt",      "<cmd>FloatermNew --height=0.3 --wintype=normal --position=bottom<CR>", {})
map("n", "<leader>tv",      "<cmd>FloatermNew --width=0.4 --wintype=normal --position=right<CR>", {})

-- Togglers
map("n", "<leader>tg", ":GitBlameToggle<CR>", {})
map("n", "<leader>tc", ":HexokinaseToggle<CR>", {})
map("n", "<leader>tu", ":UndotreeToggle<CR>", {})

--open a new file in the same directory
map("n", "<Leader>nf", [[:e <C-R>=expand("%:p:h") . "/" <CR>]], {silent = false})
map("n", "<Leader>of", ':lua open_file_or_create_new()', {silent = false})
-- Kitty
map("n", "<leader>kv", ":silent !kitty @ launch --copy-env --cwd=current nvim % <CR>", {})

map("n", "<leader>cc", ":normal gcc<CR>", {})
