local o = vim.o
local bo = vim.bo
local wo = vim.wo
local util = vim.lsp.util
local api = vim.api
local cmd = vim.cmd
local fn = vim.fn
local lsp = vim.lsp
local tbl_extend = vim.tbl_extend

local function options(opts)
  for k, v in pairs(opts) do
    if v == true then
      cmd("set " .. k)
    elseif v == false then
      cmd(string.format("set no%s", k))
    else
      cmd(string.format("set %s=%s", k, v))
    end
  end
end

options(
  {
    -- Boolean value
    incsearch = true,
    compatible = false,
    wildmenu = true,
    autoindent = true,
    smartcase = true, -- improve searching using '/'
    smartindent = true, -- smarter indentation
    smarttab = true, -- make tab behaviour smarter
    undofile = true,
    showmatch = true, -- highlight matching [{()}]
    showcmd = true, -- disable mode display since lightline display
    showmode = false, -- don't show mode
    backup = false, -- disable backup
    writebackup = false, -- disable backup
    cursorline = true, -- enable cursorline
    expandtab = true, -- use spaces instead of tabs
    hidden = true, -- keep hidden buffers
    hlsearch = true, -- highlight matching search
    ignorecase = true, -- case insensitive on search
    lazyredraw = true, -- lazyredraw to make macro faster
    list = true, -- display listchars
    number = true, -- enable number
    relativenumber = true, -- enable relativenumber
    splitbelow = true, -- split below instead of above
    splitright = true, -- split right instead of left
    startofline = false, -- don't go to the start of the line when moving to another file
    swapfile = false, -- disable swapfile
    termguicolors = true, -- truecolours for better experience
    wrap = true,
    spell = true,
    -- String value

    encoding = "UTF-8", -- set encoding
    mouse = "a", -- enable mouse support
    signcolumn = "yes", -- enable sign column all the time, 4 column
    clipboard = "unnamedplus", -- use system clipboard
    shell = "fish", -- fish as shell
    syntax = "on", -- syntax enable
    undodir = "/tmp/",
    foldmethod = "expr",
    foldexpr = "nvim_treesitter#foldexpr()",
    fillchars = "eob:·,vert:·",
    listchars = "eol:↲,tab:»-,extends:>,precedes:<,trail:·,nbsp:␣ list",
    wildignore = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**",
    -- Number value
    foldlevel = 99,
    cmdheight = 1,
    colorcolumn = 80, -- 120 chars color column
    laststatus = 2, -- always enable statusline
    pumheight = 20, -- limit completion items
    re = 1, -- set regexp engine to auto
    scrolloff = 5, -- make scrolling better
    sidescroll = 2, -- make scrolling better
    sidescrolloff = 15, -- make scrolling better
    synmaxcol = 500, -- set limit for syntax highlighting in a single line
    shiftwidth = 2, -- set indentation width
    tabstop = 2, -- tabsize
    softtabstop = 2,
    textwidth = 140,
    redrawtime = 1500,
    numberwidth = 1,
    timeoutlen = 300, -- faster timeout wait time
    updatetime = 100, -- set faster update time
    ttimeoutlen = 0
    -- modifiable = true
  }
)

-- autocmds

cmd "au TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 500})"

