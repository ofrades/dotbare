local map = require "settings.utils".map
local saga = require 'lspsaga'

local opts = {
  border_style = 2,
  -- max_hover_width = 80,
}
saga.init_lsp_saga(opts)

