local Color, c, Group, g, s = require("colorbuddy").setup()
local b = s.bold
local i = s.italic
local uc = s.undercurl
local ul = s.underline
local r = s.reverse
local no = s.NONE
local global = vim.g

global.colors_name = "ofrades"

---------------------
--  COLOR PALETTE  --
---------------------
Color.new("red500", "#d38676") -- adjective
Color.new("yellow500", "#fee787") -- subject
Color.new("green500", "#53bd97") -- verb
Color.new("blue500", "#629ed9") -- noun

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
Group.new("String", c.blue300, c.none, i)
Group.new("Delimiter", c.green500, c.none, no)
Group.new("Character", c.blue200, c.none, no)
Group.new("Constant", c.blue600, c.none, no)
Group.new("Boolean", c.red300, c.none, no)
Group.new("Float", c.red300, c.none, no)
Group.new("Tag", c.red300, c.none, no)
Group.new("Label", c.yellow500, c.none, no)
Group.new("PreProc", c.yellow500, c.none, no)
Group.new("Type", c.red600, c.none, no)
Group.new("StorageClass", c.red400, c.none, no)
Group.new("Special", c.yellow500, c.none, i)
Group.new("Todo", c.yellow500, c.none, b + i)
Group.new("Identifier", c.blue200, c.none, no)
Group.new("Function", c.green500, c.none, no)
Group.new("Include", c.red500, c.none, no)
Group.new("SpecialChar", c.blue600, c.none, no)
Group.new("Underlined", c.blue600, c.none, ul)
Group.new("Conceal", c.blue600, c.dark, no)
Group.new("Statement", c.red400, c.none, no)
Group.new("Repeat", c.red400, c.none, no)
Group.new("Structure", c.red400, c.none, no)
Group.new("Define", c.red400, c.none, no)
Group.new("Operator", c.grey200, c.none, no)
Group.new("Keyword", c.red400, c.none, no)
Group.new("Macro", c.blue200, c.none, no)
Group.new("Typedef", c.blue200, c.none, no)
Group.new("Comment", c.green700, c.none, i)
Group.new("Ignore", c.none, c.none, no)
Group.new("Error", c.red500, c.none, b + ul)
Group.new("Debug", c.red500, c.none, no)
Group.new("Exception", c.red500, c.none, no)

Group.new("ColorColumn", c.none, c.none, no)
Group.new("Cursor", c.none, c.red300, no)
Group.new("CursorIM", c.none, c.none, no)
Group.new("CursorColumn", c.none, c.none, no)
Group.new("CursorLineNr", c.green600, c.none, no)
Group.new("CursorLine", c.none, c.grey800, no)
Group.new("Folded", c.grey600, c.none, no)
Group.new("SignColumn", c.none, c.none, no)
Group.new("IncSearch", c.none, c.none, r)
Group.new("PMenu", c.none, c.grey800, no)
Group.new("PMenuSel", c.dark, c.green500, no)
Group.new("PMenuSbar", c.none, c.green600, no)
Group.new("PMenuThumb", c.none, c.grey600, no)
Group.new("Directory", c.green400, c.none, b)
Group.new("DiffAdd", c.none, c.green500)
Group.new("DiffChange", c.none, c.blue500)
Group.new("DiffDelete", c.none, c.red500)
Group.new("DiffText", c.none, c.dark, r)
Group.new("StatusLine", c.none, c.grey800, no)
Group.new("StatusLineNC", c.dark, c.grey800, no)
Group.new("WarningMsg", c.red500, c.none, no)
Group.new("Warnings", c.red300, c.none, r)
Group.new("WildMenu", c.green400, c.dark, b)
Group.new("EndOfBuffer", c.none, c.none, no)
Group.new("ErrorMsg", c.red500, c.none, no)
Group.new("VertSplit", c.green700, c.none, no)
Group.new("FoldColumn", c.none, c.none, no)
Group.new("LineNr", c.grey500, c.none, no)
Group.new("MatchParen", c.blue200, c.none, b)
Group.new("ModeMsg", c.blue600, c.none, no)
Group.new("NonText", c.grey500, c.none, no)
Group.new("Normal", c.grey100, c.dark, no)
Group.new("NormalFloat", c.grey100, c.none, no)
Group.new("Question", c.blue700, c.none, b)
Group.new("qfLineNr", g.Type, g.Type, g.Type)
Group.new("Search", c.dark, c.red500, no)
Group.new("SpecialKey", c.red400, c.none, no)
Group.new("Title", c.grey100, c.none, b)
Group.new("Visual", c.grey100, c.red600, b)
Group.new("VisualNOS", c.dark, c.yellow400, g.Visual)
Group.new("StatusLineTerm", c.dark, c.green500, no)
Group.new("StatusLineTermNC", c.dark, c.grey800, no)
Group.new("Conditional", g.Conditional, c.none, no)
Group.new("QuickFixLine", g.Search, g.Search, g.Search)
Group.new("TabLine", g.TabLineFill, g.TabLineFill, g.TabLineFill)
Group.new("TabLineFill", c.grey500, c.dark, no)
Group.new("TabLineSel", c.dark, c.blue700, no)

