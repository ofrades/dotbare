local fn = vim.fn
local cmd = vim.cmd
local exec = vim.api.nvim_exec


cmd "au TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 500})"

cmd "au BufNewFile,BufRead .eslintignore,.prettierignore,.aliases setf conf"
cmd "au BufNewFile,BufRead .eslintrc,.prettierrc,tsconfig.json setf json"

-- cmd 'au FileType html,css,javascript,javascriptreact,vue,typescript,typescriptreact EmmetInstall'

-- Return to last edited line
cmd [[au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") && &filetype != 'gitcommit' | exe "normal! g'\"" | endif]]

