local util = require "lspconfig/util"
local lspconfig = require"lspconfig"

lspconfig.diagnosticls.setup{
  filetypes = {"javascript", "typescript", "javascriptreact", "typescriptreact"},
  root_dir = function(fname)
    return util.root_pattern("tsconfig.json")(fname) or
    util.root_pattern(".eslintrc.js", ".git", "package.json")(fname);
  end,
  init_options = {
    linters = {
      eslint = {
      command = "./node_modules/.bin/eslint",
      rootPatterns = {".eslintrc.js", ".git", "package.json"},
      debounce = 100,
      args = {
        "--stdin",
        "--stdin-filename",
        "%filepath",
        "--format",
        "json"
      },
      sourceName = "eslint",
      parseJson = {
        errorsRoot = "[0].messages",
        line = "line",
        column = "column",
        endLine = "endLine",
        endColumn = "endColumn",
        message = "[eslint] ${message} [${ruleId}]",
        security = "severity"
      },
      securities = {
        [2] = "error",
        [1] = "warning"
      }
    },
    stylelint = {
      command = "./node_modules/.bin/stylelint",
      rootPatterns = {".git"},
      debounce = 100,
      args = {
        "--formatter",
        "json",
        "--stdin-filename",
        "%filepath"
      },
      sourceName = "stylelint",
      parseJson = {
        errorsRoot = "[0].warnings",
        line = "line",
        column = "column",
        message = "${text}",
        security = "severity"
      },
      securities = {
        error = "error",
        warning = "warning"
      }
    },
  },
  filetypes = {
    javascript = "eslint",
    javascriptreact = "eslint",
    typescript = "eslint",
    typescriptreact = "eslint"
  }, ]]

  -- formatters = {
      -- eslint = {
        -- command = "./node_modules/.bin/eslint",
        -- args = {"--fix-to-stduot", "--stdin", "%filepath"},
        -- rootPatterns = {".eslintrc.js", ".git", "package.json"},
        -- debounce = 100,
      -- },
      -- luafmt = {
        -- command = "npx luafmt",
        -- args = {"--indent-count", 2, "--stdin"}
      -- },
      -- prettier = {
        -- command = "./node_modules/.bin/prettier",
        -- args = {"--stdin"},
        -- rootPatterns = {".prettierrc", ".git", "package.json"},
      -- },
    -- },
    -- formatFiletypes = {
      -- lua = "luafmt",
      -- javascript = "prettier",
      -- javascriptreact = "prettier",
      -- typescript = "prettier",
      -- typescriptreact = "prettier"
    -- },
  }
}
