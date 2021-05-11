local tbl_extend = vim.tbl_extend
-- keymaps

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true, silent = true}
  if opts then
    options = tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function Reload()
  local modules = {"lsp", "ofrades"}
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
-- Keymaps
--
map("n", "<Space>", "<Nop>")
map("n", "s", "<Nop>")

-- Reload nvim config
map("n", "<leader>x", ":lua Reload()<CR>", {})

-- File explorer
-- map("n", "<leader><leader>", ":lua require'lir.float'.toggle()<CR>")
map("n", "<leader><leader>", ":e %:p:h<CR>")

-- Try search and replace
map("n", "<leader>S", ":lua require('spectre').open()<CR>")

-- Escape alt
map("i", "kj", "<esc>")
map("i", "jk", "<esc>")

map("n", "<Up>", "<C-y>")
map("n", "<Down>", "<C-e>")

map("n", "<A-right>", "<C-w><")
map("n", "<A-left>", "<C-w>>")
map("n", "<A-up>", "<C-w>+")
map("n", "<A-down>", "<C-w>-")

-- Search settings
map("n", "<leader>.", ":lua TelescopeDotfiles()<CR>")
map("n", "<leader>z", ":lua TelescopeNotes()<CR>")
map("n", "<leader>k", ":Telescope keymaps<CR>")

-- Lsp
map("n", "gh", "<Cmd>lua vim.lsp.buf.hover()<CR>", {})
map("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", {})
map("n", "<leader>[", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", {})
map("n", "<leader>]", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", {})
-- Telescope LSP
map("n", "gr", ":Telescope lsp_references<CR>")
map("n", "gy", ":Telescope lsp_document_symbols<CR>")
map("n", "gY", ":Telescope lsp_workspace_symbols<CR>")
map(
  "n",
  "ga",
  ":lua require'telescope.builtin'.lsp_code_actions(require('telescope.themes').get_dropdown({results_height = 10}))<CR>"
)
map("n", "gx", ":Telescope lsp_document_diagnostics<CR>", {})
map("n", "gX", ":Telescope lsp_workspace_diagnostics<CR>", {})
map("n", "gd", ":Telescope lsp_definitions<CR>", {})

map("n", "<leader>t", ":Telescope <CR>")
map("n", "<leader>p", ":Telescope find_files hidden=true<CR>")
map("n", "<leader>f", ":Telescope live_grep<CR>") -- <C-q> to send search to list
map("n", "<leader>o", ":Telescope oldfiles<CR>")

map("n", "<leader>b", ":Telescope buffers<CR>")
map("n", "<leader>c", ":Telescope commands<CR>")

-- Registers
map("n", "<leader>R", ":Telescope registers<CR>")

-- -- Move lines
map("n", "<A-k>", ":<C-u>move-2<CR>==", {})
map("v", "<A-k>", ":move-2<CR>gv=gv", {})
map("n", "<A-j>", ":<C-u>move+<CR>==", {})
map("v", "<A-j>", ":move'>+<CR>gv=gv", {})

-- Save and exit
map("n", "<leader>q", ":q<CR>")
map("n", "<leader>w", ":w!<CR>")

-- Git
map("n", "<leader>gg", ":Neogit<CR>", {})
-- Telescope Git
map("n", "<leader>gf", ":Telescope git_files<CR>")
map("n", "<leader>gC", ":Telescope git_commits<CR>")
map("n", "<leader>gc", ":Telescope git_bcommits<CR>")
map("n", "<leader>gs", ":Telescope git_status<CR>")
map("n", "<leader>gb", ":Telescope git_branches<CR>")

-- Better indenting
map("v", "<", "<gv", {})
map("n", "<", "<<", {})
map("n", ">", ">>", {})
map("v", ">", ">gv", {})

-- Yank till the end of line
map("n", "Y", "y$")
map("n", "D", "d$")
map("n", "C", "c$")

-- Easier Moving between splits
map("n", "<Down>", "<C-W><C-J>", {})
map("n", "<Up>", "<C-W><C-K>", {})
map("n", "<Right>", "<C-W><C-L>", {})
map("n", "<Left>", "<C-W><C-H>", {})

-- Startify
map("n", "<leader>,", ":Startify<CR>", {})

-- Move to the end of yanked text after yank and paste
map("n", "p", "p`]")
map("v", "y", "y`]")
map("v", "p", "p`]")

-- Compe
map("i", "<C-Space>", "compe#complete()", {expr = true})
map("i", "<CR>", "compe#confirm('<CR>')", {expr = true})
map("i", "<C-e>", "compe#close('<C-e>')", {expr = true})
map("i", "C-u", "compe#scroll({ 'delta': +4 })", {noremap = false, expr = true})
map("i", "<C-d>", "compe#scroll({ 'delta': -4 })", {noremap = false, expr = true})
