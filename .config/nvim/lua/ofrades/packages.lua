local exec = vim.api.nvim_command
local fn, cmd = vim.fn, vim.cmd

local install_path = fn.stdpath "data" .. "/site/pack/packer/opt/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	exec("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
	exec "packadd packer.nvim"
end

-- Only required if you have packer in your `opt` pack
cmd [[packadd packer.nvim]]

-- Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:
cmd [[ autocmd BufWritePost ofrades.lua PackerCompile ]]

return require("packer").startup(function()
	-- Packer can manage itself as an optional plugin
	use { "wbthomason/packer.nvim", opt = true }
	use "neovim/nvim-lspconfig"
	use "hrsh7th/nvim-compe"
	use "kabouzeid/nvim-lspinstall"
	use "onsails/lspkind-nvim"
	use "jose-elias-alvarez/nvim-lsp-ts-utils"
	use "jose-elias-alvarez/null-ls.nvim"
	use "tamago324/nlsp-settings.nvim"
	use "ray-x/lsp_signature.nvim"
	use { "nvim-telescope/telescope.nvim", requires = {
		{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
	} }
	use { "kevinhwang91/nvim-hlslens" }

	use {
		"phaazon/hop.nvim",
		as = "hop",
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("hop").setup { keys = "etovxqpdygfblzhckisuran" }
		end,
	}
	use "nvim-lua/popup.nvim"
	use "nvim-lua/plenary.nvim"
	use "folke/lua-dev.nvim"
	use {
		"folke/lsp-trouble.nvim",
		config = function()
			require("trouble").setup {}
		end,
	}
	use {
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup {}
		end,
	}
	use {
		"folke/todo-comments.nvim",
		config = function()
			require("todo-comments").setup {}
		end,
	}
	use {
		"timuntersberger/neogit",
		config = function()
			require("neogit").setup()
		end,
	}
	use {
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	}
	use "rhysd/committia.vim"
	use "airblade/vim-rooter"
	use { "lukas-reineke/indent-blankline.nvim", branch = "lua" }
	use "sindrets/diffview.nvim"
	use "tpope/vim-commentary"
	use "JoosepAlviste/nvim-ts-context-commentstring"
	use "kevinhwang91/nvim-bqf"
	use "mhinz/vim-startify"
	use "mg979/vim-visual-multi"
	use "psliwka/vim-smoothie"
	use "windwp/nvim-spectre"
	use "L3MON4D3/LuaSnip"
	use "hrsh7th/vim-vsnip"
	use "hrsh7th/vim-vsnip-integ"
	use "dsznajder/vscode-es7-javascript-react-snippets"
	use "xabikos/vscode-javascript"
	use "burkeholland/simple-react-snippets"
	use "mlaursen/vim-react-snippets"
	use "abusaidm/html-snippets"
	-- use { "rrethy/vim-hexokinase", run = "make hexokinase" }
	use {
		"kyazdani42/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup()
		end,
	}
	use "tjdevries/express_line.nvim"
	use "nvim-lua/lsp-status.nvim"
	use "eddyekofo94/gruvbox-flat.nvim"
	use "tamago324/lir.nvim"
	use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
	use "nvim-treesitter/playground"

	-- TODO: try this packages
	-- use { 'vhyrro/neorg', config = function()
	--   require('neorg').setup {}
	-- end}
	-- use({"karb94/neoscroll.nvim", config = function ()
	--   require("neoscroll").setup()
	-- end })
end)
