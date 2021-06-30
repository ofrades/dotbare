local null_ls = require "null-ls"
local null_ls_sources = {
	null_ls.builtins.formatting.prettier,
	null_ls.builtins.formatting.stylua,
	null_ls.builtins.diagnostics.write_good,
	null_ls.builtins.code_actions.gitsigns,
}
null_ls.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	sources = null_ls_sources,
}
