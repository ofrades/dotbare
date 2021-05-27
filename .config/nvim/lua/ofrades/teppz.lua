local global = vim.g
local Color, c, Group, g, s = require("colorbuddy").setup()

vim.g.colors_name = "teppz"

---------------------
--  COLOR PALETTE  --
---------------------

Color.new("dark", "#2b2d35") --background
Color.new("grey100", "#dddcd3") -- source / caret
Color.new("grey200", "#b9b9b6") -- operator
Color.new("grey300", "#9c9e9d") -- punctuation
Color.new("grey400", "#858789") -- parenthesis
Color.new("grey500", "#73767c") -- square bracket
Color.new("grey600", "#63676f") -- curly brace
Color.new("grey700", "#575b65") -- comment
Color.new("grey800", "#414450") --background
Color.new("grey900", "#3e3f43") --background

Color.new("red500", "#d38676") -- adjective
Color.new("yellow500", "#fee787") -- subject
Color.new("green500", "#53bd97") -- verb
Color.new("blue500", "#629ed9") -- noun

Color.new("blue200", "#5fd1be") -- chars
Color.new("blue300", "#5fc0d2") -- strings / escape
Color.new("blue400", "#609ad2") -- numbers
Color.new("blue600", "#6074d3") -- constant / null
Color.new("blue700", "#58659d") -- ui

Color.new("green400", "#b0c87c") -- ui
Color.new("green600", "#4ca585") -- functions / support
Color.new("green700", "#4e8b78") -- ui

Color.new("yellow400", "#d8c679") -- variables / local
Color.new("yellow600", "#dbba7e") -- preprocessor / entities
Color.new("yellow700", "#dbba7e") -- preprocessor / entities

Color.new("red300", "#cea37f") -- keywords /other
Color.new("red400", "#d88e79") -- declarations
Color.new("red600", "#b7776b") -- types

---------------------
-- EDITOR SETTINGS --
---------------------
Group.new("String", c.blue300, nil, s.italic)
Group.new("Delimiter", c.green500)
Group.new("Character", c.blue200)
Group.new("Constant", c.blue600)
Group.new("Boolean", c.red300)
Group.new("Float", c.red300)
Group.new("Tag", c.red300)
Group.new("Label", c.yellow500)
Group.new("PreProc", c.yellow500)
Group.new("Type", c.red600)
Group.new("StorageClass", c.red400)
Group.new("Special", c.yellow500, nil, s.italic)
Group.new("Todo", c.yellow500, nil, s.bold + s.italic)
Group.new("Identifier", c.blue200)
Group.new("Function", c.green500)
Group.new("Include", c.red500)
Group.new("SpecialChar", c.blue600)
Group.new("Underlined", c.blue600, nil, s.underline)
Group.new("Conceal", c.blue600, c.dark)
Group.new("Statement", c.red400)
Group.new("Repeat", c.red400)
Group.new("Structure", c.red400)
Group.new("Define", c.red400)
Group.new("Operator", c.grey200)
Group.new("Keyword", c.red400)
Group.new("Macro", c.blue200)
Group.new("Typedef", c.blue200)
Group.new("Comment", c.green700, nil, s.italic)
Group.new("Ignore", nil)
Group.new("Error", c.red500, nil, s.bold + s.underline)
Group.new("Debug", c.red500)
Group.new("Exception", c.red500)