----------------
-- LSP COLORS --
----------------
Group.new("LspDiagnosticsWarning", c.yellow500, c.none, no)

Group.new("LspDiagnosticsError", c.red500, c.none, no)
Group.new("LspDiagnosticsErrorSign", c.red500, c.none, no)
Group.new("LspDiagnosticsErrorFloating", c.red500, c.none, no)
Group.new("LspDiagnosticsUnderlineError", c.red500, c.none, ul)

Group.new("LspDiagnosticsHint", c.green500, c.none, no)
Group.new("LspDiagnosticsHintSign", c.green500, c.none, no)
Group.new("LspDiagnosticsFloatingHint", c.green500, c.none, no)
Group.new("LspDiagnosticsUnderlineHint", c.green500, c.none, ul)

Group.new("LspDiagnosticsInformation", c.blue500, c.none, no)
Group.new("LspDiagnosticsInformationSign", c.blue500, c.none, no)
Group.new("LspDiagnosticsInformationFloating", c.blue500, c.none, no)
Group.new("LspDiagnosticsUnderlineInformation", c.blue500, c.none, ul)

-----------------------
-- TREESITTER COLORS --
-----------------------
Group.new("TSFloat", c.blue500, c.none, no)
Group.new("TSAnnotation", c.blue600, c.none, no)
Group.new("TSAttribute", c.blue300, c.none, no)
Group.new("TSNamespace", c.red600, c.none, no)
Group.new("TSType", c.red500, c.none, no)
Group.new("TSTypeBuiltin", c.red500, c.none, no)
Group.new("TSLabel", c.yellow700, c.none, no)
Group.new("TSCharacter", c.blue200, c.none, no)
Group.new("TSConditional", c.red300, c.none, no)
Group.new("TSRepeat", c.yellow600, c.none, no)
Group.new("TSConstant", c.blue700, c.none, no)
Group.new("TSConstBuiltin", c.blue600, c.none, no)
Group.new("TSConstMacro", c.blue600, c.none, no)
Group.new("TSFunction", c.green500, c.none, no)
Group.new("TSFuncBuiltin", c.green400, c.none, no)
Group.new("TSFuncMacro", c.green600, c.none, no)
Group.new("TSMethod", c.green500, c.none, no)
Group.new("TSStructure", c.red600, c.none, no)
Group.new("TSConstructor", c.green600, c.none, no)
Group.new("TSTag", c.blue500, c.none, no)
Group.new("TSTagDelimiter", c.grey400, c.none, no)
Group.new("TSNumber", c.blue400, c.none, no)
Group.new("TSInclude", c.red600, c.none, no)
Group.new("TSKeyword", c.yellow600, c.none, no)
Group.new("TSKeywordFunction", c.green500, c.none, no)
Group.new("TSKeywordOperator", c.yellow600, c.none, no)
Group.new("TSException", c.red500, c.none, no)
Group.new("TSBoolean", c.blue600, c.none, no)
Group.new("TSError", c.red500, c.none, no)
Group.new("TSString", c.blue500, c.none, no)
Group.new("TSStringEscape", c.blue700, c.none, no)
Group.new("TSStringRegex", c.blue400, c.none, no)
Group.new("TSField", c.yellow600, c.none, no)
Group.new("TSParameter", c.red500, c.none, no)
Group.new("TSVariable", c.yellow500, c.none, no)
Group.new("TSVariableBuiltin", c.yellow400, c.none, no)
Group.new("TSPunctDelimiter", c.grey300, c.none, no)
Group.new("TSPunctBracket", c.grey300, c.none, no)
Group.new("TSPunctSpecial", c.grey300, c.none, no)
Group.new("TSOperator", c.grey100, c.none, no)
Group.new("TSProperty", c.red300, c.none, no)

