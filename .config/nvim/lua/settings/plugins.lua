local execute = vim.api.nvim_command
local fn, cmd = vim.fn, vim.cmd

local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
  execute "packadd packer.nvim"
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
      use "glepnir/lspsaga.nvim"
      -- use "anott03/nvim-lspinstall"
      -- use "nvim-lua/completion-nvim"
      -- use "nvim-lua/lsp-status.nvim"

      -- Snippets
      use {"hrsh7th/vim-vsnip", event = "InsertEnter *"}
      use {"hrsh7th/vim-vsnip-integ", event = "InsertEnter *"}

      use {"aca/completion-tabnine", run = "./install.sh", opt = true}
      use {"nvim-treesitter/nvim-treesitter", config = "require('plugins.tsitter')"}
      use {"nvim-treesitter/completion-treesitter", opt = true}

      -- Telescope
      use {
        'nvim-telescope/telescope.nvim',
        requires = {
          {'nvim-lua/popup.nvim'},
          {'nvim-lua/plenary.nvim'}
        }
      }
      -- use "oberblastmeister/neuron.nvim"

      -- Git
      use "tpope/vim-fugitive"
      use "stsewd/fzf-checkout.vim"
      use "tpope/vim-rhubarb"
      use "rhysd/conflict-marker.vim" -- Highlight conflict markers.[x and ]x, ct for themselves, co for ourselves, cn for none and cb
      use "lewis6991/gitsigns.nvim"
      use "kdheepak/lazygit.nvim"

      -- Misk
      use "junegunn/vim-peekaboo"
      use "tweekmonster/startuptime.vim" -- benchmark startup
      use "mhinz/vim-startify" -- start screen
      use "justinmk/vim-sneak"
      use "tpope/vim-commentary"
      use "cohama/lexima.vim" -- Auto close parentheses and repeat by dot dot dot...
      use "alvan/vim-closetag"
      use "andymass/vim-matchup"
      use "rrethy/vim-illuminate" -- highlight matching words when cursor on it
      use "AndrewRadev/tagalong.vim" -- Auto change html tags
      use "voldikss/vim-floaterm"
      use "mattn/emmet-vim"
      use "psliwka/vim-smoothie"
      use "kyazdani42/nvim-tree.lua"
      use "mg979/vim-visual-multi"

      -- Fzf
      use {"junegunn/fzf", run = "./install --all"} -- Fuzzy Searcher
      use "junegunn/fzf.vim"
      use "gfanto/fzf-lsp.nvim"

      -- JavaScript
      use "leafgarland/typescript-vim"
      use "peitalin/vim-jsx-typescript"
      -- React/JS Snippets
      use "dsznajder/vscode-es7-javascript-react-snippets"
      use "burkeholland/simple-react-snippets"
      use "xabikos/vscode-javascript"
      use "Galooshi/vim-import-js"
      use "styled-components/vim-styled-components"

      -- Themes
      use "kyazdani42/nvim-web-devicons"
      use "sheerun/vim-polyglot"

      -- UI
      use "glepnir/galaxyline.nvim"
    end,
    config = {
      display = {
        open_fn = require "packer.util".float
      }
    }
  }
)
