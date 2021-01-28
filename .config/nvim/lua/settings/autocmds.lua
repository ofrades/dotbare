local fn = vim.fn
local cmd = vim.cmd
local exec = vim.api.nvim_exec

-- Treesitter highlight at buffer startup
cmd "au BufEnter * TSBufEnable highlight"

-- Return to last edited line
cmd [[au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]]

cmd "au CmdlineLeave : echo ''"