Group.new("ColorColumn", nil, c.dark) -- used for the columns set with 'colorcolumn'
Group.new("Cursor", nil, c.red300) -- character under the cursor
Group.new("CursorLineNr", c.green600) -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
Group.new("CursorLine", nil, c.grey800) -- Screen-line at the cursor, when 'cursorline' is set.
Group.new("Folded", c.grey600) -- line used for closed folds
Group.new("SignColumn", nil, c.dark)
Group.new("IncSearch", c.dark, c.grey100)
Group.new("PMenu", nil, c.grey800)
Group.new("PMenuSel", c.dark, c.green500, s.bold)
Group.new("PMenuSbar", nil, c.green600)
Group.new("PMenuThumb", nil, c.grey600)
Group.new("Directory", c.green400, nil, s.bold)
Group.new("DiffAdd", c.green500, nil, s.reverse)
Group.new("DiffChange", c.blue500, nil, s.reverse)
Group.new("DiffDelete", c.red500, nil, s.reverse)
Group.new("DiffText", nil, nil, s.reverse)
Group.new("StatusLine", c.grey800, c.green600)
Group.new("StatusLineNC", c.dark, c.grey800)
Group.new("WarningMsg", c.red500)
Group.new("Warnings", c.red300, nil, s.reverse)
Group.new("WildMenu", c.green400, c.dark, s.bold)
Group.new("EndOfBuffer", c.dark)
Group.new("ErrorMsg", c.red500)
Group.new("VertSplit", c.green700)
Group.new("LineNr", c.grey600)
Group.new("MatchParen", c.yellow500)
Group.new("ModeMsg", c.blue600)
Group.new("NonText", c.grey500)
Group.new("Normal", c.grey100, c.dark)
Group.new("NormalFloat", nil, c.dark, s.italic)
Group.new("Question", c.blue600, nil, s.bold)
Group.new("Search", nil, nil, s.reverse)
Group.new("SpecialKey", c.red400)
Group.new("Visual", nil, c.blue700, s.bold)
Group.new("VisualNOS", c.dark, c.yellow400, g.Visual)
Group.new("StatusLineTerm", c.dark, c.green500)
Group.new("StatusLineTermNC", c.dark, c.grey800)
Group.new("Conditional", c.red300)
Group.new("QuickFixLine", g.Search, g.Search, g.Search)
Group.new("TabLine", c.grey500, c.dark)
Group.new("TabLineFill", c.grey500, c.dark)
Group.new("TabLineSel", c.dark, c.blue600)

----------------
-- LSP COLORS --
----------------
Group.new("LspDiagnosticsVirtualTextWarning", c.yellow500)
Group.new("LspDiagnosticsVirtualTextError", c.red500)
Group.new("LspDiagnosticsVirtualTextHint", c.green500)
Group.new("LspDiagnosticsVirtualTextInformation", c.blue500)

Group.new("LspDiagnosticsSignWarning", c.yellow500)
Group.new("LspDiagnosticsSignError", c.red500)
Group.new("LspDiagnosticsSignHint", c.green500)
Group.new("LspDiagnosticsSignInformation", c.blue500)

Group.new("LspDiagnosticsFloatingWarning", c.yellow500)
Group.new("LspDiagnosticsFloatingError", c.red500)
Group.new("LspDiagnosticsFloatingHint", c.green500)
Group.new("LspDiagnosticsFloatingInformation", c.blue500)

Group.new("LspDiagnosticsUnderlineWarning", nil, nil, s.underline, c.yellow500)
Group.new("LspDiagnosticsUnderlineError", nil, nil, s.underline, c.red500)
Group.new("LspDiagnosticsUnderlineHint", nil, nil, s.underline, c.green500)
Group.new("LspDiagnosticsUnderlineInformation", nil, nil, s.underline, c.blue500)

-----------------------
-- TREESITTER COLORS --
-----------------------
Group.new("TSFloat", c.blue500)
Group.new("TSAnnotation", c.blue600)
Group.new("TSAttribute", c.blue300)
Group.new("TSNamespace", c.red600)
Group.new("TSType", c.red500)
Group.new("TSTypeBuiltin", c.red500)
Group.new("TSLabel", c.yellow700)
Group.new("TSCharacter", c.blue200)
Group.new("TSConditional", c.yellow400)
Group.new("TSRepeat", c.yellow600)
Group.new("TSConstant", c.blue600)
Group.new("TSConstBuiltin", c.blue600)
Group.new("TSConstMacro", c.blue600)
Group.new("TSFunction", c.green500)
Group.new("TSFuncBuiltin", c.green400)
Group.new("TSFuncMacro", c.green600)
Group.new("TSMethod", c.green500)
Group.new("TSStructure", c.red600)
Group.new("TSConstructor", c.green600)
Group.new("TSTag", c.blue500)
Group.new("TSTagDelimiter", c.grey400)
Group.new("TSNumber", c.blue400)
Group.new("TSInclude", c.red600)
Group.new("TSKeyword", c.red300)
Group.new("TSKeywordFunction", c.green500)
Group.new("TSKeywordOperator", c.yellow600)
Group.new("TSException", c.red500)
Group.new("TSBoolean", c.blue600)
Group.new("TSError", c.red500)
Group.new("TSString", c.blue500)
Group.new("TSStringEscape", c.blue600)
Group.new("TSStringRegex", c.blue400)
Group.new("TSField", c.yellow600)
Group.new("TSParameter", c.red500)
Group.new("TSVariable", c.yellow500)
Group.new("TSVariableBuiltin", c.yellow400)
Group.new("TSPunctDelimiter", c.grey300)
Group.new("TSPunctBracket", c.grey300)
Group.new("TSPunctSpecial", c.grey300)
Group.new("TSOperator", c.grey100)
Group.new("TSProperty", c.yellow600)
Group.new("TSTitle", c.grey100)
Group.new("TSNone", c.grey500)

