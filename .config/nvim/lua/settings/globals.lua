local g = vim.g
local cmd = vim.cmd
local apply_globals = require "settings.utils".apply_globals

cmd "filetype plugin indent on"

-- cmd('')

apply_globals(
  {
    ultest_icons = 1,
    gitblame_enabled = 0,
    gitblame_message_template = "     <author> • <summary> • <date>",
    lengthmatters_highlight_one_column = 1,
    python_host_prog = "/usr/bin/python",
    python3_host_prog = "/usr/bin/python",
    -- coc_config_file="$HOME/.config/nvim/lua/coc/coc-settings.json",
    jsx_ext_required = 1,
    javascript_plugin_flow = 1,
    javascript_plugin_jsdoc = 1,
    -- Completion.nvim
    completion_confirm_key = "",
    completion_enable_auto_signature = 1,
    completion_enable_auto_hover = 1,
    completion_trigger_keyword_length = 2,
    completion_matching_ignore_case = 1,
    completion_auto_change_source = 1,
    UltiSnipsExpandTrigger='<tab>',
    UltiSnipsJumpForwardTrigger='<c-j>',
    UltiSnipsJumpBackwardTrigger='<c-k>',
    completion_enable_snippet = "vim-vsnip",
    completion_matching_strategy_list = {"exact", "substring", "fuzzy"},
    -- completion_sorting = "none",
    completion_customize_lsp_label = {
      Function = " [function]",
      Method = " [method]",
      Reference = " [refrence]",
      Enum = " [enum]",
      Field = "ﰠ [field]",
      Keyword = " [key]",
      Variable = " [variable]",
      Folder = " [folder]",
      Snippet = " [snippet]",
      UltiSnips = " [snippet]",
      ["vim-vsnip"] = " [snippet]",
      Operator = " [operator]",
      Module = " [module]",
      Text = "ﮜ [text]",
      Class = " [class]",
      Interface = " [interface]",
      File = " [file]"
    },
    completion_items_priority = {
        Field = 5,
        Function = 7,
        Module = 7,
        Variables = 7,
        Method = 9,
        Interfaces = 5,
        Constant = 5,
        Class = 8,
        Keyword = 4,
        UltiSnips = 10,
        ["vim-vsnip"] = 10,
        Buffers = 1,
        TabNine = 0,
        File = 0
    },
    -- Improve startup
    loaded_gzip = 1,
    loaded_tar = 1,
    loaded_tarPlugin = 1,
    loaded_zip = 1,
    loaded_zipPlugin = 1,
    loaded_getscript = 1,
    loaded_getscriptPlugin = 1,
    loaded_vimball = 1,
    loaded_vimballPlugin = 1,
    loaded_matchit = 1,
    loaded_matchparen = 0,
    loaded_2html_plugin = 1,
    loaded_logiPat = 1,
    loaded_rrhelper = 1,
    loaded_netrw = 1,
    loaded_netrwPlugin = 1,
    loaded_netrwSettings = 1,
    loaded_netrwFileHandlers = 1
  }
)
