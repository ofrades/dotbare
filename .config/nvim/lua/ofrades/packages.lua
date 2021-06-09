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
    use {
      "folke/lsp-trouble.nvim",
      config = function()
        require("trouble").setup {}
      end
    }

    use "onsails/lspkind-nvim"
    use "jose-elias-alvarez/nvim-lsp-ts-utils"
    use "jose-elias-alvarez/null-ls.nvim"
    use "tamago324/nlsp-settings.nvim"
    use "ray-x/lsp_signature.nvim"

    -- Telescope
    use {
      "nvim-telescope/telescope.nvim", -- navigate the galaxy
      requires = {
        {"nvim-lua/popup.nvim"},
        {"nvim-lua/plenary.nvim"},
        {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}
      }
    }

    use {
      "folke/which-key.nvim",
      config = function()
        require("which-key").setup {}
      end
    }
    use "folke/lua-dev.nvim"
    use {
      "folke/todo-comments.nvim",
      config = function()
        require("todo-comments").setup {}
      end
    }
    use "TimUntersberger/neogit" -- Magit clone for Neovim
    use "rhysd/committia.vim" -- More Pleasant Editing on Commit Message
    use "lewis6991/gitsigns.nvim" -- git signs
    use "sindrets/diffview.nvim" -- tree like git diff
    use "tpope/vim-commentary" -- comments
    use "JoosepAlviste/nvim-ts-context-commentstring" -- comments with context
    -- use "kevinhwang91/nvim-bqf" -- better quickfix
    use "mhinz/vim-startify" -- startup screen
    use "mg979/vim-visual-multi" -- select multiple words under cursor
    use "psliwka/vim-smoothie" -- smooth scrool
    use "windwp/nvim-spectre" -- search and replace
    -- Snippets
    use "hrsh7th/vim-vsnip"
    use "hrsh7th/vim-vsnip-integ"
    use "dsznajder/vscode-es7-javascript-react-snippets"
    use "xabikos/vscode-javascript"
    use "burkeholland/simple-react-snippets"
    use "mlaursen/vim-react-snippets"
    use "abusaidm/html-snippets"

    use {"rrethy/vim-hexokinase", run = "make hexokinase"} -- show colors
    use "kyazdani42/nvim-web-devicons" -- icons
    use "tjdevries/express_line.nvim" --statusline
    use "nvim-lua/lsp-status.nvim" -- statuline
    use "eddyekofo94/gruvbox-flat.nvim" -- theme
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"} -- tresitter highlights for better syntax highlights
    use "nvim-treesitter/playground" -- to check syntax under cursor
    use "tamago324/lir.nvim" -- tree project view
  end
)
