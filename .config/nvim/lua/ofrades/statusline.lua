local cmd = vim.cmd
local fn = vim.fn
local gl = require("galaxyline")
local section = gl.section
local condition = require("galaxyline.condition")

gl.short_line_list = {"NvimTree", "packager", "vista", "Floaterm", "startify"}

local theme = require("colorbuddy").colors

local colors = {
  fg = theme.grey600:to_rgb(),
  bg = theme.grey800:to_rgb(),
  dark = theme.dark:to_rgb(),
  yellow = theme.yellow500:to_rgb(),
  green = theme.green500:to_rgb(),
  blue = theme.blue500:to_rgb(),
  red = theme.red500:to_rgb()
}

local mode_color = function()
  local mode_colors = {
    n = colors.bg,
    i = colors.green,
    c = colors.red,
    V = colors.yellow,
    [""] = colors.yellow,
    v = colors.yellow,
    R = colors.blue
  }

  return mode_colors[vim.fn.mode()]
end

section.left[1] = {
  ViMode = {
    provider = function()
      local alias = {
        n = "[N]",
        i = "[I]",
        c = "[C]",
        V = "[V]",
        [""] = "[V]",
        v = "[V]",
        R = "[R]"
      }
      vim.api.nvim_command("hi GalaxyViMode guifg=" .. mode_color() .. " gui=bold")
      return "  " .. alias[vim.fn.mode()]
    end,
    highlight = {colors.dark, colors.dark},
    separator = " "
  }
}

print(vim.fn.getbufvar(0, "ts"))
vim.fn.getbufvar(0, "ts")

section.left[2] = {
  FileIcon = {
    provider = "FileIcon",
    condition = condition.buffer_not_empty,
    highlight = {require("galaxyline.provider_fileinfo").get_file_icon_color, colors.dark}
  }
}

local checkwidth = function()
  local squeeze_width = fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end

local FilePath = function()
  local squeeze_width = fn.winwidth(0) / 2
  if squeeze_width > 70 then
    return fn.expand("%")
  end
  return fn.pathshorten(fn.expand("%"))
end

section.left[3] = {
  FileName = {
    provider = FilePath,
    separator = "  ",
    condition = condition.buffer_not_empty,
    highlight = {colors.green, colors.dark, "bold"}
  }
}
section.left[4] = {
  LeftEnd = {
    provider = function()
      return " "
    end,
    separator = " ",
    separator_highlight = {colors.bg, colors.bg},
    highlight = {colors.dark, colors.bg}
  }
}
section.right[1] = {
  GitBranch = {
    provider = "GitBranch",
    separator = " ",
    condition = condition.check_git_workspace,
    separator_highlight = {colors.bg, colors.dark},
    icon = "  ",
    highlight = {colors.fg, colors.dark, "bold"}
  }
}

section.right[2] = {
  DiffAdd = {
    provider = "DiffAdd",
    condition = checkwidth,
    separator = " ",
    icon = " ",
    highlight = {colors.green, colors.dark}
  }
}

section.right[3] = {
  DiffModified = {
    provider = "DiffModified",
    condition = checkwidth,
    icon = " ",
    highlight = {colors.yellow, colors.dark}
  }
}

section.right[4] = {
  DiffRemove = {
    provider = "DiffRemove",
    condition = checkwidth,
    icon = " ",
    highlight = {colors.red, colors.dark}
  }
}

section.right[5] = {
  GetLspClient = {
    provider = "GetLspClient",
    separator = " ",
    separator_highlight = {colors.fg, colors.dark},
    highlight = {colors.fg, colors.dark}
  }
}

section.right[6] = {
  DiagnosticError = {
    separator = " ",
    provider = "DiagnosticError",
    icon = "  ",
    highlight = {colors.red, colors.dark}
  }
}

section.right[7] = {
  DiagnosticWarn = {
    provider = "DiagnosticWarn",
    icon = "  ",
    highlight = {colors.yellow, colors.dark}
  }
}

section.right[8] = {
  DiagnosticInfo = {
    provider = "DiagnosticInfo",
    icon = "  ",
    highlight = {colors.green, colors.dark}
  }
}

section.right[9] = {
  DiagnosticHint = {
    provider = "DiagnosticHint",
    icon = "  ",
    highlight = {colors.blue, colors.dark}
  }
}

section.right[10] = {
  LineInfo = {
    separator = " ",
    provider = "LineColumn",
    highlight = {colors.fg, colors.dark}
  }
}

section.right[11] = {
  PerCent = {
    provider = "LinePercent",
    separator = " ",
    highlight = {colors.fg, colors.dark}
  }
}
section.right[12] = {
  ScrollBar = {
    provider = "ScrollBar",
    separator = " ",
    separator_highlight = {colors.blue, colors.dark},
    highlight = {colors.fg, colors.dark}
  }
}
-- -------------------------Short status line---------------------------------------
section.short_line_left[1] = {
  SFileIcon = {
    provider = "FileIcon",
    highlight = {colors.fg, colors.dark}
  }
}

section.short_line_left[2] = {
  SFileName = {
    provider = "FileName",
    highlight = {colors.fg, colors.dark},
    separator = " "
  }
}

section.short_line_left[3] = {
  LeftEnd = {
    provider = function()
      return " "
    end,
    separator = " ",
    separator_highlight = {colors.bg, colors.bg},
    highlight = {colors.dark, colors.bg}
  }
}
