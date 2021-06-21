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
  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/ofrades/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/ofrades/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/ofrades/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/ofrades/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/ofrades/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/LuaSnip"
  },
  ["committia.vim"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/committia.vim"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/diffview.nvim"
  },
  ["express_line.nvim"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/express_line.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["gruvbox-flat.nvim"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/gruvbox-flat.nvim"
  },
  hop = {
    config = { "\27LJ\2\nU\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\tkeys\28etovxqpdygfblzhckisuran\nsetup\bhop\frequire\0" },
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/hop"
  },
  ["html-snippets"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/html-snippets"
  },
  ["lir.nvim"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/lir.nvim"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/lsp-status.nvim"
  },
  ["lsp-trouble.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/lsp-trouble.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lua-dev.nvim"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/lua-dev.nvim"
  },
  neogit = {
    config = { "\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vneogit\frequire\0" },
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/neogit"
  },
  ["nlsp-settings.nvim"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/nlsp-settings.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/null-ls.nvim"
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
  ["nvim-lsp-ts-utils"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/nvim-lsp-ts-utils"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-spectre"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/nvim-spectre"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22nvim-web-devicons\frequire\0" },
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["simple-react-snippets"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/simple-react-snippets"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18todo-comments\frequire\0" },
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/todo-comments.nvim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-hexokinase"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/vim-hexokinase"
  },
  ["vim-react-snippets"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/vim-react-snippets"
  },
  ["vim-smoothie"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/vim-smoothie"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/vim-startify"
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
  ["vscode-es7-javascript-react-snippets"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/vscode-es7-javascript-react-snippets"
  },
  ["vscode-javascript"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/vscode-javascript"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-web-devicons
time([[Config for nvim-web-devicons]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22nvim-web-devicons\frequire\0", "config", "nvim-web-devicons")
time([[Config for nvim-web-devicons]], false)
-- Config for: neogit
time([[Config for neogit]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vneogit\frequire\0", "config", "neogit")
time([[Config for neogit]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")
time([[Config for todo-comments.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: lsp-trouble.nvim
time([[Config for lsp-trouble.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0", "config", "lsp-trouble.nvim")
time([[Config for lsp-trouble.nvim]], false)
-- Config for: hop
time([[Config for hop]], true)
try_loadstring("\27LJ\2\nU\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\tkeys\28etovxqpdygfblzhckisuran\nsetup\bhop\frequire\0", "config", "hop")
time([[Config for hop]], false)
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