--[[ cmd "au BufNewFile,BufRead .eslintignore,.prettierignore,.aliases setf conf"
cmd "au BufNewFile,BufRead .eslintrc,.prettierrc,tsconfig.json setf json" ]]
-- Return to last edited line
cmd [[au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") && &filetype != 'gitcommit' | exe "normal! g'\"" | endif]]

cmd "filetype plugin indent on"

-- keymaps

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true, silent = true}
  if opts then
    options = tbl_extend("force", options, opts)
  end
  api.nvim_set_keymap(mode, lhs, rhs, options)
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

map("n", "<leader>x", ":lua Reload()<CR>", {})
-- Try search and replace
map("n", "<space>S", ":lua require('spectre').open()<CR>")
map("n", "<space>sw", "viw:lua require('spectre').open_visual()<CR>")
map("n", "<space>s", ":lua require('spectre').open_visual()<CR>")
map("n", "<space>sp", ":lua require('spectre').open_file_search()<CR>")

map("i", "kj", "<esc>")
map("i", "jk", "<esc>")

-- <leader> to space
map("n", "<Space>", "<Nop>")
map("n", "s", "<Nop>")

-- Search settings
map("n", "s.", ":lua TelescopeDotfiles()<CR>")
map("n", "sk", ":Telescope keymaps<CR>")

-- Lsp
map("n", "gh", "<Cmd>lua vim.lsp.buf.hover()<CR>", {})
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", {})
map("n", "ga", ":Telescope lsp_code_actions<CR>")
map("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", {})
map("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", {})
map("n", "<leader>d", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", {})
map("n", "[", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", {})
map("n", "]", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", {})

-- Telescope
map("n", "se", ":Telescope file_browser<CR>")
map("n", "st", ":Telescope<CR>")
map("n", "sp", ":Telescope find_files hidden=true<CR>")
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

map("n", "<C-p>", ":Telescope find_files hidden=true<CR>")
map("n", "<C-f>", ":Telescope live_grep<CR>")
map("n", "<leader>b", ":Telescope buffers<CR>")
map("n", "<C-c>", ":Telescope commands<CR>")
map("n", "<leader>lws", ":Telescope lsp_workspace_symbols<CR>")
map("n", "<leader>v", ":Telescope vim_options<CR>")

-- Quick fix list
map("n", "<leader>n", ":cnext<CR>")
map("n", "<leader>N", ":cprev<CR>")

-- Registers
map("n", '"', ":Telescope registers<CR>")

-- Hop
map("n", "f", ":HopWord<CR>", {})

-- Neuron
map("n", "<C-z>", "<Nop>")
map("n", "zn", "<cmd>lua require'neuron/cmd'.new_edit(require'neuron'.config.neuron_dir)<CR>")
map("n", "sz", "<cmd>lua require'neuron/telescope'.find_zettels()<CR>")

-- Move lines
map("n", "<A-k>", ":<C-u>move-2<CR>==", {})
map("v", "<A-k>", ":move-2<CR>gv=gv", {})
map("n", "<A-j>", ":<C-u>move+<CR>==", {})
map("v", "<A-j>", ":move'>+<CR>gv=gv", {})

-- Save and exit
map("n", "<Leader>q", ":q<CR>")
map("n", "<Leader>w", ":w!<CR>")

-- Git
map("n", "sd", ":SignifyHunkDiff<CR>", {})
map("n", "sg", ":Neogit<CR>", {})
map("n", "tb", ":GitBlameToggle<CR>", {})

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

-- Startify
map("n", "<leader>,", ":Startify<CR>", {})

-- Move to the end of yanked text after yank and paste
map("n", "p", "p`]")
map("v", "y", "y`]")
map("v", "p", "p`]")

-- Terminal
map("n", "<leader>tt", "<cmd>FloatermNew --height=0.3 --wintype=normal --position=bottom<CR>", {})
map("n", "<leader>tv", "<cmd>FloatermNew --width=0.4 --wintype=normal --position=right<CR>", {})

-- React jsx comment
map("n", "<leader>cc", ":normal gcc<CR>", {})

-- map("n", "<F12>", ":FloatermToggle<CR>")
map("t", "<Esc><Esc>", "<C-\\><C-n>:FloatermToggle<CR>")

map("i", "<C-Space>", "compe#complete()", {expr = true})
map("i", "<CR>", "compe#confirm('<CR>')", {expr = true})
map("i", "<C-e>", "compe#close('<C-e>')", {expr = true})
map("i", "C-u", "compe#scroll({ 'delta': +4 })", {noremap = false, expr = true})
map("i", "<C-d>", "compe#scroll({ 'delta': -4 })", {noremap = false, expr = true})
