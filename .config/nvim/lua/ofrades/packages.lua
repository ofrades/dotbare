local install_path = vim.fn.stdpath "data"
	.. "/site/pack/packer/opt/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.api.nvim_command(
		"!git clone https://github.com/wbthomason/packer.nvim " .. install_path
	)
	vim.api.nvim_command "packadd packer.nvim"
end

-- if using packer with opt
vim.cmd [[ packadd packer.nvim ]]

-- sync when this file is changed
vim.cmd [[ autocmd BufWritePost packages.lua PackerSync ]]

return require("packer").startup(function()
	use { "wbthomason/packer.nvim", opt = true }
	use {
		"mhinz/vim-startify",
		opt = true,
		event = "VimEnter",
		config = function()
			vim.g.startify_commands = {
				{ o = { "Recent Files", ":Telescope oldfiles hidden=true" } },
				{ p = { "Find Files", ":Telescope find_files hidden=true" } },
				{ b = { "File Browser", ":Telescope file_browser" } },
				{ t = { "Telescope builtin", ":Telescope" } },
				{ g = { "Git", ":Neogit" } },
				{ n = { "Nvim Files", ":lua TelescopeDotfiles()" } },
				{ z = { "Notes", ":lua TelescopeNotes()" } },
				{ s = { "Packer Sync", ":PackerSync" } },
			}

			vim.g.startify_enable_special = 0
			vim.g.startify_files_number = 3
			vim.g.startify_relative_path = 1
			vim.g.startify_change_to_dir = 1
			vim.g.startify_update_oldfiles = 1
			vim.g.startify_session_autoload = 1
			vim.g.startify_session_persistence = 1
			vim.g.startify_skiplist = { "COMMIT_EDITMSG" }

			vim.g.startify_custom_footer = { "Beauty will save the world! ><(((*>" }
		end,
	}
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
		requires = {
			{
				"tamago324/lir-git-status.nvim",
				config = function()
					require("lir.git_status").setup {
						show_ignored = false,
					}
				end,
			},
		},
		config = function()
			require "ofrades.explorer"
		end,
	}
	use {
		"neovim/nvim-lspconfig",
		event = "BufRead",
		requires = {
			{ "kabouzeid/nvim-lspinstall" },
			{ "jose-elias-alvarez/null-ls.nvim" },
			{ "jose-elias-alvarez/nvim-lsp-ts-utils" },
			{ "ray-x/lsp_signature.nvim" },
			{ "nvim-lua/lsp-status.nvim" },
			{ "folke/lua-dev.nvim" },
		},
		config = function()
			require "ofrades.lsphandlers"
			require "ofrades.lspservers"
		end,
	}
	use {
		"tamago324/nlsp-settings.nvim",
		opt = true,
		event = "BufRead",
		wants = "nvim-lspconfig",
		config = function()
			require("nlspsettings").setup()
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
		config = function()
			vim.g.Hexokinase_highlighters = { "virtual" }
		end,
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
		event = "VimEnter",
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
			require("orgmode").setup {
				org_agenda_files = { "~/notes/*" },
				org_default_notes_file = "~/notes/refile.org",
				mappings = {
					global = {
						org_agenda = "<leader>oa",
						org_capture = "<leader>oc",
					},
				},
			}
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
					require("luasnip").config.set_config {
						history = true,
						updateevents = "TextChanged,TextChangedI",
					}
					require("luasnip/loaders/from_vscode").load()
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
