require("compe").setup {
	enabled = true,
	autocomplete = true,
	debug = false,
	min_length = 1,
	preselect = "enable",
	throttle_time = 80,
	source_timeout = 200,
	incomplete_delay = 400,
	max_abbr_width = 100,
	max_kind_width = 100,
	max_menu_width = 100,
	documentation = true,
	source = {
		path = true,
		buffer = true,
		calc = true,
		nvim_lsp = true,
		nvim_lua = true,
		tabnine = true,
		spell = true,
		treesitter = true,
		tags = true,
		emoji = true,
		luasnip = true,
		orgmode = true,
	},
}

local t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
	local col = vim.fn.col "." - 1
	if col == 0 or vim.fn.getline("."):sub(col, col):match "%s" then
		return true
	else
		return false
	end
end

local function prequire(...)
	local status, lib = pcall(require, ...)
	if status then
		return lib
	end
	return nil
end

local luasnip = prequire "luasnip"

-- Use Tab / S-Tab to:
-- move to prev/next item in completion menuone
-- jump to prev/next snippet's placeholder
_G.tab_complete = function()
	if vim.fn.pumvisible() == 1 then
		return t "<C-n>"
	elseif luasnip and luasnip.expand_or_jumpable() then
		return t "<Plug>luasnip-expand-or-jump"
	elseif check_back_space() then
		return t "<Tab>"
	else
		return vim.fn["compe#complete"]()
	end
end
_G.s_tab_complete = function()
	if vim.fn.pumvisible() == 1 then
		return t "<C-p>"
	elseif luasnip and luasnip.jumpable(-1) then
		return t "<Plug>luasnip-jump-prev"
	else
		return t "<S-Tab>"
	end
end
_G.enter_complete = function()
	if luasnip and luasnip.choice_active() then
		return t "<Plug>luasnip-next-choice"
	end
	return vim.fn["compe#confirm"](t "<CR>")
end

local opts = { silent = true, expr = true }
vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", opts)
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", opts)
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", opts)
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", opts)
vim.api.nvim_set_keymap("i", "<C-e>", [[compe#close('<C-e>')]], opts)
vim.api.nvim_set_keymap("i", "<CR>", "v:lua.enter_complete()", opts)
vim.api.nvim_set_keymap(
	"s",
	"<CR>",
	'<cmd>lua require("luasnip").expand_or_jumpable()<CR>',
	{}
)
vim.api.nvim_set_keymap("i", "<C-Space>", [[compe#complete()]], opts)

-- thanks to folke: https://github.com/hrsh7th/nvim-compe/issues/302#issuecomment-821100317
local helper = require "compe.helper"
helper.convert_lsp_orig = helper.convert_lsp
helper.convert_lsp = function(args)
	local response = args.response or {}
	local items = response.items or response
	for _, item in ipairs(items) do
		if
			item.insertText == nil
			and (item.kind == 2 or item.kind == 3 or item.kind == 4)
		then
			item.insertText = item.label .. "(${1})"
			item.insertTextFormat = 2
		end
	end
	return helper.convert_lsp_orig(args)
end
