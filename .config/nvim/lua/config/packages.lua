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
			vim.g.startify_files_number = 3
			vim.g.startify_skiplist = { "COMMIT_EDITMSG" }

			vim.g.startify_custom_footer = { "Beauty will save the world! ><(((*>" }
		end,
	}
	use {
		"hoob3rt/lualine.nvim",
		event = "VimEnter",
		config = function()
			require "config.lualine"
		end,
	}
	use {
		"folke/tokyonight.nvim",
		opt = true,
		event = "VimEnter",
		config = function()
			require "config.theme"
		end,
	}
	use {
		"kyazdani42/nvim-web-devicons",
		opt = true,
		event = "VimEnter",
		module = "nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup()
		end,
	}
	use {
		"tamago324/lir.nvim",
		opt = true,
		event = "VimEnter",
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
			require "config.explorer"
		end,
	}
	use {
		"neovim/nvim-lspconfig",
		event = "BufRead",
		wants = "nvim-lspinstall",
		requires = {
			{ "kabouzeid/nvim-lspinstall", event = "BufRead" },
			{ "jose-elias-alvarez/null-ls.nvim", filetype = {
				"html",
				"css",
				"json",
				"yaml",
				"markdown",
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"lua",
			} },
			{
				"jose-elias-alvarez/nvim-lsp-ts-utils",
				filetype = {
					"javascript",
					"javascriptreact",
					"typescript",
					"typescriptreact",
				},
			},
			{ "ray-x/lsp_signature.nvim" },
			{ "nvim-lua/lsp-status.nvim" },
			{ "folke/lua-dev.nvim", filetype = "lua" },
		},
		config = function()
			require "config.lsphandlers"
			require "config.lspservers"
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
		event = "VimEnter",
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
			require "config.telescope"
		end,
	}
	use {
		"lewis6991/gitsigns.nvim",
		opt = true,
		event = "BufRead",
		config = function()
			require "config.gitsigns"
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
				config = function()
					local cb = require("diffview.config").diffview_callback
					require("diffview").setup {
						diff_binaries = false,
						file_panel = {
							width = 35,
							use_icons = true,
						},
						key_bindings = {
							disable_defaults = false,
							view = {
								["<tab>"] = cb "select_next_entry",
								["<s-tab>"] = cb "select_prev_entry",
								["<leader>e"] = cb "focus_files",
								["<leader>b"] = cb "toggle_files",
							},
							file_panel = {
								["j"] = cb "next_entry",
								["<down>"] = cb "next_entry",
								["k"] = cb "prev_entry",
								["<up>"] = cb "prev_entry",
								["<cr>"] = cb "select_entry",
								["o"] = cb "select_entry",
								["<2-LeftMouse>"] = cb "select_entry",
								["-"] = cb "toggle_stage_entry",
								["S"] = cb "stage_all",
								["U"] = cb "unstage_all",
								["R"] = cb "refresh_files",
								["<tab>"] = cb "select_next_entry",
								["<s-tab>"] = cb "select_prev_entry",
								["<leader>e"] = cb "focus_files",
								["<leader>b"] = cb "toggle_files",
							},
						},
					}
				end,
			},
		},
		config = function()
			require "config.neogit"
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
		"tpope/vim-surround",
		opt = true,
		event = "BufRead",
	}
	use {
		"tpope/vim-repeat",
		opt = true,
		event = "BufRead",
	}
	use {
		"airblade/vim-rooter",
		opt = true,
		event = "BufRead",
		config = function()
			vim.g.rooter_patterns = { ".git", "package.json", "eslintrc.json" }
		end,
	}
	use { "mg979/vim-visual-multi", opt = true, event = "BufRead" }
	-- use { "psliwka/vim-smoothie", opt = true, event = "BufRead" }
	use {
		"karb94/neoscroll.nvim",
		opt = true,
		event = "BufRead",
		config = function()
			require("neoscroll").setup {
				mappings = {
					"<C-u>",
					"<C-d>",
					"<C-b>",
					"<C-f>",
					"<C-y>",
					"<C-e>",
					"zt",
					"zz",
					"zb",
					-- "gg",
					-- "G",
				},
			}
		end,
	}
	use { "rhysd/committia.vim" }
	use {
		"rrethy/vim-hexokinase",
		opt = true,
		run = "make hexokinase",
		event = "BufRead",
		config = function()
			vim.g.Hexokinase_highlighters = { "virtual" }
		end,
	}
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
				event = "BufRead",
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
			require "config.completion"
		end,
	}
	use {
		"mattn/emmet-vim",
		event = "BufRead",
		config = function()
			vim.g.emmet_install_global = 0
			-- vim.g.user_emmet_leader_key = ","
			vim.api.nvim_command "autocmd FileType html, css, javascriptreact, typescriptreact EmmetInstall"
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
		requires = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		config = function()
			require "config.treesitter"
		end,
	}
	use { "tweekmonster/startuptime.vim", cmd = "StartupTime" }
end)
