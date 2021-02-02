local fn = vim.fn
local cmd = vim.cmd
local exec = vim.api.nvim_exec

-- Auto save files when focus is lost
cmd "au TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 500})"
cmd "au TermOpen * setlocal signcolumn=no nonumber norelativenumber"

cmd "au BufNewFile,BufRead .eslintignore,.prettierignore,.aliases setf conf"
cmd "au BufNewFile,BufRead .eslintrc,.prettierrc,tsconfig.json setf json"

cmd 'au FileType html,css,javascript,javascriptreact,vue,typescript,typescriptreact EmmetInstall'

-- Return to last edited line
cmd [[au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") && &filetype != 'gitcommit' | exe "normal! g'\"" | endif]]
-- Reload module after saving
-- cmd "au BufWritePost *.lua :lua reload()<CR>"

cmd "au Filetype fzf setlocal winblend=7"
cmd "au CmdlineLeave : echo ''"

--[[ cmd "command! LSPReload lua reload_lsp()"
cmd "command! LSPDebug lua print(vim.inspect(vim.lsp.get_active_clients()))"
cmd "command! LSPLog lua open_lsp_log()" ]]

-- cmd [[command! -nargs=0 ImportJs execute "normal ggOimport { ".expand('<cword>')."} from '';"]]
-- cmd("au BufEnter * lua require'completion'.on_attach()")
-- cmd("au CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics({ show_header = false })")

-- Startuptime
exec([[
  if has('vim_starting') && has('reltime')
   let g:startuptime = reltime()
   augroup vimrc-startuptime
     autocmd!
     autocmd VimEnter * echomsg 'startuptime:' . reltimestr(reltime(g:startuptime))
   augroup END
 endif
]],"")

-- Automatic rename of tmux window
-- api.nvim_exec(
--   [[
--    augroup vimrc
--      if exists('$TMUX') && !exists('$NORENAME')
--        au BufEnter * if empty(&buftype) | call system('tmux rename-window '.expand('%:t:S')) | endif
--        au VimLeave * call system('tmux set-window automatic-rename on')
--      endif
--    augroup end
--   ]],
--   ""
-- )

exec([[
  augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
  augroup END
]],"")