--------------------------------------------------------------------------
--                        COLOR SETTINGS                       --
--------------------------------------------------------------------------

---------
-- GIT --
---------
Group.new("gitcommitComment", c.grey500)
Group.new("SignifySignAdd", c.green500)
Group.new("SignifySignChange", c.yellow500)
Group.new("SignifySignDelete", c.red500)
Group.new("gitcommitDiscardedType", c.red500)
Group.new("gitcommitSelectedType", c.green500)
Group.new("gitcommitHeader", nil)
Group.new("gitcommitUntrackedFile", c.blue200)
Group.new("gitcommitDiscardedFile", c.red500)
Group.new("gitcommitUnmerged", c.green500)
Group.new("gitcommitOnBranch", nil)
Group.new("gitcommitBranch", c.red400)
Group.new("gitcommitSelectedFile", c.green500)
Group.new("gitcommitUnmergedFile", c.yellow500)
Group.new("gitcommitSelectedArrow", g.gitcommitSelectedFile, g.gitcommitSelectedFile, g.gitcommitSelectedFile)
Group.new("gitcommitUnmergedArrow", g.gitcommitUnmergedFile, g.gitcommitUnmergedFile, g.gitcommitUnmergedFile)
Group.new("GitGutterAdd", g.SignifySignAdd, g.SignifySignAdd, g.SignifySignAdd)
Group.new("GitGutterChange", g.SignifySignChange, g.SignifySignChange, g.SignifySignChange)
Group.new("gitcommitFile", nil)
Group.new("gitcommitNoBranch", g.gitcommitBranch, g.gitcommitBranch, g.gitcommitBranch)
Group.new("gitcommitUntracked", g.gitcommitComment, g.gitcommitComment, g.gitcommitComment)
Group.new("gitcommitDiscarded", g.gitcommitComment, g.gitcommitComment, g.gitcommitComment)
Group.new("gitcommitDiscardedArrow", g.gitcommitDiscardedFile, g.gitcommitDiscardedFile, g.gitcommitDiscardedFile)
Group.new("GitGutterDelete", g.SignifySignDelete, g.SignifySignDelete, g.SignifySignDelete)

----------
-- DIFF --
----------
Group.new("diffAdded", c.green500)
Group.new("diffFile", c.red500)
Group.new("diffNewFile", c.yellow500)
Group.new("diffChanged", c.blue500)
Group.new("diffRemoved", c.red500)
Group.new("diffLine", c.blue500)

-----------
-- SPELL --
-----------
Group.new("SpellBad", c.red500)
Group.new("SpellCap", c.yellow500)
Group.new("SpellLocal", c.blue500)
Group.new("SpellRare", c.green500)

---------------
-- TELESCOPE --
---------------
Group.new("TelescopeNormal", c.grey100)
Group.new("TelescopeSelection", c.grey100, c.grey800, s.bold)
Group.new("TelescopeSelectionCaret", c.green500, c.green500)
Group.new("TelescopeMultiSelection ", c.green500)
Group.new("TelescopeBorder", c.grey800)
Group.new("TelescopePromptBorder", c.grey600)
Group.new("TelescopeResultsBorder", c.grey700)
Group.new("TelescopePreviewBorder", c.grey700)
Group.new("TelescopeMatching ", c.blue500)
Group.new("TelescopePromptPrefix", c.grey500)
Group.new("TelescopePrompt", c.grey800)

---------------
-- NVIM TREE --
---------------
Group.new("NvimTreeFolderName", c.green700)
Group.new("NvimTreeFolderIcon", c.red500)
Group.new("NvimTreeExecFile", c.green600)
Group.new("NvimTreeImageFile", c.green500)
Group.new("NvimTreeEmptyFolderName", c.grey600)

---------------
-- VIM STARTIFY --
---------------
Group.new("StartifyBracket", c.grey500)
Group.new("StartifyFile", c.yellow400)
Group.new("StartifyNumber", c.red500)
Group.new("StartifyPath", c.green500)
Group.new("StartifySlash", c.green700)
Group.new("StartifySection", c.blue500)
Group.new("startifyheader", c.red600)
Group.new("StartifySpecial", c.grey300)
Group.new("StartifyFooter", c.green400)

