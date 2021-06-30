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
    config = { "\27LJ\2\n°\1\0\0\3\0\a\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0005\2\4\0B\0\2\0016\0\0\0'\2\5\0B\0\2\0029\0\6\0B\0\1\1K\0\1\0\tload luasnip/loaders/from_vscode\1\0\2\fhistory\2\17updateevents\29TextChanged,TextChangedI\15set_config\vconfig\fluasnip\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/opt/LuaSnip"
  },
  ["committia.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/opt/committia.vim"
  },
  ["compe-tabnine"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/compe-tabnine"
  },
  ["diffview.nvim"] = {
    commands = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    load_after = {
      neogit = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/opt/diffview.nvim"
  },
  ["express_line.nvim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23ofrades.statusline\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/opt/express_line.nvim",
    wants = { "lsp-status.nvim" }
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21ofrades.gitsigns\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim"
  },
  ["gruvbox-flat.nvim"] = {
    config = { "\27LJ\2\n‚\2\0\0\3\0\n\0\0216\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0+\1\2\0=\1\4\0006\0\0\0009\0\1\0'\1\6\0=\1\5\0006\0\0\0009\0\1\0+\1\2\0=\1\a\0006\0\0\0009\0\b\0'\2\t\0B\0\2\1K\0\1\0\29colorscheme gruvbox-flat\bcmd\29gruvbox_italic_functions\tdark\23gruvbox_flat_style\24gruvbox_transparent\1\a\0\0\aqf\rterminal\tterm\vpacker\blir\18DiffviewFiles\21gruvbox_sidebars\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/opt/gruvbox-flat.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim"
  },
  ["lightspeed.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/opt/lightspeed.nvim"
  },
  ["lir-git-status.nvim"] = {
    config = { "\27LJ\2\nQ\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\17show_ignored\1\nsetup\19lir.git_status\frequire\0" },
    load_after = {
      ["lir.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/opt/lir-git-status.nvim"
  },
  ["lir.nvim"] = {
    after = { "lir-git-status.nvim" },
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21ofrades.explorer\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/opt/lir.nvim"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/lsp-status.nvim"
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
    after = { "diffview.nvim" },
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19ofrades.neogit\frequire\0" },
    loaded = false,
    needs_bufread = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/opt/neogit"
  },
  ["nlsp-settings.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17nlspsettings\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/opt/nlsp-settings.nvim",
    wants = { "nvim-lspconfig" }
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/null-ls.nvim"
  },
  ["nvim-compe"] = {
    after_files = { "/home/ofrades/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe.vim" },
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23ofrades.completion\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/opt/nvim-compe",
    wants = { "LuaSnip" }
  },
  ["nvim-lsp-ts-utils"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/nvim-lsp-ts-utils"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\nR\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\1K\0\1\0\23ofrades.lspservers\24ofrades.lsphandlers\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-spectre"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/opt/nvim-spectre",
    wants = { "plenary.nvim", "popup.nvim" }
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23ofrades.treesitter\frequire\0" },
    loaded = false,
    needs_bufread = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/opt/nvim-treesitter"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/opt/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22nvim-web-devicons\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons"
  },
  ["orgmode.nvim"] = {
    config = { "\27LJ\2\nà\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\3=\3\t\2B\0\2\1K\0\1\0\rmappings\vglobal\1\0\0\1\0\2\15org_agenda\15<leader>oa\16org_capture\15<leader>oc\21org_agenda_files\1\0\1\27org_default_notes_file\23~/notes/refile.org\1\2\0\0\14~/notes/*\nsetup\forgmode\frequire\0" },
    loaded = false,
    needs_bufread = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/opt/orgmode.nvim"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/opt/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/opt/popup.nvim"
  },
  ["startuptime.vim"] = {
    commands = { "StartupTime" },
    loaded = false,
    needs_bufread = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/opt/startuptime.vim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22ofrades.telescope\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    wants = { "trouble.nvim" }
  },
  ["todo-comments.nvim"] = {
    commands = { "TodoTrouble", "TodoTelescope" },
    config = { "\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18todo-comments\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/opt/todo-comments.nvim"
  },
  ["trouble.nvim"] = {
    commands = { "TroubleToggle", "Trouble" },
    config = { "\27LJ\2\nG\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\14auto_open\1\nsetup\ftrouble\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/opt/trouble.nvim"
  },
  ["vim-commentary"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/opt/vim-commentary"
  },
  ["vim-hexokinase"] = {
    config = { "\27LJ\2\nE\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\2\0\0\fvirtual\28Hexokinase_highlighters\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/opt/vim-hexokinase"
  },
  ["vim-matchup"] = {
    after_files = { "/home/ofrades/.local/share/nvim/site/pack/packer/opt/vim-matchup/after/plugin/matchit.vim" },
    loaded = false,
    needs_bufread = true,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/opt/vim-matchup"
  },
  ["vim-rooter"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/opt/vim-rooter"
  },
  ["vim-smoothie"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/opt/vim-smoothie"
  },
  ["vim-startify"] = {
    config = { '\27LJ\2\n™\a\0\0\4\0%\0I6\0\0\0009\0\1\0004\1\t\0005\2\4\0005\3\3\0=\3\5\2>\2\1\0015\2\a\0005\3\6\0=\3\b\2>\2\2\0015\2\n\0005\3\t\0=\3\v\2>\2\3\0015\2\r\0005\3\f\0=\3\14\2>\2\4\0015\2\16\0005\3\15\0=\3\1\2>\2\5\0015\2\18\0005\3\17\0=\3\19\2>\2\6\0015\2\21\0005\3\20\0=\3\22\2>\2\a\0015\2\24\0005\3\23\0=\3\25\2>\2\b\1=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\26\0006\0\0\0009\0\1\0)\1\3\0=\1\27\0006\0\0\0009\0\1\0)\1\1\0=\1\28\0006\0\0\0009\0\1\0)\1\1\0=\1\29\0006\0\0\0009\0\1\0)\1\1\0=\1\30\0006\0\0\0009\0\1\0)\1\1\0=\1\31\0006\0\0\0009\0\1\0)\1\1\0=\1 \0006\0\0\0009\0\1\0005\1"\0=\1!\0006\0\0\0009\0\1\0005\1$\0=\1#\0K\0\1\0\1\2\0\0(Beauty will save the world! ><(((*>\27startify_custom_footer\1\2\0\0\19COMMIT_EDITMSG\22startify_skiplist!startify_session_persistence\30startify_session_autoload\29startify_update_oldfiles\27startify_change_to_dir\27startify_relative_path\26startify_files_number\28startify_enable_special\6s\1\0\0\1\3\0\0\16Packer Sync\16:PackerSync\6z\1\0\0\1\3\0\0\nNotes\26:lua TelescopeNotes()\6n\1\0\0\1\3\0\0\15Nvim Files\29:lua TelescopeDotfiles()\1\0\0\1\3\0\0\bGit\f:Neogit\6t\1\0\0\1\3\0\0\22Telescope builtin\15:Telescope\6b\1\0\0\1\3\0\0\17File Browser\28:Telescope file_browser\6p\1\0\0\1\3\0\0\15Find Files&:Telescope find_files hidden=true\6o\1\0\0\1\3\0\0\17Recent Files$:Telescope oldfiles hidden=true\22startify_commands\6g\bvim\0' },
    loaded = false,
    needs_bufread = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/opt/vim-startify"
  },
  ["vim-visual-multi"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/opt/vim-visual-multi"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/ofrades/.local/share/nvim/site/pack/packer/opt/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^plenary"] = "plenary.nvim",
  ["^popup"] = "popup.nvim",
  ["^spectre"] = "nvim-spectre",
  ["^which%-key"] = "which-key.nvim"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat)then
      to_load[#to_load + 1] = plugin_name
    end
  end

  require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Setup for: vim-matchup
time([[Setup for vim-matchup]], true)
try_loadstring("\27LJ\2\nj\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\0\3\14fullwidth\2\14highlight\vNormal\vmethod\npopup!matchup_matchparen_offscreen\6g\bvim\0", "setup", "vim-matchup")
time([[Setup for vim-matchup]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
vim.cmd [[command! -nargs=* -range -bang -complete=file DiffviewOpen lua require("packer.load")({'diffview.nvim'}, { cmd = "DiffviewOpen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file DiffviewClose lua require("packer.load")({'diffview.nvim'}, { cmd = "DiffviewClose", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file DiffviewToggleFiles lua require("packer.load")({'diffview.nvim'}, { cmd = "DiffviewToggleFiles", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file DiffviewFocusFiles lua require("packer.load")({'diffview.nvim'}, { cmd = "DiffviewFocusFiles", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file TroubleToggle lua require("packer.load")({'trouble.nvim'}, { cmd = "TroubleToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Trouble lua require("packer.load")({'trouble.nvim'}, { cmd = "Trouble", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file TodoTrouble lua require("packer.load")({'todo-comments.nvim'}, { cmd = "TodoTrouble", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file TodoTelescope lua require("packer.load")({'todo-comments.nvim'}, { cmd = "TodoTelescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file StartupTime lua require("packer.load")({'startuptime.vim'}, { cmd = "StartupTime", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufRead * ++once lua require("packer.load")({'telescope.nvim', 'todo-comments.nvim', 'trouble.nvim', 'neogit', 'vim-commentary', 'gitsigns.nvim', 'vim-rooter', 'vim-smoothie', 'lightspeed.nvim', 'lir.nvim', 'vim-visual-multi', 'nlsp-settings.nvim', 'indent-blankline.nvim', 'nvim-treesitter', 'nvim-spectre', 'nvim-ts-context-commentstring', 'nvim-lspconfig', 'orgmode.nvim', 'vim-hexokinase'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'committia.vim', 'express_line.nvim', 'gruvbox-flat.nvim', 'nvim-web-devicons', 'vim-startify', 'which-key.nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-compe'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au InsertCharPre * ++once lua require("packer.load")({'LuaSnip'}, { event = "InsertCharPre *" }, _G.packer_plugins)]]
vim.cmd [[au CursorMoved * ++once lua require("packer.load")({'vim-matchup'}, { event = "CursorMoved *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
