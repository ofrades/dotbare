local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/opt/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.api.nvim_command("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
	vim.api.nvim_command "packadd packer.nvim"
end

vim.cmd [[ packadd packer.nvim ]]

return require("packer").startup(function()
	use { "wbthomason/packer.nvim", opt = true }
	use { "mhinz/vim-startify", opt = true, event = "VimEnter" }
	use {
		"tjdevries/express_line.nvim",
		opt = true,
		event = "VimEnter",
		wants = "lsp-status.nvim",
		config = function()
			require "ofrades.statusline"
		end,
	}
	use {
		"eddyekofo94/gruvbox-flat.nvim",
		opt = true,
		event = "VimEnter",
		config = function()
      vim.g.gruvbox_sidebars = {
        "qf",
        "terminal",
        "term",
        "packer",
        "lir",
        "DiffviewFiles",
      }
			vim.g.gruvbox_transparent = true
			vim.g.gruvbox_flat_style = "dark"
			vim.g.gruvbox_italic_functions = true
			vim.cmd "colorscheme gruvbox-flat"
		end,
	}
	use {
		"kyazdani42/nvim-web-devicons",
		opt = true,
		event = "VimEnter",
		config = function()
			require("nvim-web-devicons").setup()
		end,
	}
	use {
		"tamago324/lir.nvim",
		opt = true,
		event = "BufRead",
		config = function()
			require "ofrades.explorer"
		end,
	}
	use {
		"neovim/nvim-lspconfig",
		event = "BufRead",
		requires = {
			{ "jose-elias-alvarez/nvim-lsp-ts-utils" },
			{ "tamago324/nlsp-settings.nvim" },
			{ "ray-x/lsp_signature.nvim" },
			{ "nvim-lua/lsp-status.nvim" },
      { "kabouzeid/nvim-lspinstall" },
		},
		config = function()
      require("nlspsettings").setup()
      require("nlspsettings").setup()
      require("lspinstall").setup()
		end,
	}
			use { "jose-elias-alvarez/null-ls.nvim", opt = true, event = "BufRead",
		config = function()
			require "ofrades.null-ls"
		end,
    }
	use {
		"andymass/vim-matchup",
		opt = true,
		event = "CursorMoved",
		setup = function()
			vim.g.matchup_matchparen_offscreen = {
				method = "popup",
				fullwidth = true,
				highlight = "Normal",
			}
		end,
	}
	use {
		"nvim-telescope/telescope.nvim",
		event = "BufRead",
		wants = "trouble.nvim",
		requires = {
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				run = "make",
			},
			{ "nvim-lua/popup.nvim", module = "popup" },
			{ "nvim-lua/plenary.nvim", module = "plenary" },
		},
		config = function()
			require "ofrades.telescope"
		end,
	}
	use {
		"lewis6991/gitsigns.nvim",
		opt = true,
		event = "BufRead",
		config = function()
			require "ofrades.gitsigns"
		end,
	}
	use {
		"timuntersberger/neogit",
		opt = true,
		event = "BufRead",
		requires = {
			{
				"sindrets/diffview.nvim",
				cmd = {
					"DiffviewOpen",
					"DiffviewClose",
					"DiffviewToggleFiles",
					"DiffviewFocusFiles",
				},
			},
		},
		config = function()
			require "ofrades.neogit"
		end,
	}
	use {
		"windwp/nvim-spectre",
		event = "BufRead",
		opt = true,
		module = "spectre",
		wants = { "plenary.nvim", "popup.nvim" },
		requires = {
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
		},
	}
	use {
		"tpope/vim-commentary",
		opt = true,
		event = "BufRead",
	}
	use {
		"lukas-reineke/indent-blankline.nvim",
		opt = true,
		event = "BufRead",
		branch = "lua",
	}
	use { "airblade/vim-rooter", opt = true, event = "BufRead" }
	use { "mg979/vim-visual-multi", opt = true, event = "BufRead" }
	use { "psliwka/vim-smoothie", opt = true, event = "BufRead" }
	use { "rhysd/committia.vim", opt = true, event = "VimEnter" }
	use {
		"rrethy/vim-hexokinase",
		opt = true,
		run = "make hexokinase",
		event = "BufRead",
	}
	use { "ggandor/lightspeed.nvim", opt = true, event = "BufRead" }
	use {
		"folke/trouble.nvim",
		opt = true,
		event = "BufRead",
		cmd = { "TroubleToggle", "Trouble" },
		config = function()
			require("trouble").setup { auto_open = false }
		end,
	}
	use {
		"folke/which-key.nvim",
		opt = true,
		event = "BufRead",
		module = "which-key",
		config = function()
			require("which-key").setup {}
		end,
	}
	use {
		"folke/todo-comments.nvim",
		opt = true,
		event = "BufRead",
		cmd = { "TodoTrouble", "TodoTelescope" },
		config = function()
			require("todo-comments").setup {}
		end,
	}
	use {
		"kristijanhusak/orgmode.nvim",
		opt = true,
		event = "BufRead",
		config = function()
			require "ofrades.org"
		end,
	}
	use {
		"hrsh7th/nvim-compe",
		event = "InsertEnter",
		wants = "LuaSnip",
		requires = {
			"onsails/lspkind-nvim",
			{
				"tzachar/compe-tabnine",
				run = "./install.sh",
			},
			{
				"L3MON4D3/LuaSnip",
				event = "InsertCharPre",
				config = function()
					require "ofrades.snippets"
				end,
				requires = {
					"rafamadriz/friendly-snippets",
				},
			},
		},
		config = function()
			require "ofrades.completion"
		end,
	}
	use {
		"JoosepAlviste/nvim-ts-context-commentstring",
		opt = true,
		event = "BufRead",
	}
	use {
		"nvim-treesitter/nvim-treesitter",
		opt = true,
		event = "BufRead",
		run = ":TSUpdate",
		config = function()
			require "ofrades.treesitter"
		end,
	}
	use { "tweekmonster/startuptime.vim", cmd = "StartupTime" }
end)
