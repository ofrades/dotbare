local g = vim.g
local cmd = vim.cmd
local apply_globals = require "settings.utils".apply_globals

cmd "filetype plugin indent on"

apply_globals(
  {
    qs_highlight_on_keys = {"f", "F"},
    python_host_prog = "/usr/bin/python",
    python3_host_prog = "/usr/bin/python3",
    gitblame_enabled = 0,
    gitblame_message_template = "     <author> • <summary> • <date>",
    -- tagalong_additional_filetypes = {"javascript"},
    --[[ closetag_filetypes = "html,xhtml,phtml,html.handlebars,javascriptreact,typescriptreact",
    closetag_regions = {
      ["typescript.tsx"] = "jsxRegion,tsxRegion",
      ["javascript.jsx"] = "jsxRegion"
    }, ]]
    Hexokinase_highlighters = {"virtual"},
    -- snippets
    --[[ vsnip_filetypes = {},
    ["vsnip_filetypes.javascriptreact"] = {"javascript","typescript", "html", "css"},
    ["vsnip_filetypes.javascript"] = {"javascript", "typescript", "html", "css"},
    ["vsnip_filetypes.vue"] = {"vue", "javascript", "typescript", "css"},
    ["vsnip_filetypes.typescriptreact"] = {"javascript","typescript", "html", "css"}, ]]
    -- Improve startup
    loaded_gzip              = 1,
    loaded_tar               = 1,
    loaded_tarPlugin         = 1,
    loaded_zip               = 1,
    loaded_zipPlugin         = 1,
    loaded_getscript         = 1,
    loaded_getscriptPlugin   = 1,
    loaded_vimball           = 1,
    loaded_vimballPlugin     = 1,
    loaded_matchit           = 1,
    loaded_matchparen        = 1,
    loaded_2html_plugin      = 1,
    loaded_logiPat           = 1,
    loaded_rrhelper          = 1,
    loaded_netrw             = 1,
    loaded_netrwPlugin       = 1,
    loaded_netrwSettings     = 1,
    loaded_netrwFileHandlers = 1
  }
)
