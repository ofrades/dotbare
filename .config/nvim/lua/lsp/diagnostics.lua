local sign_define = vim.fn.sign_define
local lsp = vim.lsp
local util = require('lspconfig/util')

-- map("n", "'d", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", {})
-- map("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", {})
-- map("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", {})

lsp.handlers["textDocument/publishDiagnostics"] =
  lsp.with(
  lsp.diagnostic.on_publish_diagnostics,
  {
    underline = true,
    virtual_text = true,
    signs = true,
    update_in_insert = false
  }
)

sign_define(
  "LspDiagnosticsSignError",
  {
    text = " ",
    texthl = "LspDiagnosticsError"
  }
)

sign_define(
  "LspDiagnosticsSignWarning",
  {
    text = " ",
    texthl = "LspDiagnosticsWarning"
  }
)

sign_define(
  "LspDiagnosticsSignInformation",
  {
    text = " ",
    texthl = "LspDiagnosticsInformation"
  }
)

sign_define(
  "LspDiagnosticsSignHint",
  {
    text = " ",
    texthl = "LspDiagnosticsHint"
  }
)


 ---- NOTE: an efm config file prevents arror in log, only needs first line of: version:2
  --local eslint = {
  --  lintCommand = "./node_modules/.bin/eslint -f unix --stdin --stdin-filename ${INPUT}",
  --  lintIgnoreExitCode = true,
  --  lintStdin = true
  --}
  --
  --require "lspconfig".efm.setup {
  --  --cmd = {"efm-langserver", "-q"}, -- the `-q` prevents the  readng std in, printing stdout message
  --  init_options = {documentFormatting = true},
  --  filetypes = {"javascript", "typescript"},
  --  root_dir = function(fname)
  --    return util.root_pattern("tsconfig.json")(fname) or
  --    util.root_pattern(".eslintrc.js", ".git")(fname);
  --  end,
  --  init_options = {documentFormatting = true},
  --  settings = {
  --    rootMarkers = {".eslintrc.js", ".git/"},
  --    --logFile = "/home/alextylor/efm.log",
  --    --logLevel =  1,
  --    languages = {
  --      typescript = {eslint}
  --    }
  --  }
  --}

require'lspconfig'.diagnosticls.setup{
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
  },
  formatters = {
      eslint = {
        command = "./node_modules/.bin/eslint",
        args = {"--fix-to-stduot", "--stdin", "%filepath"},
        rootPatterns = {".eslintrc.js", ".git", "package.json"},
        debounce = 100,
      },
      luafmt = {
        command = "npx luafmt",
        args = {"--indent-count", 2, "--stdin"}
      },
      prettier = {
        command = "./node_modules/.bin/prettier",
        args = {"--stdin-filepath", "%filepath", "--single-quote", "--print-width 120"},
        rootPatterns = {".eslintrc.js", ".git", "package.json"},
      },
    },
    formatFiletypes = {
      lua = "luafmt",
      javascript = "prettier",
      javascriptreact = "prettier",
      typescript = "prettier",
      typescriptreact = "prettier"
    },
  }
}
