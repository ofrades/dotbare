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
    use {"wbthomason/packer.nvim", opt = true}

    -- LSP
    use "neovim/nvim-lspconfig"
    use "hrsh7th/nvim-compe"
    use {"tzachar/compe-tabnine", run = "./install.sh"}
    use "kabouzeid/nvim-lspinstall"
    use "glepnir/lspsaga.nvim"

    -- Telescope
    use {
      "nvim-telescope/telescope.nvim",
      requires = {
        {"nvim-lua/popup.nvim"},
        {"nvim-lua/plenary.nvim"},
        {"nvim-telescope/telescope-symbols.nvim"},
        {"nvim-telescope/telescope-fzy-native.nvim"},
        {"nvim-telescope/telescope-z.nvim"},
        {"nvim-telescope/telescope-media-files.nvim"}
      }
    }
    -- Git
    use "tpope/vim-fugitive"
    use "TimUntersberger/neogit"
    use "rhysd/conflict-marker.vim"
    use "rhysd/committia.vim"
    use "mhinz/vim-signify"
    use "f-person/git-blame.nvim"

    -- Diagnostics
    -- use "dense-analysis/ale"

    -- Misk
    use "b3nj5m1n/kommentary"
    use "JoosepAlviste/nvim-ts-context-commentstring" -- comment with context
    use "oberblastmeister/rooter.nvim" -- root dir switcher
    -- use "AndrewRadev/tagalong.vim" -- Auto change html tags
    use "kevinhwang91/nvim-bqf" -- better quickfix
    use "mhinz/vim-startify" -- start screen
    use "rrethy/vim-illuminate" -- highlight matching words when cursor on it
    use "mhartington/formatter.nvim"
    use "andymass/vim-matchup"
    use "voldikss/vim-floaterm"
    use "mattn/emmet-vim"
    use "mg979/vim-visual-multi"
    use "machakann/vim-highlightedyank"
    use "psliwka/vim-smoothie"
    use "windwp/nvim-spectre"

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
    -- use "sheerun/vim-polyglot"
    use {"rrethy/vim-hexokinase", run = "make hexokinase"}

    -- UI
    use "kyazdani42/nvim-tree.lua"
    use "kyazdani42/nvim-web-devicons"
    -- use "akinsho/nvim-bufferline.lua"
    use "glepnir/galaxyline.nvim"
    -- use "kevinhwang91/nvim-hlslens"

    -- Styles
    use "tjdevries/colorbuddy.vim"
    use "tjdevries/gruvbuddy.nvim"

    -- Tree-sitter
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use "nvim-treesitter/playground"
  end
)
