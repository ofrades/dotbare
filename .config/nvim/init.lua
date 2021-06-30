-- ofrades config
-- lazy loading
-- followed https://elianiva.my.id/post/improving-nvim-startup-time#loading-configuration
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- disable builtin plugins
vim.g.loaded_gzip = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_spec = 1

vim.cmd([[
  runtime! lua/ofrades/packages.lua
  runtime! lua/ofrades/settings.lua
  runtime! lua/ofrades/keymaps.lua
]])
