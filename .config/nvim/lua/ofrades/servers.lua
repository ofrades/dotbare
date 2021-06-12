local nvim_lsp = require("lspconfig")
local luadev = require("lua-dev").setup({})
require("lspinstall").setup()

local function setup_formatting(bufnr)
	local opts = { noremap = true, silent = true }
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>F", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
	vim.api.nvim_command("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
end

local function setup_async_formatting(bufnr)
	local opts = { noremap = true, silent = true }
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>F", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
	-- Use asynchronous formatting from null-ls
	vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")
end

local on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	local opts = { noremap = true, silent = true }
	buf_set_keymap("n", "<leader>lD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "<leader>ld", ":Telescope lsp_definitions<CR>", opts)
	buf_set_keymap("n", "<leader>lh", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", "<leader>li", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_set_keymap("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	buf_set_keymap("n", "<leader>lt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	buf_set_keymap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap("n", "<leader>lR", ":Telescope lsp_references<CR>", opts)
	buf_set_keymap("n", "<leader>lS", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
	buf_set_keymap("n", "<leader>l[", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
	buf_set_keymap("n", "<leader>l]", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
	buf_set_keymap("n", "<leader>lq", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
	buf_set_keymap("n", "<leader>la", ":Telescope lsp_code_actions<CR>", opts)
	buf_set_keymap("n", "<leader>lA", ":Telescope lsp_range_code_actions<CR>", opts)

	if client.resolved_capabilities.document_formatting then
		setup_formatting(bufnr)
	end
	if client.resolved_capabilities.document_range_formatting then
		buf_set_keymap("v", "<leader>F", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
	end

	if client.resolved_capabilities.document_highlight then
		vim.api.nvim_exec(
			[[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
			false
		)
	end

	require("lsp_signature").on_attach()
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.codeLens = {
	dynamicRegistration = false,
}
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = {
		"documentation",
		"detail",
		"additionalTextEdits",
	},
}

local null_ls = require("null-ls")
local null_ls_sources = {
	null_ls.builtins.formatting.prettier,
	null_ls.builtins.formatting.stylua,
	null_ls.builtins.diagnostics.write_good,
	null_ls.builtins.code_actions.gitsigns,
}
null_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	sources = null_ls_sources,
})
-- Manually add formatting on save for file types that do not have their own LSPs
vim.cmd("autocmd BufWritePost *.html,*.json,*.md,*.css,*.yml,*.yaml lua vim.lsp.buf.formatting()")

local function attach_tsserver(client, bufnr)
	-- Disable tsserver formatting, use prettierd from null-ls inside ts-utils
	client.resolved_capabilities.document_formatting = false
	on_attach(client, bufnr)
	setup_async_formatting(bufnr)

	local ts_utils = require("nvim-lsp-ts-utils")
	ts_utils.setup({
		enable_import_on_completion = true,
		eslint_bin = "eslint_d",
		eslint_enable_diagnostics = true,
		eslint_enable_code_actions = true,
		complete_parens = true,
		signature_help_in_parens = true,
		update_imports_on_move = true,
		require_confirmation_on_move = true,
	})
	ts_utils.setup_client(client)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lo", ":TSLspOrganize<CR>", { silent = true })
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lf", ":TSLspFixCurrent<CR>", { silent = true })
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lF", ":TSLspRenameFile<CR>", { silent = true })
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lI", ":TSLspImportAll<CR>", { silent = true })
end

-- server names from lspinstall
nvim_lsp.bash.setup({ on_attach = on_attach, capabilities = capabilities })
nvim_lsp.html.setup({ on_attach = on_attach, capabilities = capabilities })
nvim_lsp.css.setup({ on_attach = on_attach, capabilities = capabilities })
nvim_lsp.json.setup({ on_attach = on_attach, capabilities = capabilities })
nvim_lsp.kotlin.setup({ on_attach = on_attach, capabilities = capabilities })
nvim_lsp.rust.setup({ on_attach = on_attach, capabilities = capabilities })
nvim_lsp.typescript.setup({ on_attach = attach_tsserver, capabilities = capabilities })
nvim_lsp.lua.setup(luadev)
