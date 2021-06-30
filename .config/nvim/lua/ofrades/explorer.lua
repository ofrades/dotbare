local actions = require "lir.actions"
local mark_actions = require "lir.mark.actions"
local clipboard_actions = require "lir.clipboard.actions"

require("lir").setup {
	show_hidden_files = true,
	devicons_enable = true,
	mappings = {
		["<C-s>"] = actions.split,
		["<C-v>"] = actions.vsplit,
		["<C-t>"] = actions.tabedit,
		["l"] = actions.edit,
		["<CR>"] = actions.edit,
		["h"] = actions.up,
		["q"] = actions.quit,
		["<esc>"] = actions.quit,
		["A"] = actions.mkdir,
		["<Tab>"] = function()
			mark_actions.toggle_mark()
		end,
		["a"] = actions.newfile,
		["d"] = actions.delete,
		["r"] = actions.rename,
		["@"] = actions.cd,
		["Y"] = actions.yank_path,
		["."] = actions.toggle_show_hidden,
		["y"] = clipboard_actions.copy,
		["c"] = clipboard_actions.cut,
		["p"] = clipboard_actions.paste,
	},
	float = {
		winblend = 0,
	},
	hide_cursor = true,
}
