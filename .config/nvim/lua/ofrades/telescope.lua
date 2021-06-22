local finders = require "telescope.builtin"
local actions = require "telescope.actions"
local telescope = require "telescope"
local trouble = require "trouble.providers.telescope"

require("telescope").load_extension "fzf"

telescope.setup {
	defaults = {
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		},
		layout_strategy = "flex",
		layout_defaults = {
			horizontal = {
				-- mirror = true,
				scroll_speed = 1,
			},
			vertical = {
				-- mirror = false,
				scroll_speed = 1,
			},
		},
		mappings = {
			i = {
				["<esc>"] = actions.close,
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<c-t>"] = trouble.open_with_trouble,
			},
			n = { ["<c-t>"] = trouble.open_with_trouble },
		},
		file_ignore_patterns = { ".git/*", "node-modules" },
		color_devicons = true,
		file_sorter = require("telescope.sorters").get_fuzzy_file,
		generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
	},
	extensions = {
		fzf = {
			override_generic_sorter = false, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
	},
}

function TelescopeDotfiles()
	require("telescope.builtin").find_files {
		prompt_title = "Neovim files",
		cwd = "~/.config/nvim/",
	}
end

function TelescopeNotes()
	require("telescope.builtin").file_browser {
		prompt_title = "Notes",
		cwd = "~/notes",
	}
end
