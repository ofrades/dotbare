local exec = vim.api.nvim_command
local fn, cmd = vim.fn, vim.cmd

local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  exec("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
  exec "packadd packer.nvim"
end

-- Only required if you have packer in your `opt` pack
cmd [[packadd packer.nvim]]

-- Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:
cmd [[ autocmd BufWritePost plugins.lua PackerCompile ]]

return require("packer").startup(
  {
    function(use)
      -- Packer can manage itself as an optional plugin
      use {"wbthomason/packer.nvim", opt = true}

      -- LSP
      use "neovim/nvim-lspconfig"
      use "hrsh7th/nvim-compe"
      use {"tzachar/compe-tabnine", run = "./install.sh"}
      use "glepnir/lspsaga.nvim"
      use "alexaandru/nvim-lspupdate"
      use "liuchengxu/vista.vim"
      use "tsuyoshicho/vim-efm-langserver-settings" -- auto config efm lsp

      -- Telescope
      use {
          'nvim-telescope/telescope.nvim',
          requires = {
              {'nvim-lua/popup.nvim'},
              {'nvim-lua/plenary.nvim'},
              {'nvim-telescope/telescope-symbols.nvim'},
              {'nvim-telescope/telescope-fzy-native.nvim'},
              {'nvim-telescope/telescope-z.nvim'},
              {'nvim-telescope/telescope-media-files.nvim'}
          }
      }
      -- Git
      use "tpope/vim-fugitive"
      use 'TimUntersberger/neogit'
      use "rhysd/conflict-marker.vim"
      use "rhysd/committia.vim"
      -- use "lewis6991/gitsigns.nvim"
      use "mhinz/vim-signify"
      use "f-person/git-blame.nvim"
-- -- TODO
      -- use "kdheepak/lazygit.vim"

      -- Diagnostics
      -- use "dense-analysis/ale"

      -- Misk
      use "phaazon/hop.nvim"
      use "b3nj5m1n/kommentary" -- comments like gcc
      use "oberblastmeister/rooter.nvim" -- root dir switcher
      use "alvan/vim-closetag"
      use "AndrewRadev/tagalong.vim" -- Auto change html tags
      -- use "windwp/nvim-ts-autotag" -- Auto close xml tags
      use "kevinhwang91/nvim-bqf" -- better quickfix
      use "mhinz/vim-startify" -- start screen
      use "mbbill/undotree" -- undo tree
      use "machakann/vim-sandwich" -- Change surrounding arks
      use "rrethy/vim-illuminate" -- highlight matching words when cursor on it
      use "mhartington/formatter.nvim"
      use "voldikss/vim-floaterm"
      -- use {"mattn/emmet-vim", ft = {'javascriptreact', 'typescriptreact', 'javascript', 'html', 'css', 'jsx', 'tsx', 'vue'} }
      use "mg979/vim-visual-multi"
      use "machakann/vim-highlightedyank"
      use "psliwka/vim-smoothie"
      use "andymass/vim-matchup"
      use "chaoren/vim-wordmotion" -- Camel case navigation
      use "oberblastmeister/neuron.nvim"

      -- Fzf
      -- use {"junegunn/fzf", run = "./install --all"} -- Fuzzy Searcher
      -- use "junegunn/fzf.vim"

      -- JavaScript
      use "Galooshi/vim-import-js"
      use "styled-components/vim-styled-components"

      -- Snippets
      use "hrsh7th/vim-vsnip"
      use "hrsh7th/vim-vsnip-integ"
      use "dsznajder/vscode-es7-javascript-react-snippets"
      use "sdras/vue-vscode-snippets"
      use "xabikos/vscode-javascript"
      use "burkeholland/simple-react-snippets"
      use "mlaursen/vim-react-snippets"
      use "abusaidm/html-snippets"
      use "1tontech/bootstrap4-snippets"

      -- Themes
      use "sheerun/vim-polyglot"
      use {'rrethy/vim-hexokinase', run = 'make hexokinase' }

      -- UI
      use 'kyazdani42/nvim-tree.lua'
      use "kyazdani42/nvim-web-devicons"
      use "glepnir/galaxyline.nvim"
      use "kevinhwang91/nvim-hlslens"

      -- Styles
      -- use "npxbr/gruvbox.nvim"
      -- use "rktjmp/lush.nvim"

      -- Tree-sitter
      use {'nvim-treesitter/nvim-treesitter', run = ":TSUpdate"}
      -- use 'christianchiarulli/nvcode-color-schemes.vim'

      -- Debugging
      -- use {
      --   "mfussenegger/nvim-dap",
      --   requires = {
      --     {"theHamsta/nvim-dap-virtual-text"},
      --     {"nvim-telescope/telescope-dap.nvim"}
      --   },
      -- config = function()
      --   require("lsp.dap")
      -- end
      -- }
    end,
    config = {
      display = {
        open_fn = require "packer.util".float
      }
    }
  }
)