--------------------------------------------------------------------------
--                        COLOR SETTINGS                       --
--------------------------------------------------------------------------

---------
-- GIT --
---------
Group.new("gitcommitComment", c.grey500, c.none, no)
Group.new("SignifySignAdd", c.green500, c.none, no)
Group.new("SignifySignChange", c.yellow500, c.none, no)
Group.new("SignifySignDelete", c.red500, c.none, no)
Group.new("gitcommitDiscardedType", c.red500, c.none, no)
Group.new("gitcommitSelectedType", c.green500, c.none, no)
Group.new("gitcommitHeader", c.none, c.none, no)
Group.new("gitcommitUntrackedFile", c.blue200, c.none, no)
Group.new("gitcommitDiscardedFile", c.red500, c.none, no)
Group.new("gitcommitUnmerged", c.green500, c.none, no)
Group.new("gitcommitOnBranch", c.none, c.none, no)
Group.new("gitcommitBranch", c.red400, c.none, no)
Group.new("gitcommitSelectedFile", c.green500, c.none, no)
Group.new("gitcommitUnmergedFile", c.yellow500, c.none, no)
Group.new("gitcommitSelectedArrow", g.gitcommitSelectedFile, g.gitcommitSelectedFile, g.gitcommitSelectedFile)
Group.new("gitcommitUnmergedArrow", g.gitcommitUnmergedFile, g.gitcommitUnmergedFile, g.gitcommitUnmergedFile)
Group.new("GitGutterAdd", g.SignifySignAdd, g.SignifySignAdd, g.SignifySignAdd)
Group.new("GitGutterChange", g.SignifySignChange, g.SignifySignChange, g.SignifySignChange)
Group.new("gitcommitFile", c.none, c.none, no)
Group.new("gitcommitNoBranch", g.gitcommitBranch, g.gitcommitBranch, g.gitcommitBranch)
Group.new("gitcommitUntracked", g.gitcommitComment, g.gitcommitComment, g.gitcommitComment)
Group.new("gitcommitDiscarded", g.gitcommitComment, g.gitcommitComment, g.gitcommitComment)
Group.new("gitcommitDiscardedArrow", g.gitcommitDiscardedFile, g.gitcommitDiscardedFile, g.gitcommitDiscardedFile)
Group.new("GitGutterDelete", g.SignifySignDelete, g.SignifySignDelete, g.SignifySignDelete)

----------
-- DIFF --
----------
Group.new("diffAdded", c.green500, c.none, no)
Group.new("diffFile", c.red500, c.none, no)
Group.new("diffNewFile", c.yellow500, c.none, no)
Group.new("diffChanged", c.blue500, c.none, no)
Group.new("diffRemoved", c.red500, c.none, no)
Group.new("diffLine", c.blue500, c.none, no)

-----------
-- SPELL --
-----------
Group.new("SpellBad", c.red500, c.none)
Group.new("SpellCap", c.yellow500, c.none)
Group.new("SpellLocal", c.blue500, c.none)
Group.new("SpellRare", c.green500, c.none)

---------------
-- TELESCOPE --
---------------
Group.new("TelescopeNormal", c.grey100, c.none, no)
Group.new("TelescopeSelection", c.grey100, c.grey800, b)
Group.new("TelescopeSelectionCaret", c.green500, c.green500, no)
Group.new("TelescopeMultiSelection ", c.green500, c.none, no)
Group.new("TelescopeBorder", c.grey800, c.none, no)
Group.new("TelescopePromptBorder", c.grey600, c.none, no)
Group.new("TelescopeResultsBorder", c.grey700, c.none, no)
Group.new("TelescopePreviewBorder", c.grey700, c.none, no)
Group.new("TelescopeMatching ", c.blue500, c.none, no)
Group.new("TelescopePromptPrefix", c.grey500, c.none, no)
Group.new("TelescopePrompt", c.grey800, c.none, no)

---------------
-- NVIM TREE --
---------------
Group.new("NvimTreeFolderName", c.green700, c.none, no)
Group.new("NvimTreeFolderIcon", c.red500, c.none, no)
Group.new("NvimTreeExecFile", c.green600, c.none, no)
Group.new("NvimTreeImageFile", c.green500, c.none, no)
Group.new("NvimTreeEmptyFolderName", c.grey600, c.none, no)

