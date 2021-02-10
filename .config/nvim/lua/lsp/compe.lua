vim.cmd [[packadd nvim-compe]]
vim.cmd [[packadd vim-vsnip]]
vim.cmd [[packadd vim-vsnip-integ]]
local map = require "settings.utils".map

-- vim.cmd "au BufEnter *.jsx set filetype=javascript"

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;

  source = {
    path = {menu = " PATH"};
    buffer = {menu = " BUFFER"};
    calc = {menu = " CALC"};
    vsnip = {menu = "陼 SNIP"};
    nvim_lsp = {menu = "滑 LSP"};
    nvim_lua = {menu = " LUA"};
    spell = {menu = "韛 SPELL"};
    treesitter = {menu = "侮 TREESITTER"};
    tags = true;
  };
}

map("i", "<CR>", "compe#confirm('<CR>')", {expr = true})

local filetypes = {'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'lua', 'go', 'vim', 'php', 'python'}

vim.cmd [[augroup vimrc_lsp]]
  vim.cmd [[autocmd!]]
  vim.cmd(string.format('autocmd FileType %s call v:lua.hover()', table.concat(filetypes, ',')))
vim.cmd [[augroup END]]

function _G.hover()
  -- vim.cmd[[autocmd CursorHold <buffer> silent! lua require"lspsaga.diagnostic".show_line_diagnostics()]]
  -- vim.cmd[[autocmd CursorHold <buffer> silent! lua require('lspsaga.hover').render_hover_doc()]]
  vim.cmd[[autocmd CursorHoldI <buffer> silent! lua require"lspsaga.signaturehelp".signature_help()]]
end

--
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  --[[ elseif vim.fn.call("vsnip#available", {1}) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)" ]]
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  --[[ elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)" ]]
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
