local util = require "lspconfig/util"

local eslint_d = {
  lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
  lintIgnoreExitCode = true,
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"},
}

require "lspconfig".efm.setup {
    init_options = {
      documentFormatting = true,
      codeAction = true,
    },
    root_dir = util.root_pattern(".git", vim.fn.getcwd()),
    settings = {
      rootMarkers = {".eslintrc", "package.json", ".git/"},
      languages = {
        lua = {
          {formatCommand = "lua-format -i", formatStdin = true}
        },
        typescript = {eslint_d},
        javascript = {eslint_d},
        javascriptreact = {eslint_d},
        typescriptreact = {eslint_d},
      }
    },
    filetypes = {
      "javascript",
      "typescript",
      "typescriptreact",
      "javascriptreact",
      "css",
      "html"
    },
}
