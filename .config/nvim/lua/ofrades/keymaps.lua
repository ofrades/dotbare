-- Keymaps

vim.api.nvim_set_keymap("n", "<Space>", "<Nop>", {})
-- Reload nvim config
vim.api.nvim_set_keymap("n", "<leader>x", ":lua Reload()<CR>", {})

vim.api.nvim_set_keymap("n", "<Escape>", ":noh<CR>", {})

-- File explorer
-- vim.api.nvim_set_keymap("n", "<leader><leader>", ":lua require'lir.float'.toggle()<CR>")
vim.api.nvim_set_keymap("n", "<leader><leader>", ":e %:p:h<CR>", {})

-- Try search and replace
vim.api.nvim_set_keymap("n", "<leader>S", ":lua require('spectre').open()<CR>", {})

vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", {})
vim.api.nvim_set_keymap("n", "<C-\\>", ":split | term<CR>", {})

-- Escape alt
vim.api.nvim_set_keymap("i", "jj", "<esc>", {})

--[[ vim.api.nvim_set_keymap("n", "<Up>", "<C-y>", {})
vim.api.nvim_set_keymap("n", "<Down>", "<C-e>", {}) ]]
-- resize panes
vim.api.nvim_set_keymap("n", "<RIGHT>", "<C-w><", {})
vim.api.nvim_set_keymap("n", "<UP>", "<C-w>+", {})
vim.api.nvim_set_keymap("n", "<LEFT>", "<C-w>>", {})
vim.api.nvim_set_keymap("n", "<DOWN>", "<C-w>-", {})

-- move between panes
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", {})
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", {})
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", {})
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", {})
vim.api.nvim_set_keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", {})
vim.api.nvim_set_keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", {})
vim.api.nvim_set_keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", {})
vim.api.nvim_set_keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", {})
vim.api.nvim_set_keymap("i", "<C-h>", "<C-\\><C-N><C-w>h", {})
vim.api.nvim_set_keymap("i", "<C-j>", "<C-\\><C-N><C-w>j", {})
vim.api.nvim_set_keymap("i", "<C-k>", "<C-\\><C-N><C-w>k", {})
vim.api.nvim_set_keymap("i", "<C-l>", "<C-\\><C-N><C-w>l", {})

-- Search settings
vim.api.nvim_set_keymap("n", "<leader>.", ":lua TelescopeDotfiles()<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>z", ":lua TelescopeNotes()<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>k", ":Telescope keymaps<CR>", {})

-- Lsp
vim.api.nvim_set_keymap("n", "gh", "<Cmd>lua vim.lsp.buf.hover()<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>[", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>]", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", {})
-- Telescope LSP
vim.api.nvim_set_keymap("n", "gr", ":Telescope lsp_references<CR>", {})
vim.api.nvim_set_keymap("n", "gy", ":Telescope lsp_document_symbols<CR>", {})
vim.api.nvim_set_keymap("n", "gY", ":Telescope lsp_workspace_symbols<CR>", {})
vim.api.nvim_set_keymap(
  "n",
  "ga",
  ":lua require'telescope.builtin'.lsp_code_actions(require('telescope.themes').get_dropdown({results_height = 10}))<CR>",
  {}
)
vim.api.nvim_set_keymap("n", "gx", ":Telescope lsp_document_diagnostics<CR>", {})
vim.api.nvim_set_keymap("n", "gX", ":Telescope lsp_workspace_diagnostics<CR>", {})
vim.api.nvim_set_keymap("n", "gd", ":Telescope lsp_definitions<CR>", {})

vim.api.nvim_set_keymap("n", "<leader>t", ":Telescope <CR>", {})
vim.api.nvim_set_keymap("n", "<leader>p", ":Telescope find_files hidden=true<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>f", ":Telescope live_grep<CR>", {}) -- <C-q> to send search to list
vim.api.nvim_set_keymap("n", "<leader>o", ":Telescope oldfiles<CR>", {})

vim.api.nvim_set_keymap("n", "<leader>b", ":Telescope buffers<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>c", ":Telescope commands<CR>", {})

-- Registers
vim.api.nvim_set_keymap("n", "<leader>R", ":Telescope registers<CR>", {})

-- -- Move lines
vim.api.nvim_set_keymap("n", "<A-k>", ":<C-u>move-2<CR>==", {})
vim.api.nvim_set_keymap("v", "<A-k>", ":move-2<CR>gv=gv", {})
vim.api.nvim_set_keymap("n", "<A-j>", ":<C-u>move+<CR>==", {})
vim.api.nvim_set_keymap("v", "<A-j>", ":move'>+<CR>gv=gv", {})

-- Save and exit
vim.api.nvim_set_keymap("n", "<leader>q", ":q<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>w", ":w!<CR>", {})

-- Git
vim.api.nvim_set_keymap("n", "<leader>gg", ":Neogit<CR>", {})
-- Telescope Git
vim.api.nvim_set_keymap("n", "<leader>gf", ":Telescope git_files<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>gC", ":Telescope git_commits<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>gc", ":Telescope git_bcommits<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>gs", ":Telescope git_status<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>gb", ":Telescope git_branches<CR>", {})

-- Better indenting
vim.api.nvim_set_keymap("v", "<", "<gv", {})
vim.api.nvim_set_keymap("n", "<", "<<", {})
--[[ vim.api.nvim_set_keymap("n", ">", ">>", {})
vim.api.nvim_set_keymap("v", ">", ">gv", {}) ]]
-- Yank till the end of line
vim.api.nvim_set_keymap("n", "Y", "y$", {})
vim.api.nvim_set_keymap("n", "D", "d$", {})
vim.api.nvim_set_keymap("n", "C", "c$", {})

-- Startify
vim.api.nvim_set_keymap("n", "<leader>,", ":Startify<CR>", {})

-- Compe
vim.api.nvim_set_keymap("i", "<C-Space>", "compe#complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<CR>", "compe#confirm('<CR>')", {expr = true})

-- Reload function
function Reload()
  local modules = { "ofrades" }
  for _, moduleName in pairs(modules) do
    for packageName, _ in pairs(package.loaded) do
      if string.find(packageName, "^" .. moduleName) then
        package.loaded[packageName] = nil
      end
    end
    require(moduleName)
  end
  print("Editor configs reloaded")
end