---------------
-- VIM STARTIFY --
---------------
Group.new("StartifyBracket", c.grey500, c.none, no)
Group.new("StartifyFile", c.yellow400, c.none, no)
Group.new("StartifyNumber", c.red500, c.none, no)
Group.new("StartifyPath", c.green500, c.none, no)
Group.new("StartifySlash", c.green700, c.none, no)
Group.new("StartifySection", c.blue500, c.none, no)
Group.new("startifyheader", c.red600, c.none, no)
Group.new("StartifySpecial", c.grey300, c.none, no)
Group.new("StartifyFooter", c.green400, c.none, no)

-- HTML (keep consistent with Markdown, below)
Group.new("htmlTag", c.blue500, c.none, no)
Group.new("htmlEndTag", c.blue500, c.none, no)
Group.new("htmlTagName", c.red500, c.none, no)
Group.new("htmlArg", c.blue300, c.none, no)
Group.new("htmlScriptTag", c.red300, c.none, no)
Group.new("htmlTagN", c.yellow500, c.none, no)
Group.new("htmlSpecialTagName", c.blue300, c.none, b)
Group.new("htmlLink", c.blue500, c.none, ul)
Group.new("htmlSpecialChar", c.red500, c.none, no)
Group.new("htmlBold", c.yellow600, c.none, b)
Group.new("htmlBoldUnderline", c.yellow400, c.none, b, ul)
Group.new("htmlBoldItalic", c.yellow700, c.none, b + i)
Group.new("htmlBoldUnderlineItalic", c.yellow400, c.none, b + i + ul)
Group.new("htmlUnderline", c.yellow400, c.none, ul)
Group.new("htmlUnderlineItalic", c.yellow500, c.none, i + ul)
Group.new("htmlItalic", c.blue500, c.none, i)
Group.new("htmlH1", c.blue700, c.none, b)
Group.new("htmlH2", c.blue600, c.none, b)
Group.new("htmlH3", c.blue500, c.none, b)
Group.new("htmlH4", c.blue400, c.none, b)
Group.new("htmlH5", c.blue300, c.none, no)
Group.new("htmlH6", c.blue200, c.none, no)

Group.new("markdownItalic", c.green400, c.none, i)
Group.new("markdownH1", c.blue200, c.none, i)
Group.new("markdownH2", c.blue300, c.none, no)
Group.new("markdownH3", c.blue400, c.none, no)
Group.new("markdownH4", c.blue500, c.none, no)
Group.new("markdownH5", c.blue600, c.none, no)
Group.new("markdownH6", c.blue700, c.none, no)
Group.new("markdownCode", c.green500, c.none, no)
Group.new("mkdCode", c.grey500, c.none, no)
Group.new("markdownCodeBlock", c.grey400, c.none, no)
Group.new("markdownCodeDelimiter", c.red500, c.none, no)
Group.new("mkdCodeDelimiter", c.grey200, c.grey200, no)
Group.new("markdownBlockquote", c.grey300, c.none, no)
Group.new("markdownListMarker", c.grey600, c.none, no)
Group.new("markdownOrderedListMarker", c.grey400, c.none, no)
Group.new("markdownRule", c.grey400, c.none, no)
Group.new("markdownHeadingRule", c.grey600, c.none, no)
Group.new("markdownUrlDelimiter", c.yellow400, c.none, no)
Group.new("markdownLinkDelimiter", c.yellow400, c.none, no)
Group.new("markdownLinkTextDelimiter", c.yellow600, c.none, no)
Group.new("markdownHeadingDelimiter", c.red600, c.none, no)
Group.new("markdownUrl", c.yellow400, c.none, no)
Group.new("markdownUrlTitleDelimiter", c.green400, c.none, no)
Group.new("markdownLinkText", c.red600, c.none, i)
Group.new("markdownIdDeclaration", c.red300, c.none, no)

---------------------
-- TERMINAL COLORS --
---------------------
global.terminal_color_0 = c.dark:to_rgb()
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
global.terminal_color_14 = c.blue700:to_rgb()
global.terminal_color_15 = c.grey800:to_rgb()

--[[ '#000000'
'#F07178'
'#C3E88D'
'#FFCB6B'
'#82AAFF'
'#C792EA'
'#89DDFF'
'#EEFFFF'
'#000000'
'#F07178'
 '#C3E88D'
 '#FFCB6B'
 '#82AAFF'
 '#C792EA'
 '#89DDFF'
 '#EEFFFF' ]]
