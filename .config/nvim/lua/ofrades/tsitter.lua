require "nvim-treesitter.configs".setup {
  -- ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true -- false will disable the whole extension
  },
  incremental_selection = {
    enable = true
  },
  indent = {
    enable = true
  },
  autotag = {
    enable = true
  },
  context_commentstring = {
    enable = true,
    config = {
      vue = {
        style_element = "// %s"
      }
    }
  },
  rainbow = {
    enable = true,
    extended_mode = true
  }
}
