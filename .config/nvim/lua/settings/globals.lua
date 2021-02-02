local g = vim.g
local cmd = vim.cmd
local apply_globals = require "settings.utils".apply_globals

cmd "filetype plugin indent on"

-- cmd('')
-- cmd('let g:vsnip_filetypes = {}')
-- cmd('let g:vsnip_filetypes.javascriptreact = ["javascript"]')

apply_globals(
  {
    python_host_prog = "/usr/bin/python",
    python3_host_prog = "/usr/bin/python3",
    gitblame_enabled = 0,
    gitblame_message_template = "     <author> • <summary> • <date>",
    lengthmatters_highlight_one_column = 1,
    jsx_ext_required = 1,
    javascript_plugin_flow = 1,
    javascript_plugin_jsdoc = 1,
    tagalong_additional_filetypes = {"javascript"},
    closetag_filetypes = "html,xhtml,phtml,html.handlebars,javascriptreact,typescriptreact",
    closetag_regions = {
      ["typescript.tsx"] = "jsxRegion,tsxRegion",
      ["javascript.jsx"] = "jsxRegion"
    },
    -- emmet
    user_emmet_mode = 'i',
    user_emmet_leader_key = '<C-a>',
    user_emmet_expandabbr_key = '<C-a><C-a>',
    user_emmet_install_global = 0,
    user_emmet_install_command = 0,
    bufferline = {
      animation = false,
      maximum_padding = 0,
      icon_separator_active = "",
      icon_separator_inactive = ""
    },
    Hexokinase_highlighters = {"virtual"},
    lineletters_settings = {
      prefix_chars = {"t", "n"}
    },
    user_emmet_settings = {
      javascript = {
        extends = "jsx"
      }
    },
    -- snippets
    vsnip_filetypes = {},
    ["vsnip_filetypes.javascriptreact"] = {"javascript"},
    ["vsnip_filetypes.vue"] = {"vue", "javascript", "typescript"},
    ["vsnip_filetypes.typescriptreact"] = {"typescript"},
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
