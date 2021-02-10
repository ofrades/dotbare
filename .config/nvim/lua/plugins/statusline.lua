local cmd = vim.cmd
local fn = vim.fn
local gl = require("galaxyline")
local section = gl.section
gl.short_line_list = {"NvimTree", "packager", "vista", "Floaterm", "startify"}

local palette = {
  bg = "#114141",
  fg = "#81a1c1",
  line_bg = "#114141",
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
    highlight = {palette.blue, palette.line_bg}
  }
}
section.left[2] = {
  ViMode = {
    provider = function()
      -- auto change color according the vim mode
      local mode_color = {
        n = palette.blue,
        i = palette.green,
        v = palette.yellow,
        [""] = palette.yellow,
        V = palette.yellow,
        c = palette.red,
        no = palette.blue,
        s = palette.orange,
        S = palette.orange,
        [""] = palette.orange,
        ic = palette.yellow,
        R = palette.purple,
        Rv = palette.purple,
        cv = palette.red,
        ce = palette.red,
        r = palette.cyan,
        rm = palette.cyan,
        ["r?"] = palette.cyan,
        ["!"] = palette.red,
        t = palette.red
      }
      cmd("hi GalaxyViMode guifg=" .. mode_color[fn.mode()])
      return "  ofrades  "
    end,
    highlight = {palette.red, palette.line_bg, "bold"}
  }
}
section.left[3] = {
  FileIcon = {
    provider = "FileIcon",
    condition = buffer_not_empty,
    highlight = {require("galaxyline.provider_fileinfo").get_file_icon_color, palette.line_bg}
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
    separator_highlight = {palette.purple, palette.bg},
    highlight = {palette.purple, palette.line_bg, "bold"}
  }
}

section.right[1] = {
  GitIcon = {
    provider = function()
      return " "
    end,
    condition = require("galaxyline.provider_vcs").check_git_workspace,
    highlight = {palette.orange, palette.line_bg}
  }
}
section.right[2] = {
  GitBranch = {
    provider = "GitBranch",
    condition = require("galaxyline.provider_vcs").check_git_workspace,
    separator = "",
    separator_highlight = {palette.purple, palette.bg},
    highlight = {palette.orange, palette.line_bg, "bold"}
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
    icon = " ",
    highlight = {palette.green, palette.line_bg}
  }
}
section.right[4] = {
  DiffModified = {
    provider = "DiffModified",
    condition = checkwidth,
    icon = " ",
    highlight = {palette.yellow, palette.line_bg}
  }
}
section.right[5] = {
  DiffRemove = {
    provider = "DiffRemove",
    condition = checkwidth,
    icon = " ",
    highlight = {palette.red, palette.line_bg}
  }
}

section.right[6] = {
  LineInfo = {
    provider = "LineColumn",
    separator = "",
    separator_highlight = {palette.blue, palette.line_bg},
    highlight = {palette.gray, palette.line_bg}
  }
}
-- section.right[7] = {
--   FileSize = {
--     provider = "FileSize",
--     separator = " ",
--     condition = buffer_not_empty,
--     separator_highlight = {palette.blue, palette.line_bg},
--     highlight = {palette.fg, palette.line_bg}
--   }
-- }

section.right[8] = {
  DiagnosticError = {
    provider = "DiagnosticError",
    separator = " ",
    icon = " ",
    highlight = {palette.red, palette.line_bg},
    separator_highlight = {palette.bg, palette.bg}
  }
}
section.right[9] = {
  DiagnosticWarn = {
    provider = "DiagnosticWarn",
    -- separator = " ",
    icon = " ",
    highlight = {palette.yellow, palette.line_bg},
    separator_highlight = {palette.bg, palette.bg}
  }
}

section.right[10] = {
  DiagnosticInfo = {
    -- separator = " ",
    provider = "DiagnosticInfo",
    icon = " ",
    highlight = {palette.green, palette.line_bg},
    separator_highlight = {palette.bg, palette.bg}
  }
}

section.right[11] = {
  DiagnosticHint = {
    provider = "DiagnosticHint",
    -- separator = " ",
    icon = " ",
    highlight = {palette.blue, palette.line_bg},
    separator_highlight = {palette.bg, palette.bg}
  }
}

section.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    separator = ' ',
    separator_highlight = {'NONE',palette.bg},
    highlight = {palette.blue,palette.bg,'bold'}
  }
}

section.short_line_left[2] = {
  SFileName = {
    provider = function ()
      local fileinfo = require('galaxyline.provider_fileinfo')
      local fname = fileinfo.get_current_file_name()
      for _,v in ipairs(gl.short_line_list) do
        if v == vim.bo.filetype then
          return ''
        end
      end
      return fname
    end,
    condition = buffer_not_empty,
    highlight = {palette.white,palette.bg,'bold'}
  }
}

section.short_line_right[1] = {
  BufferIcon = {
    provider= 'BufferIcon',
    highlight = {palette.fg,palette.bg}
  }
}

section.short_line_right[2] = {
  VistaPlugin = {
    provider = 'VistaPlugin',
    separator = ' = ',
    highlight = {palette.fg,palette.bg}
  }
}



