" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

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

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  ["bootstrap4-snippets"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/bootstrap4-snippets"
  },
  ["committia.vim"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/committia.vim"
  },
  ["compe-tabnine"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/compe-tabnine"
  },
  ["conflict-marker.vim"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/conflict-marker.vim"
  },
  ["formatter.nvim"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/formatter.nvim"
  },
  ["galaxyline.nvim"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["git-blame.nvim"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/git-blame.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["hop.nvim"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/hop.nvim"
  },
  ["html-snippets"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/html-snippets"
  },
  kommentary = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["lazygit.nvim"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/lazygit.nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["neuron.nvim"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/neuron.nvim"
  },
  ["nvim-bqf"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/nvim-bqf"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-hlslens"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/nvim-hlslens"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspupdate"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/nvim-lspupdate"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["rooter.nvim"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/rooter.nvim"
  },
  ["simple-react-snippets"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/simple-react-snippets"
  },
  ["tagalong.vim"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/tagalong.vim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope-symbols.nvim"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/telescope-symbols.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  undotree = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/undotree"
  },
  ["vim-closetag"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/vim-closetag"
  },
  ["vim-efm-langserver-settings"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/vim-efm-langserver-settings"
  },
  ["vim-floaterm"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/vim-floaterm"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-hexokinase"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/vim-hexokinase"
  },
  ["vim-highlightedyank"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/vim-highlightedyank"
  },
  ["vim-illuminate"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/vim-illuminate"
  },
  ["vim-import-js"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/vim-import-js"
  },
  ["vim-matchup"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/vim-matchup"
  },
  ["vim-polyglot"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/vim-polyglot"
  },
  ["vim-react-snippets"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/vim-react-snippets"
  },
  ["vim-sandwich"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/vim-sandwich"
  },
  ["vim-smoothie"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/vim-smoothie"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/vim-startify"
  },
  ["vim-styled-components"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/vim-styled-components"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/vim-visual-multi"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/vim-vsnip-integ"
  },
  ["vim-wordmotion"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/vim-wordmotion"
  },
  ["vista.vim"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/vista.vim"
  },
  ["vscode-es7-javascript-react-snippets"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/vscode-es7-javascript-react-snippets"
  },
  ["vscode-javascript"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/vscode-javascript"
  },
  ["vue-vscode-snippets"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/vue-vscode-snippets"
  }
}

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
