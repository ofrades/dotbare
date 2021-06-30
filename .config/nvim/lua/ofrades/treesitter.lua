require("nvim-treesitter.configs").setup {
	ensure_installed = "all",
	highlight = {
		enable = true,
	},
	incremental_selection = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
	context_commentstring = {
		enable = true,
	},
	rainbow = {
		enable = true,
		extended_mode = true,
	},
}
