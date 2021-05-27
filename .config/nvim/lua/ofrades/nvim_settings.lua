vim.cmd [[colorscheme gruvbox-flat]]
local function options(opts)
  for k, v in pairs(opts) do
    if v == true then
      vim.cmd("set " .. k)
    elseif v == false then
      vim.cmd(string.format("set no%s", k))
    else
      vim.cmd(string.format("set %s=%s", k, v))
    end
  end
end

options(
  {
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
    list = true, -- display listchars
    number = true, -- enable number
    relativenumber = false, -- enable relativenumber
    swapfile = false, -- disable swapfile
    spell = false,
    encoding = "UTF-8", -- set encoding
    mouse = "a", -- enable mouse support
    signcolumn = "yes", -- enable sign column all the time, 4 column
    clipboard = "unnamedplus", -- use system clipboard
    shell = "fish", -- fish as shell
    syntax = "on", -- syntax enable
    undodir = "/tmp/",
    foldmethod = "expr",
    foldexpr = "nvim_treesitter#foldexpr()",
    -- fillchars = "eob:·,vert:·",
    listchars = "eol:↲,tab:»-,extends:>,precedes:<,trail:·,nbsp:␣ list",
    wildignore = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**",
    foldlevel = 10,
    laststatus = 2, -- always enable statusline
    pumheight = 20, -- limit completion items
    scrolloff = 5, -- make scrolling better
    sidescroll = 2, -- make scrolling better
    sidescrolloff = 15, -- make scrolling better
    synmaxcol = 500, -- set limit for syntax highlighting in a single line
    shiftwidth = 2, -- set indentation width
    tabstop = 2, -- tabsize
    softtabstop = 2
    -- modifiable = true
  }
)

-- Disable Netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- autocmds

vim.cmd "au TextYankPost * silent! lua require'vim.highlight'.on_yank({higroup = 'IncSearch', timeout = 500, on_visual = true})"