-- HTML (keep consistent with Markdown, below)
Group.new("htmlTag", c.blue500)
Group.new("htmlEndTag", c.blue500)
Group.new("htmlTagName", c.red500)
Group.new("htmlArg", c.blue300)
Group.new("htmlScriptTag", c.red300)
Group.new("htmlTagN", c.yellow500)
Group.new("htmlSpecialTagName", c.blue300, nil, s.bold)
Group.new("htmlLink", c.blue500, nil, s.underline)
Group.new("htmlSpecialChar", c.red500)
Group.new("htmlBold", c.yellow600, nil, s.bold)
Group.new("htmlBoldUnderline", c.yellow400, nil, s.bold + s.underline)
Group.new("htmlBoldItalic", c.yellow700, nil, s.bold + s.italic)
Group.new("htmlBoldUnderlineItalic", c.yellow400, nil, s.bold + s.italic + s.underline)
Group.new("htmlUnderline", c.yellow400, nil, s.underline)
Group.new("htmlUnderlineItalic", c.yellow500, nil, s.italic + s.underline)
Group.new("htmlItalic", c.blue500, nil, s.italic)
Group.new("htmlH1", c.blue600, nil, s.bold)
Group.new("htmlH2", c.blue600, nil, s.bold)
Group.new("htmlH3", c.blue500, nil, s.bold)
Group.new("htmlH4", c.blue400, nil, s.bold)
Group.new("htmlH5", c.blue300)
Group.new("htmlH6", c.blue200)

Group.new("markdownItalic", c.green400, nil, s.italic)
Group.new("markdownH1", c.blue200, nil, s.italic)
Group.new("markdownH2", c.blue300)
Group.new("markdownH3", c.blue400)
Group.new("markdownH4", c.blue500)
Group.new("markdownH5", c.blue600)
Group.new("markdownH6", c.blue600)
Group.new("markdownCode", c.green500)
Group.new("mkdCode", c.grey500)
Group.new("markdownCodeBlock", c.grey400)
Group.new("markdownCodeDelimiter", c.red500)
Group.new("mkdCodeDelimiter", c.grey200, c.grey200)
Group.new("markdownBlockquote", c.grey300)
Group.new("markdownListMarker", c.grey600)
Group.new("markdownOrderedListMarker", c.grey400)
Group.new("markdownRule", c.grey400)
Group.new("markdownHeadingRule", c.grey600)
Group.new("markdownUrlDelimiter", c.yellow400)
Group.new("markdownLinkDelimiter", c.yellow400)
Group.new("markdownLinkTextDelimiter", c.yellow600)
Group.new("markdownHeadingDelimiter", c.red600)
Group.new("markdownUrl", c.yellow400)
Group.new("markdownUrlTitleDelimiter", c.green400)
Group.new("markdownLinkText", c.red600, nil, s.italic)
Group.new("markdownIdDeclaration", c.red300)

Group.new("LirFloatNormal", nil)
Group.new("LirFloatBorder", c.grey800)
Group.new("LirDir", c.green500)
Group.new("LirSymLink", c.blue500)
Group.new("LirEmptyDirText", c.green700)
Group.new("LirFolderNode", c.green700, c.green700)

-- git signs
Group.new("GitSignsAdd", c.green500)
Group.new("GitSignsChange", c.yellow500)
Group.new("GitSignsDelete", c.red500)

-- which key
Group.new("WhichKey", c.red500)
Group.new("WhichKeyGroup", c.yellow500)
Group.new("WhichKeySeparator", c.blue500)
Group.new("WhichKeyDesc", c.green500)
Group.new("WhichKeyFloat", c.blue500, c.grey900)
Group.new("WhichKeyValue", c.yellow500)

---------------------
-- TERMINAL COLORS --
---------------------
global.terminal_color_0 = c.grey800:to_rgb()
global.terminal_color_1 = c.red400:to_rgb()
global.terminal_color_2 = c.green500:to_rgb()
global.terminal_color_3 = c.yellow400:to_rgb()
global.terminal_color_4 = c.blue400:to_rgb()
global.terminal_color_5 = c.red300:to_rgb()
global.terminal_color_6 = c.green600:to_rgb()
global.terminal_color_7 = c.grey400:to_rgb()
global.terminal_color_8 = c.grey500:to_rgb()
global.terminal_color_9 = c.red500:to_rgb()
global.terminal_color_10 = c.green700:to_rgb()
global.terminal_color_11 = c.yellow500:to_rgb()
global.terminal_color_12 = c.blue500:to_rgb()
global.terminal_color_13 = c.red400:to_rgb()
global.terminal_color_14 = c.blue600:to_rgb()
global.terminal_color_15 = c.grey700:to_rgb()

vim.g.teppz_italic = true
vim.g.teppz_italic_comments = 1
vim.g.teppz_italic_keywords = 1
vim.g.teppz_italic_functions = 1
