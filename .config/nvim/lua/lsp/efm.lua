local util = require "lspconfig/util"
local lspconfig = require"lspconfig"

local eslint_d = {
  lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
  lintIgnoreExitCode = true,
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"},
}

lspconfig.efm.setup {
  root_dir = util.root_pattern(".git", vim.fn.getcwd()),
  init_options = {
    documentFormatting = true,
    codeAction = true
  },
  filetypes = {
    "javascript",
    "typescript",
    "typescriptreact",
    "javascriptreact",
    -- "vue",
    "lua",
    "elixir",
    "css",
    "html"
    },
  init_options = {
    documentFormatting = true,
    codeAction = true
  },
  settings = {
    rootMarkers = {".eslintrc", "package.json", ".git/"},
    languages = {
      typescript = {eslint_d},
      javascript = {eslint_d},
      javascriptreact = {eslint_d},
      typescriptreact = {eslint_d},
    }
  }
}

