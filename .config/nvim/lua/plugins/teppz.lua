local cmd, g = vim.cmd, vim.g
local hiLinks = require "settings.utils".hiLinks
local highlights = require "settings.utils".highlights

-- vim.cmd("colorscheme paper")
-- vim.cmd("colorscheme github-light")
-- vim.cmd("set background=light")

--[[ cmd "colorscheme teppz"
cmd "set termguicolors" ]]

-- g.teppz_uniform_status_lines = 0
-- g.teppz_uniform_diff_background = 1
-- g.teppz_bold = 1
-- g.teppz_italic = 1
-- g.teppz_italic_comments = 0
-- g.teppz_underline = 1


--[[ local teppz = {
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

hiLinks(
  {
    jsxTagName = "jsxComponentName",
    jsObjectKey = "StorageClass",
    jsVariableDef = "Number",
    jsStorageClass = "rustAttribute",
    jsFuncBlock = "rustPanic",
    jsExport = "typescriptBOMWindowMethod",
    jsImport = "typescriptBOMWindowMethod",
    jsNull = "typescriptDecorator",
    jsBooleanTrue = "typescriptDecorator",
    jsBooleanFalse = "typescriptDecorator",
    jsObjectValue = "Function",
    BufferInactiveMod = "typescriptDecorator",
    BufferCurrentMod = "typescriptDecorator",
    BufferVisibleMod = "typescriptDecorator",
    BufferCurrent = "typescriptBOMWindowMethod",
    BufferVisible = "rustAttribute",
    BufferInactive = "rustAttribute",
    BufferTabpages = "Normal",
    BufferTabpageFill = "Normal",
    elixirAtom = "Number",
    elixirFunctionDeclaration = "rustAttribute",
    elixirDefine = "typescriptBOMWindowMethod",
    elixirModuleDefine = "typescriptBOMWindowMethod",
    elixirBlockDefinition = "typescriptBOMWindowMethod",
    elixirAlias = "SpecialChar",
    elixirModuleDeclaration = "typescriptDecorator",
    elixirInclude = "rustEnum",
    elixirId = "Type",
    LspDiagnosticsVirtualTextError = "LspDiagnosticsError",
    LspDiagnosticsVirtualTextWarning = "LspDiagnosticsWarning",
    LspDiagnosticsVirtualTextInformation = "LspDiagnosticsInformation",
    LspDiagnosticsVirtualTextHint = "LspDiagnosticsHint",
    LspDiagnosticsUnderlineError = "LspDiagnosticsUnderlineError",
    LspDiagnosticsUnderlineWarning = "LspDiagnosticsUnderlineWarning",
    LspDiagnosticsUnderlineInformation = "LspDiagnosticsUnderlineInformation",
    LspDiagnosticsUnderlineHint = "LspDiagnosticsUnderlineHint",
  }
)

highlights(
  {
    cssTagName= {fg = teppz.yellow, gui = "italic"},
    cssClassName= {fg = teppz.orange, gui = "italic"},
    jsGlobalObjects = {fg = teppz.orange, gui = "italic"},
    cssIndetifier = {fg = teppz.orange, gui = "italic"},
    jsReturn = {fg = teppz.red, gui = "bold"},
    jsSuper = {fg = teppz.red},
    jsThis = {fg = teppz.yellow},
    jsForAwait = {fg = teppz.red},
    jsTernaryIfOperator = {fg = teppz.red},
    StartifyHeader = {fg = teppz.red, gui = "bold"},
    StartifyNumber = {fg = teppz.green},
    StartifyPath = {fg = teppz.blue},
    StartifySlash = {fg = teppz.blue},
    StartifyBracket = {fg = teppz.blue},
    StartifyFile = {fg = teppz.darkblue},
    TelescopeBorder = {fg = teppz.green},
    TelescopePromptBorder = {fg = teppz.green},
    TelescopeResultsBorder = {fg = teppz.green},
    TelescopePreviewBorder = {fg = teppz.green},
    TelescopeSelection = {fg = teppz.orange},
    TelescopeMatching = {fg = teppz.red},
    TelescopeNormal = {fg = teppz.darkblue},
    FloatermBorder = {fg = teppz.green},
    LspDiagnosticsUnderlineError = { gui='underline' },
    LspDiagnosticsUnderlineWarning = { gui='underline' },
    LspDiagnosticsUnderlineInformation = { gui='underline' },
    LspDiagnosticsUnderlineHint = { gui='underline' },
  }
) ]]

-- cmd 'autocmd ColorScheme * hi jsGlobalObjects guifg=#eda48d'

