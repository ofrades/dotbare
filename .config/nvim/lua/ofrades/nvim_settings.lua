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
    t_Co = 256,
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
    foldlevel = 10,
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

-- Disable Netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- autocmds

vim.cmd "au TextYankPost * silent! lua require'vim.highlight'.on_yank({higroup = 'IncSearch', timeout = 500, on_visual = true})"

--[[ cmd "au BufNewFile,BufRead .eslintignore,.prettierignore,.aliases setf conf"
cmd "au BufNewFile,BufRead .eslintrc,.prettierrc,tsconfig.json setf json" ]]
-- Return to last edited line
vim.cmd [[au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") && &filetype != 'gitcommit' | exe "normal! g'\"" | endif]]

vim.cmd "filetype plugin indent on"
