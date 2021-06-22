local exec = vim.api.nvim_command
local fn, cmd = vim.fn, vim.cmd

local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	exec("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
	exec("packadd packer.nvim")
end

-- Only required if you have packer in your `opt` pack
cmd([[packadd packer.nvim]])

-- Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:
cmd([[ autocmd BufWritePost ofrades.lua PackerCompile ]])

return require("packer").startup(function()
	-- Packer can manage itself as an optional plugin
	use({ "wbthomason/packer.nvim", opt = true }) -- package manager
	use("neovim/nvim-lspconfig") -- lsp configuration
	use("hrsh7th/nvim-compe") -- lsp completion
	use("kabouzeid/nvim-lspinstall") -- easy lsp installs
	use("onsails/lspkind-nvim")
	use("jose-elias-alvarez/nvim-lsp-ts-utils")
	use("jose-elias-alvarez/null-ls.nvim")
	use("tamago324/nlsp-settings.nvim")
	use("ray-x/lsp_signature.nvim")
	use({ "nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
		},
	})
  use {'kevinhwang91/nvim-hlslens'}

  use ({ 'phaazon/hop.nvim', as = 'hop', config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
  end })
	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim")
	use("folke/lua-dev.nvim")
	use({ "folke/lsp-trouble.nvim", config = function()
		require("trouble").setup({})
	end })
	use({ "folke/which-key.nvim", config = function()
		require("which-key").setup({})
	end })
	use({ "folke/todo-comments.nvim", config = function()
		require("todo-comments").setup({})
	end })
	use({ "TimUntersberger/neogit", config = function()
		require("neogit").setup()
	end }) -- Magit
	use({ "lewis6991/gitsigns.nvim", config = function()
		require("gitsigns").setup()
	end }) -- git signs
	use("rhysd/committia.vim") -- More Pleasant Editing on Commit Message
	use("sindrets/diffview.nvim") -- tree like git diff
	use("tpope/vim-commentary") -- comments
	use("JoosepAlviste/nvim-ts-context-commentstring") -- comments with context
	use("kevinhwang91/nvim-bqf") -- better quickfix
	use("mhinz/vim-startify") -- startup screen
	use("mg979/vim-visual-multi") -- select multiple words under cursor
	use("psliwka/vim-smoothie") -- select multiple words under cursor
  -- use({"karb94/neoscroll.nvim", config = function ()
  --   require("neoscroll").setup()
  -- end })
	use("windwp/nvim-spectre") -- search and replace
	use("L3MON4D3/LuaSnip")
	use("hrsh7th/vim-vsnip")
	use("hrsh7th/vim-vsnip-integ")
	use("dsznajder/vscode-es7-javascript-react-snippets")
	use("xabikos/vscode-javascript")
	use("burkeholland/simple-react-snippets")
	use("mlaursen/vim-react-snippets")
	use("abusaidm/html-snippets")
	use({ "rrethy/vim-hexokinase", run = "make hexokinase" }) -- show colors
	use({ "kyazdani42/nvim-web-devicons", config = function()
		require("nvim-web-devicons").setup()
	end })
	use("tjdevries/express_line.nvim") --statusline
	use("nvim-lua/lsp-status.nvim") -- statuline
	use("eddyekofo94/gruvbox-flat.nvim") -- theme
	use("tamago324/lir.nvim") -- tree project view
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/playground") -- to check syntax under cursor
end)
