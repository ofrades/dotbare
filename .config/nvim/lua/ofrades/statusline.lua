local cmd = vim.cmd
local fn = vim.fn
local gl = require("galaxyline")
local section = gl.section
local condition = require("galaxyline.condition")

gl.short_line_list = {"NvimTree", "packager", "vista", "Floaterm", "startify"}

local theme = require("colorbuddy").colors

local c = {
  fg = theme.grey600:to_rgb(),
  bg = theme.grey800:to_rgb(),
  dark = theme.dark:to_rgb(),
  yellow = theme.yellow500:to_rgb(),
  green = theme.green500:to_rgb(),
  blue = theme.blue500:to_rgb(),
  red = theme.red500:to_rgb()
}

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
      return alias[fn.mode()]
    end,
    separator = " ",
    highlight = {c.green, c.dark, "bold"}
  }
}

section.left[2] = {
  FileIcon = {
    provider = "FileIcon",
    condition = condition.buffer_not_empty,
    highlight = {require("galaxyline.provider_fileinfo").get_file_icon_color, c.dark}
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
    highlight = {c.green, c.dark, "bold"}
  }
}
section.left[4] = {
  LeftEnd = {
    provider = function()
      return " "
    end,
    separator = " ",
    separator_highlight = {c.bg, c.bg},
    highlight = {c.dark, c.bg}
  }
}
section.right[1] = {
  GitBranch = {
    provider = "GitBranch",
    separator = " ",
    condition = condition.check_git_workspace,
    separator_highlight = {c.bg, c.dark},
    icon = "  ",
    highlight = {c.fg, c.dark, "bold"}
  }
}

section.right[2] = {
  DiffAdd = {
    provider = "DiffAdd",
    condition = checkwidth,
    separator = " ",
    icon = " ",
    highlight = {c.green, c.dark}
  }
}

section.right[3] = {
  DiffModified = {
    provider = "DiffModified",
    condition = checkwidth,
    icon = " ",
    highlight = {c.yellow, c.dark}
  }
}

section.right[4] = {
  DiffRemove = {
    provider = "DiffRemove",
    condition = checkwidth,
    icon = " ",
    highlight = {c.red, c.dark}
  }
}

section.right[5] = {
  GetLspClient = {
    provider = "GetLspClient",
    separator = " LSP -> ",
    separator_highlight = {c.fg, c.dark},
    highlight = {c.fg, c.dark}
  }
}

section.right[6] = {
  DiagnosticError = {
    separator = " ",
    provider = "DiagnosticError",
    icon = "  ",
    highlight = {c.red, c.dark}
  }
}

section.right[7] = {
  DiagnosticWarn = {
    provider = "DiagnosticWarn",
    icon = "  ",
    highlight = {c.yellow, c.dark}
  }
}

section.right[8] = {
  DiagnosticInfo = {
    provider = "DiagnosticInfo",
    icon = "  ",
    highlight = {c.green, c.dark}
  }
}

section.right[9] = {
  DiagnosticHint = {
    provider = "DiagnosticHint",
    icon = "  ",
    highlight = {c.blue, c.dark}
  }
}

section.right[10] = {
  LineInfo = {
    separator = " ",
    provider = "LineColumn",
    highlight = {c.fg, c.dark}
  }
}

section.right[11] = {
  PerCent = {
    provider = "LinePercent",
    separator = " ",
    highlight = {c.fg, c.dark}
  }
}
section.right[12] = {
  ScrollBar = {
    provider = "ScrollBar",
    separator = " ",
    separator_highlight = {c.blue, c.dark},
    highlight = {c.fg, c.dark}
  }
}
