require'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    highlight = {
        enable = true
    },
    incremental_selection = {
        enable = true,
    },
    rainbow = {
        enable = true,
    },
    indent = {
        enable = true
  },
}
-- disable hl for brackets to allow use of rainbow
require('nvim-treesitter.highlight')
local hlmap = vim.treesitter.highlighter.hl_map
--Misc
hlmap.error = nil
hlmap["punctuation.delimiter"] = "Delimiter"
hlmap["punctuation.bracket"] = nil
