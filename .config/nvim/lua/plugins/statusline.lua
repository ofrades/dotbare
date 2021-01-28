local cmd = vim.cmd
local fn = vim.fn
local gl = require("galaxyline")
local section = gl.section
gl.short_line_list = {"LuaTree", "packager", "Floaterm", "coc-eplorer"}

local colors = {
  bg = "#444444",
  fg = "#81a1c1",
  line_bg = "#444444",
  yellow = "#d9bb80",
  cyan = "#60C1D2",
  darkblue = "#6173D1",
  green = "#4CA585",
  orange = "#D88E78",
  purple = "##d3a0bc",
  magenta = "#d16d9e",
  gray = "#c0c0c0",
  blue = "#609AD2",
  red = "#CF7357"
}

local buffer_not_empty = function()
  if fn.empty(fn.expand("%:t")) ~= 1 then
    return true
  end
  return false
end

section.left[1] = {
  FirstElement = {
    -- provider = function() return '▊ ' end,
    provider = function()
      return "  "
    end,
    highlight = {colors.blue, colors.line_bg}
  }
}
section.left[2] = {
  ViMode = {
    provider = function()
      -- auto change color according the vim mode
      local mode_color = {
        n = colors.green,
        i = colors.blue,
        v = colors.yellow,
        [""] = colors.yellow,
        V = colors.yellow,
        c = colors.red,
        no = colors.magenta,
        s = colors.orange,
        S = colors.orange,
        [""] = colors.orange,
        ic = colors.yellow,
        R = colors.purple,
        Rv = colors.purple,
        cv = colors.red,
        ce = colors.red,
        r = colors.cyan,
        rm = colors.cyan,
        ["r?"] = colors.cyan,
        ["!"] = colors.red,
        t = colors.red
      }
      cmd("hi GalaxyViMode guifg=" .. mode_color[fn.mode()])
      return "  ofrades "
    end,
    highlight = {colors.red, colors.line_bg, "bold"}
  }
}
section.left[3] = {
  FileIcon = {
    provider = "FileIcon",
    condition = buffer_not_empty,
    highlight = {require("galaxyline.provider_fileinfo").get_file_icon_color, colors.line_bg}
  }
}
section.left[4] = {
  FileName = {
    -- provider = "FileName",
    provider = function()
      return fn.expand("%:f")
    end,
    condition = buffer_not_empty,
    separator = " ",
    separator_highlight = {colors.purple, colors.bg},
    highlight = {colors.purple, colors.line_bg, "bold"}
  }
}

section.right[1] = {
  GitIcon = {
    provider = function()
      return " "
    end,
    condition = require("galaxyline.provider_vcs").check_git_workspace,
    highlight = {colors.orange, colors.line_bg}
  }
}
section.right[2] = {
  GitBranch = {
    provider = "GitBranch",
    condition = require("galaxyline.provider_vcs").check_git_workspace,
    separator_highlight = {colors.purple, colors.bg},
    highlight = {colors.orange, colors.line_bg, "bold"}
  }
}

local checkwidth = function()
  local squeeze_width = fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end

section.right[3] = {
  DiffAdd = {
    provider = "DiffAdd",
    condition = checkwidth,
    icon = " ",
    highlight = {colors.green, colors.line_bg}
  }
}
section.right[4] = {
  DiffModified = {
    provider = "DiffModified",
    condition = checkwidth,
    icon = "柳",
    highlight = {colors.yellow, colors.line_bg}
  }
}
section.right[5] = {
  DiffRemove = {
    provider = "DiffRemove",
    condition = checkwidth,
    icon = " ",
    highlight = {colors.red, colors.line_bg}
  }
}

section.right[6] = {
  LineInfo = {
    provider = "LineColumn",
    separator = "",
    separator_highlight = {colors.blue, colors.line_bg},
    highlight = {colors.fg, colors.line_bg}
  }
}
-- section.right[7] = {
--   FileSize = {
--     provider = "FileSize",
--     separator = " ",
--     condition = buffer_not_empty,
--     separator_highlight = {colors.blue, colors.line_bg},
--     highlight = {colors.fg, colors.line_bg}
--   }
-- }

section.right[8] = {
  DiagnosticError = {
    provider = "DiagnosticError",
    -- separator = " ",
    icon = "   ",
    highlight = {colors.red, colors.line_bg},
    separator_highlight = {colors.bg, colors.bg}
  }
}
section.right[9] = {
  DiagnosticWarn = {
    provider = "DiagnosticWarn",
    -- separator = " ",
    icon = "   ",
    highlight = {colors.yellow, colors.line_bg},
    separator_highlight = {colors.bg, colors.bg}
  }
}

section.right[10] = {
  DiagnosticInfo = {
    -- separator = " ",
    provider = "DiagnosticInfo",
    icon = "   ",
    highlight = {colors.green, colors.line_bg},
    separator_highlight = {colors.bg, colors.bg}
  }
}

section.right[11] = {
  DiagnosticHint = {
    provider = "DiagnosticHint",
    -- separator = " ",
    icon = "   ",
    highlight = {colors.blue, colors.line_bg},
    separator_highlight = {colors.bg, colors.bg}
  }
}




