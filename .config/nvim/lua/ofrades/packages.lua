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
cmd [[ autocmd BufWritePost ofrades.lua PackerCompile ]]

return require("packer").startup(
  function()
    -- Packer can manage itself as an optional plugin
    use {"wbthomason/packer.nvim", opt = true} -- package manager

    -- LSP
    use "neovim/nvim-lspconfig" -- lsp configuration
    use "hrsh7th/nvim-compe" -- lsp completion
    use {"tzachar/compe-tabnine", run = "./install.sh"}
    use "kabouzeid/nvim-lspinstall" -- easy lsp installs
    use "glepnir/lspsaga.nvim" -- lsp with highly a performant UI
    use {
      "folke/lsp-trouble.nvim",
      config = function()
        require("trouble").setup {}
      end
    }
    use "jose-elias-alvarez/nvim-lsp-ts-utils"
    use "folke/lsp-colors.nvim"
    use "airblade/vim-rooter"

    -- Telescope
    use {
      "nvim-telescope/telescope.nvim", -- navigate the galaxy
      requires = {
        {"nvim-lua/popup.nvim"},
        {"nvim-lua/plenary.nvim"},
        {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}
      }
    }
    -- Git
    use "tpope/vim-fugitive" -- A Git wrapper so awesome, it should be illegal
    use "TimUntersberger/neogit" -- Magit clone for Neovim
    use "rhysd/committia.vim" -- More Pleasant Editing on Commit Message
    use "lewis6991/gitsigns.nvim"

    -- Misk
    use "b3nj5m1n/kommentary" -- comments
    use "JoosepAlviste/nvim-ts-context-commentstring" -- comments with context
    use "kevinhwang91/nvim-bqf" -- better quickfix
    use "mhinz/vim-startify" -- startup screen
    use "andymass/vim-matchup" -- navigate and highlight matching words
    use "akinsho/nvim-toggleterm.lua" -- terminal
    -- use "mattn/emmet-vim"
    use "mg979/vim-visual-multi" -- select multiple words under cursor
    use "psliwka/vim-smoothie" -- smooth scrool

    -- Format
    use "mhartington/formatter.nvim" -- only using this because vue lsp

    -- search and replace
    use "windwp/nvim-spectre" -- search and replace

    -- Snippets
    use "hrsh7th/vim-vsnip"
    use "hrsh7th/vim-vsnip-integ"

    -- Import Snippets
    use "dsznajder/vscode-es7-javascript-react-snippets"
    use "sdras/vue-vscode-snippets"
    use "xabikos/vscode-javascript"
    use "burkeholland/simple-react-snippets"
    use "mlaursen/vim-react-snippets"
    use "abusaidm/html-snippets"

    -- UI
    use {"rrethy/vim-hexokinase", run = "make hexokinase"} -- show colors
    use "kyazdani42/nvim-web-devicons"
    use "glepnir/galaxyline.nvim" -- status line
    -- Theme
    use "tjdevries/colorbuddy.vim" -- used to create my own theme
    use "folke/tokyonight.nvim"

    -- Tree-sitter
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"} -- tresitter highlights for better syntax highlights
    use "nvim-treesitter/playground" -- to check syntax under cursor

    -- File explorer
    use "tamago324/lir.nvim" -- tree project view
  end
)
