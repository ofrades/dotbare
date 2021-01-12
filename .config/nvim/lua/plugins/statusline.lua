local cmd = vim.cmd
local fn = vim.fn
local gl = require("galaxyline")
local section = gl.section
gl.short_line_list = {"LuaTree", "packager", "Floaterm", "coc-eplorer"}

local one_dark_colors = {
  bg = "#2e3440",
  fg = "#81a1c1",
  line_bg = "#2e3440",
  fg_green = "#6d96a5",
  yellow = "#fabd2f",
  cyan = "#008080",
  darkblue = "#081633",
  green = "#608B4E",
  orange = "#FF8800",
  purple = "#5d4d7a",
  magenta = "#d16d9e",
  grey = "#c0c0c0",
  blue = "#569CD6",
  red = "#D16969"
}

local nord_colors = {
  bg = "#1d2a39",
  fg = "#81a1c1",
  line_bg = "#2B2D35",
  fg_green = "#497C6C",
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
    highlight = {nord_colors.blue, nord_colors.line_bg}
  }
}
section.left[2] = {
  ViMode = {
    provider = function()
      -- auto change color according the vim mode
      local mode_color = {
        n = nord_colors.magenta,
        i = nord_colors.green,
        v = nord_colors.blue,
        [""] = nord_colors.blue,
        V = nord_colors.blue,
        c = nord_colors.red,
        no = nord_colors.magenta,
        s = nord_colors.orange,
        S = nord_colors.orange,
        [""] = nord_colors.orange,
        ic = nord_colors.yellow,
        R = nord_colors.purple,
        Rv = nord_colors.purple,
        cv = nord_colors.red,
        ce = nord_colors.red,
        r = nord_colors.cyan,
        rm = nord_colors.cyan,
        ["r?"] = nord_colors.cyan,
        ["!"] = nord_colors.red,
        t = nord_colors.red
      }
      cmd("hi GalaxyViMode guifg=" .. mode_color[fn.mode()])
      return " ✝  "
    end,
    highlight = {nord_colors.red, nord_colors.line_bg, "bold"}
  }
}
section.left[3] = {
  FileIcon = {
    provider = "FileIcon",
    condition = buffer_not_empty,
    highlight = {require("galaxyline.provider_fileinfo").get_file_icon_color, nord_colors.line_bg}
  }
}
section.left[4] = {
  FileName = {
    -- provider = "FileName",
    provider = function()
      return fn.expand("%:F")
    end,
    condition = buffer_not_empty,
    separator = " ",
    separator_highlight = {nord_colors.purple, nord_colors.bg},
    highlight = {nord_colors.purple, nord_colors.line_bg, "bold"}
  }
}

section.right[1] = {
  GitIcon = {
    provider = function()
      return " "
    end,
    condition = require("galaxyline.provider_vcs").check_git_workspace,
    highlight = {nord_colors.orange, nord_colors.line_bg}
  }
}
section.right[2] = {
  GitBranch = {
    provider = "GitBranch",
    condition = require("galaxyline.provider_vcs").check_git_workspace,
    separator = "",
    separator_highlight = {nord_colors.purple, nord_colors.bg},
    highlight = {nord_colors.orange, nord_colors.line_bg, "bold"}
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
    highlight = {nord_colors.green, nord_colors.line_bg}
  }
}
section.right[4] = {
  DiffModified = {
    provider = "DiffModified",
    condition = checkwidth,
    icon = "柳",
    highlight = {nord_colors.yellow, nord_colors.line_bg}
  }
}
section.right[5] = {
  DiffRemove = {
    provider = "DiffRemove",
    condition = checkwidth,
    icon = " ",
    highlight = {nord_colors.red, nord_colors.line_bg}
  }
}

section.right[6] = {
  LineInfo = {
    provider = "LineColumn",
    separator = "",
    separator_highlight = {nord_colors.blue, nord_colors.line_bg},
    highlight = {nord_colors.fg, nord_colors.line_bg}
  }
}
-- section.right[7] = {
--   FileSize = {
--     provider = "FileSize",
--     separator = " ",
--     condition = buffer_not_empty,
--     separator_highlight = {nord_colors.blue, nord_colors.line_bg},
--     highlight = {nord_colors.fg, nord_colors.line_bg}
--   }
-- }

section.right[8] = {
  DiagnosticError = {
    provider = "DiagnosticError",
    -- separator = " ",
    icon = "   ",
    highlight = {nord_colors.red, nord_colors.line_bg},
    separator_highlight = {nord_colors.bg, nord_colors.bg}
  }
}
section.right[9] = {
  DiagnosticWarn = {
    provider = "DiagnosticWarn",
    -- separator = " ",
    icon = "   ",
    highlight = {nord_colors.yellow, nord_colors.line_bg},
    separator_highlight = {nord_colors.bg, nord_colors.bg}
  }
}

section.right[10] = {
  DiagnosticInfo = {
    -- separator = " ",
    provider = "DiagnosticInfo",
    icon = "   ",
    highlight = {nord_colors.green, nord_colors.line_bg},
    separator_highlight = {nord_colors.bg, nord_colors.bg}
  }
}

section.right[11] = {
  DiagnosticHint = {
    provider = "DiagnosticHint",
    -- separator = " ",
    icon = "   ",
    highlight = {nord_colors.blue, nord_colors.line_bg},
    separator_highlight = {nord_colors.bg, nord_colors.bg}
  }
}




