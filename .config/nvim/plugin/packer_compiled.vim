" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif
try

lua << END
  local package_path_str = "/home/ofrades/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/ofrades/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/ofrades/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/ofrades/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
  local install_cpath_pattern = "/home/ofrades/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
  if not string.find(package.path, package_path_str, 1, true) then
    package.path = package.path .. ';' .. package_path_str
  end

  if not string.find(package.cpath, install_cpath_pattern, 1, true) then
    package.cpath = package.cpath .. ';' .. install_cpath_pattern
  end

_G.packer_plugins = {
  ["barbar.nvim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/barbar.nvim"
  },
  ["codi.vim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/codi.vim"
  },
  ["conflict-marker.vim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/conflict-marker.vim"
  },
  ["emmet-vim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/emmet-vim"
  },
  ["formatter.nvim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/formatter.nvim"
  },
  fzf = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/fzf"
  },
  ["fzf-checkout.vim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/fzf-checkout.vim"
  },
  ["fzf.vim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  ["galaxyline.nvim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["git-blame.nvim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/git-blame.nvim"
  },
  ["github-light.vim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/github-light.vim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  kommentary = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["nord-vim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/nord-vim"
  },
  ["nvcode-color-schemes.vim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/nvcode-color-schemes.vim"
  },
  ["nvim-compe"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lightbulb"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/nvim-lightbulb"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["paper.vim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/paper.vim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["rooter.nvim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/rooter.nvim"
  },
  ["splitjoin.vim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/splitjoin.vim"
  },
  ["startuptime.vim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/startuptime.vim"
  },
  ["tagalong.vim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/tagalong.vim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  undotree = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/undotree"
  },
  ["vim-closetag"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/vim-closetag"
  },
  ["vim-floaterm"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/vim-floaterm"
  },
  ["vim-fugitive"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-hexokinase"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/vim-hexokinase"
  },
  ["vim-highlightedyank"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/vim-highlightedyank"
  },
  ["vim-illuminate"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/vim-illuminate"
  },
  ["vim-import-js"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/vim-import-js"
  },
  ["vim-lengthmatters"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/vim-lengthmatters"
  },
  ["vim-matchup"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/vim-matchup"
  },
  ["vim-polyglot"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/vim-polyglot"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/vim-rhubarb"
  },
  ["vim-sandwich"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/vim-sandwich"
  },
  ["vim-smoothie"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/vim-smoothie"
  },
  ["vim-sneak"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/vim-sneak"
  },
  ["vim-startify"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/vim-startify"
  },
  ["vim-styled-components"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/vim-styled-components"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/vim-visual-multi"
  },
  ["vim-vsnip"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/vim-vsnip-integ"
  },
  ["vscode-es7-javascript-react-snippets"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/vscode-es7-javascript-react-snippets"
  }
}

local function handle_bufread(names)
  for _, name in ipairs(names) do
    local path = packer_plugins[name].path
    for _, dir in ipairs({ 'ftdetect', 'ftplugin', 'after/ftdetect', 'after/ftplugin' }) do
      if #vim.fn.finddir(dir, path) > 0 then
        vim.cmd('doautocmd BufRead')
        return
      end
    end
  end
end

local packer_load = nil
local function handle_after(name, before)
  local plugin = packer_plugins[name]
  plugin.load_after[before] = nil
  if next(plugin.load_after) == nil then
    packer_load({name}, {})
  end
end

packer_load = function(names, cause)
  local some_unloaded = false
  for _, name in ipairs(names) do
    if not packer_plugins[name].loaded then
      some_unloaded = true
      break
    end
  end

  if not some_unloaded then return end

  local fmt = string.format
  local del_cmds = {}
  local del_maps = {}
  for _, name in ipairs(names) do
    if packer_plugins[name].commands then
      for _, cmd in ipairs(packer_plugins[name].commands) do
        del_cmds[cmd] = true
      end
    end

    if packer_plugins[name].keys then
      for _, key in ipairs(packer_plugins[name].keys) do
        del_maps[key] = true
      end
    end
  end

  for cmd, _ in pairs(del_cmds) do
    vim.cmd('silent! delcommand ' .. cmd)
  end

  for key, _ in pairs(del_maps) do
    vim.cmd(fmt('silent! %sunmap %s', key[1], key[2]))
  end

  for _, name in ipairs(names) do
    if not packer_plugins[name].loaded then
      vim.cmd('packadd ' .. name)
      if packer_plugins[name].config then
        for _i, config_line in ipairs(packer_plugins[name].config) do
          loadstring(config_line)()
        end
      end

      if packer_plugins[name].after then
        for _, after_name in ipairs(packer_plugins[name].after) do
          handle_after(after_name, name)
          vim.cmd('redraw')
        end
      end

      packer_plugins[name].loaded = true
    end
  end

  handle_bufread(names)

  if cause.cmd then
    local lines = cause.l1 == cause.l2 and '' or (cause.l1 .. ',' .. cause.l2)
    vim.cmd(fmt('%s%s%s %s', lines, cause.cmd, cause.bang, cause.args))
  elseif cause.keys then
    local keys = cause.keys
    local extra = ''
    while true do
      local c = vim.fn.getchar(0)
      if c == 0 then break end
      extra = extra .. vim.fn.nr2char(c)
    end

    if cause.prefix then
      local prefix = vim.v.count ~= 0 and vim.v.count or ''
      prefix = prefix .. '"' .. vim.v.register .. cause.prefix
      if vim.fn.mode('full') == 'no' then
        if vim.v.operator == 'c' then
          prefix = '' .. prefix
        end

        prefix = prefix .. vim.v.operator
      end

      vim.fn.feedkeys(prefix, 'n')
    end

    local escaped_keys = vim.api.nvim_replace_termcodes(cause.keys .. extra, true, true, true)
    vim.api.nvim_feedkeys(escaped_keys, 'm', true)
  elseif cause.event then
    vim.cmd(fmt('doautocmd <nomodeline> %s', cause.event))
  elseif cause.ft then
    vim.cmd(fmt('doautocmd <nomodeline> %s FileType %s', 'filetypeplugin', cause.ft))
    vim.cmd(fmt('doautocmd <nomodeline> %s FileType %s', 'filetypeindent', cause.ft))
  end
end

_packer_load_wrapper = function(names, cause)
  success, err_msg = pcall(packer_load, names, cause)
  if not success then
    vim.cmd('echohl ErrorMsg')
    vim.cmd('echomsg "Error in packer_compiled: ' .. vim.fn.escape(err_msg, '"') .. '"')
    vim.cmd('echomsg "Please check your config for correctness"')
    vim.cmd('echohl None')
  end
end

-- Runtimepath customization

-- Pre-load configuration
-- Post-load configuration
-- Conditional loads
-- Load plugins in order defined by `after`
END

function! s:load(names, cause) abort
  call luaeval('_packer_load_wrapper(_A[1], _A[2])', [a:names, a:cause])
endfunction


" Command lazy-loads

" Keymap lazy-loads

augroup packer_load_aucmds
  au!
  " Filetype lazy-loads
  " Event lazy-loads
  " Function lazy-loads
augroup END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
