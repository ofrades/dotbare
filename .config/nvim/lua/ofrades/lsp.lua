require("lspkind").init()
require "ofrades.completion"
require "ofrades.servers"
require "ofrades.efm"
require("nlspsettings").setup()

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics,
	{
		underline = true,
		virtual_text = { spacing = 4, prefix = "●" },
		update_in_insert = false,
	}
)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "single",
})

local signs = {
	Error = " ",
	Warning = " ",
	Hint = " ",
	Information = " ",
}

for type, icon in pairs(signs) do
	local hl = "LspDiagnosticsSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
