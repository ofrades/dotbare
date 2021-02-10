local util = require "lspconfig/util"
local lspconfig = require"lspconfig"

local eslint_d = {
  lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
  lintIgnoreExitCode = true,
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"},
}

lspconfig.efm.setup {
  root_dir = function(fname)
    return util.root_pattern("tsconfig.json")(fname) or
    util.root_pattern(".eslintrc","package.json", ".git")(fname);
  end,
  filetypes = {
      "javascript",
      "typescript",
      "typescriptreact",
      "javascriptreact",
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

