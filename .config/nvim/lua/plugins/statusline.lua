local cmd = vim.cmd
local fn = vim.fn
local gl = require("galaxyline")
local section = gl.section
local condition = require('galaxyline.condition')
gl.short_line_list = {"NvimTree", "packager", "vista", "Floaterm", "startify"}
local gls = gl.section

local palette = {
  bg = "#515555",
  fg = "#d9bb80",
  green = "#4CA585",
  blue = "#609AD2",
  red = "#CF7357"
}


gls.left[1] = {
  RainbowRed = {
    provider = function() return '▊ ' end,
    highlight = {palette.green,palette.bg}
  },
}
gls.left[2] = {
  ViMode = {
    provider = function()
      -- auto change color according the vim mode
      local mode_color = {n = palette.red, i = palette.green,v=palette.blue,
                          [''] = palette.blue,V=palette.blue,
                          c = palette.red,no = palette.red,s = palette.red,
                          S=palette.red,[''] = palette.red,
                          ic = palette.fg,R = palette.violet,Rv = palette.red,
                          cv = palette.red,ce=palette.red, r = palette.blue,
                          rm = palette.blue, ['r?'] = palette.blue,
                          ['!']  = palette.red,t = palette.red}
      vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color[vim.fn.mode()])
      return ' '
    end,
    highlight = {palette.red,palette.bg,'bold'},
  },
}
gls.left[4] ={
  FileIcon = {
    provider = 'FileIcon',
    condition = condition.buffer_not_empty,
    highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,palette.bg},
  },
}

gls.left[5] = {
  FileName = {
    provider = 'FileName',
    condition = condition.buffer_not_empty,
    highlight = {palette.green,palette.bg,'bold'}
  }
}


section.right[2] = {
  GitBranch = {
    provider = "GitBranch",
    condition = require("galaxyline.provider_vcs").check_git_workspace,
    separator = "|",
    icon = "  ",
    separator_highlight = {palette.fg, palette.bg},
    highlight = {palette.fg, palette.bg, "bold"}
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
    icon = "  ",
    highlight = {palette.green, palette.bg}
  }
}
section.right[4] = {
  DiffModified = {
    provider = "DiffModified",
    condition = checkwidth,
    icon = "  ",
    highlight = {palette.fg, palette.bg}
  }
}
section.right[5] = {
  DiffRemove = {
    provider = "DiffRemove",
    condition = checkwidth,
    icon = "  ",
    highlight = {palette.red, palette.bg}
  }
}

section.right[6] = {
  GetLspClient = {
    provider = "GetLspClient",
    separator = "|",
    icon = "  ",
    separator_highlight = {palette.fg, palette.bg},
    highlight = {palette.fg, palette.bg}
  }
}
section.right[8] = {
  LineInfo = {
    provider = "LineColumn",
    separator = " |",
    icon = "  ",
    separator_highlight = {palette.fg, palette.bg},
    highlight = {palette.fg, palette.bg}
  }
}

section.right[10] = {
  DiagnosticError = {
    provider = "DiagnosticError",
    separator = "",
    icon = "  ",
    separator_highlight = {palette.bg, palette.bg},
    highlight = {palette.red, palette.bg}
  }
}
section.right[11] = {
  DiagnosticWarn = {
    provider = "DiagnosticWarn",
    separator = "",
    icon = "  ",
    highlight = {palette.fg, palette.bg},
    separator_highlight = {palette.bg, palette.bg}
  }
}

section.right[12] = {
  DiagnosticInfo = {
    separator = "",
    provider = "DiagnosticInfo",
    icon = "  ",
    highlight = {palette.green, palette.bg},
    separator_highlight = {palette.bg, palette.bg}
  }
}

section.right[13] = {
  DiagnosticHint = {
    provider = "DiagnosticHint",
    separator = "",
    icon = "  ",
    highlight = {palette.blue, palette.bg},
    separator_highlight = {palette.bg, palette.bg}
  }
}

section.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    separator = "",
    separator_highlight = {'NONE',palette.bg},
    highlight = {palette.blue, palette.bg,'bold'}
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
    highlight = {palette.fg, palette.bg,'bold'}
  }
}

section.short_line_right[1] = {
  BufferIcon = {
    provider= 'BufferIcon',
    highlight = {palette.fg,palette.bg}
  }
}

