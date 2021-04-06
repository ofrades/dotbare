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
-- TERMINAL COLORS --
---------------------
global.terminal_color_0 = "#555555"
global.terminal_color_1 = "#cf7357"
global.terminal_color_2 = "#4CA585"
global.terminal_color_3 = "#FFCC00"
global.terminal_color_4 = "#609AD2"
global.terminal_color_5 = "#B954B8"
global.terminal_color_6 = "#00D5A7"
global.terminal_color_7 = "#CED5E5"
global.terminal_color_8 = "#555555"
global.terminal_color_9 = "#cf7357"
global.terminal_color_10 = "#B8EE92"
global.terminal_color_11 = "#FFCC00"
global.terminal_color_12 = "#609AD2"
global.terminal_color_13 = "#B954B8"
global.terminal_color_14 = "#00D5A7"
global.terminal_color_15 = "#CED5E5"

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
Group.new("CursorLine", c.none, c.grey700, no)
Group.new("Folded", c.none, c.none, no)
Group.new("SignColumn", c.none, c.none, no)
Group.new("IncSearch", c.none, c.none, r)
Group.new("PMenu", c.none, c.grey700, no)
Group.new("PMenuSel", c.dark, c.green500, no)
Group.new("PMenuSbar", c.none, c.green600, no)
Group.new("PMenuThumb", c.none, c.grey600, no)
Group.new("Directory", c.green400, c.none, b)
Group.new("DiffAdd", c.none, c.green500)
Group.new("DiffChange", c.none, c.blue500)
Group.new("DiffDelete", c.none, c.red500)
Group.new("DiffText", c.none, c.dark, r)
Group.new("StatusLine", c.grey100, c.grey500, no)
Group.new("StatusLineNC", c.grey100, c.none, no)
Group.new("WarningMsg", c.red500, c.none, no)
Group.new("Warnings", c.red300, c.none, r)
Group.new("WildMenu", c.green400, c.dark, b)
Group.new("EndOfBuffer", c.none, c.none, no)
Group.new("ErrorMsg", c.red500, c.none, no)
Group.new("VertSplit", c.green700, c.none, no)
Group.new("FoldColumn", c.none, c.none, no)
Group.new("LineNr", c.grey700, c.none, no)
Group.new("MatchParen", c.blue200, c.none, b)
Group.new("ModeMsg", c.blue600, c.none, no)
Group.new("NonText", c.grey500, c.none, no)
Group.new("Normal", c.grey100, c.dark, no)
Group.new("NormalFloat", c.grey100, c.grey400, no)
Group.new("Question", c.blue700, c.none, b)
Group.new("qfLineNr", g.Type, g.Type, g.Type)
Group.new("Search", c.dark, c.red300, no)
Group.new("SpecialKey", c.red400, c.none, no)
Group.new("Title", c.grey100, c.none, b)
Group.new("Visual", c.grey100, c.grey600, no)
Group.new("VisualNOS", c.dark, c.yellow400, g.Visual)
Group.new("StatusLineTerm", c.dark, c.green500, g.StatusLine)
Group.new("StatusLineTermNC", g.StatusLineNC, g.StatusLineNC, g.StatusLineNC)
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
Group.new("TSPunctDelimiter", c.grey100, c.none, no)
Group.new("TSPunctBracket", c.grey100, c.none, no)
Group.new("TSPunctSpecial", c.grey100, c.none, no)
Group.new("TSOperator", c.grey100, c.none, no)
Group.new("TSProperty", c.red300, c.none, no)

--------------------------------------------------------------------------
--                        COLOR LANGUAGE SETTINGS                       --
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

--------------
-- MARKDOWN --
--------------
Group.new("markdownUrl", c.red400, c.none, no)
Group.new("markdownH1", c.red500, c.none, no)
Group.new("markdownH2", c.red500, c.none, no)
Group.new("markdownH3", c.red500, c.none, no)
Group.new("markdownH3", c.red500, c.none, no)
Group.new("markdownH4", c.red500, c.none, no)
Group.new("markdownH5", c.red500, c.none, no)
Group.new("markdownH6", c.red500, c.none, no)
Group.new("markdownItalic", c.red300, c.none, b)
Group.new("markdownBold", c.red300, c.none, b)
Group.new("markdownListMarker", c.yellow500, c.none, no)
Group.new("markdownCode", c.green500, c.none, no)
Group.new("markdownCodeBlock", c.yellow500, c.none, no)
Group.new("markdownCodeDelimiter", c.green500, c.none, no)
Group.new("markdownRule", c.grey500, c.none, no)
Group.new("markdownHeadingRule", c.grey500, c.none, no)
Group.new("markdownUrlDelimiter", c.grey600, c.none, no)
Group.new("markdownLinkDelimiter", c.grey600, c.none, no)
Group.new("markdownLinkTextDelimiter", c.grey600, c.none, no)
Group.new("markdownHeadingDelimiter", c.red300, c.none, no)
Group.new("markdownUrlTitleDelimiter", c.green500, c.none, no)
Group.new("markdownHeadingDelimiter", c.red300, c.none, no)
Group.new("markdownOrderedListMarker", c.grey500, c.none, no)

----------
-- HTML --
----------
Group.new("htmlSpecialTagName", c.red500, c.none, no)
Group.new("htmlArg", c.red300, c.none, no)
Group.new("htmlTagName", c.red500, c.none, no)
Group.new("htmlTagN", c.red500, c.none, no)
Group.new("htmlEndTag", c.grey600, c.none, no)
Group.new("htmlTag", c.grey600, c.none, no)
Group.new("MatchTag", c.red500, c.grey600, ul + b)

-----------
--  XML  --
-----------
Group.new("xmlTag", c.red500, c.none, no)
Group.new("xmlEndTag", c.red500, c.none, no)
Group.new("xmlTagName", c.red500, c.none, no)
Group.new("xmlAttrib", c.yellow500, c.none, no)
Group.new("xmlEqual", c.red500, c.none, no)
Group.new("docbkKeyword", c.blue200, c.none, b)
Group.new("xmlDocTypeDecl", c.grey500, c.none, no)
Group.new("xmlDocTypeKeyword", c.red400, c.none, no)
Group.new("xmlCdataStart", c.grey500, c.none, no)
Group.new("xmlCdataCdata", c.red400, c.none, no)
Group.new("xmlProcessingDelim", c.grey500, c.none, no)
Group.new("xmlAttribPunct", c.grey500, c.none, no)
Group.new("xmlEntity", c.red300, c.none, no)
Group.new("xmlEntityPunct", c.red300, c.none, no)

---------
-- PUG --
---------
Group.new("pugDocType", c.grey500, c.none, i)
Group.new("pugClass", c.red300, c.none, no)
Group.new("pugTag", c.red500, c.none, no)
Group.new("pugAttributesDelimiter", c.red300, c.none, no)

---------
-- CSS --
---------
Group.new("cssFontAttr", c.red300, c.none, no)
Group.new("cssAttrComma", c.red400, c.none, no)
Group.new("cssIdentifier", c.blue700, c.none, no)
Group.new("cssImportant", c.red400, c.none, no)
Group.new("cssInclude", c.grey100, c.none, no)
Group.new("cssIncludeKeyword", c.red400, c.none, no)
Group.new("cssMediaType", c.red300, c.none, no)
Group.new("cssProp", c.blue200, c.none, no)
Group.new("cssAttributeSelector", c.green500, c.none, no)
Group.new("cssBraces", c.grey600, c.none, no)
Group.new("cssClassName", c.red300, c.none, no)
Group.new("cssClassNameDot", c.red300, c.none, no)
Group.new("cssDefinition", c.red400, c.none, no)
Group.new("cssFontDescriptor", c.red400, c.none, no)
Group.new("cssFunctionName", c.blue700, c.none, no)
Group.new("cssPseudoClassId", c.red300, c.none, no)
Group.new("cssSelectorOp", c.red400, c.none, no)
Group.new("cssSelectorOp2", c.red400, c.none, no)
Group.new("cssStringQ", c.green500, c.none, no)
Group.new("cssStringQQ", c.green500, c.none, no)
Group.new("cssTagName", c.red500, c.none, no)
Group.new("cssAttr", c.red300, c.none, no)

----------
-- SASS --
----------
Group.new("sassId", c.blue700, c.none, no)
Group.new("sassInclude", c.red400, c.none, no)
Group.new("sassMedia", c.red400, c.none, no)
Group.new("sassMediaOperators", c.grey100, c.none, no)
Group.new("sassMixin", c.red400, c.none, no)
Group.new("sassMixinName", c.blue700, c.none, no)
Group.new("sassMixing", c.red400, c.none, no)
Group.new("sassAmpersand", c.red500, c.none, no)
Group.new("sassClass", c.yellow500, c.none, no)
Group.new("sassControl", c.red400, c.none, no)
Group.new("sassExtend", c.red400, c.none, no)
Group.new("sassFor", c.grey100, c.none, no)
Group.new("sassProperty", c.blue200, c.none, no)
Group.new("sassFunction", c.blue200, c.none, no)
Group.new("scssSelectorName", c.yellow500, c.none, no)

----------------
-- JAVASCRIPT --
----------------
Group.new("jsClassKeyword", g.Keyword, g.Keyword, g.Keyword)
Group.new("jsExtendsKeyword", g.Keyword, g.Keyword, g.Keyword)
Group.new("jsGlobalNodeObjects", g.Keyword, g.Keyword, g.Keyword)
Group.new("jsGlobalObjects", g.Keyword, g.Keyword, g.Keyword)
Group.new("jsFunction", g.Function, g.Function, g.Function)
Group.new("jsObjectProp", g.Identifier, g.Identifier, g.Identifier)
Group.new("jsUndefined", g.ErrorMsg, g.ErrorMsg, g.ErrorMsg)
Group.new("jsObjectBraces", g.Special, g.Special, g.Special)
Group.new("javascriptDocTags", c.grey600, c.none, no)
Group.new("javascriptDocNotation", c.grey600, c.none, no)
Group.new("javascriptDocParamType", c.grey600, c.none, no)
Group.new("javascriptDocNamedParamType", c.grey600, c.none, no)
Group.new("javascriptDocParamName", c.grey600, c.none, no)
Group.new("javaScriptParens", c.grey300, c.none, no)
Group.new("jsClassDefinition", c.yellow500, c.none, no)
Group.new("javascriptArrowFunc", c.yellow500, c.none, no)
Group.new("javascriptClassName", c.yellow500, c.none, no)
Group.new("javascriptClassSuperName", c.yellow500, c.none, no)
Group.new("javascriptGlobal", c.yellow500, c.none, no)
Group.new("jsFuncArgs", c.blue600, c.none, no)
Group.new("jsExportDefault", c.blue600, c.none, b)
Group.new("jsObjectKey", c.blue600, c.none, no)
Group.new("jsFunctionKey", c.blue600, c.none, no)
Group.new("javascriptCacheMethod", c.grey100, c.none, no)
Group.new("javascriptDateMethod", c.grey100, c.none, no)
Group.new("javascriptMathStaticMethod", c.grey100, c.none, no)
Group.new("javascriptURLUtilsProp", c.grey100, c.none, no)
Group.new("jsFuncBraces", c.blue600, c.none, no)
Group.new("jsClassBlock", c.blue600, c.none, no)
Group.new("jsFuncArgs", c.blue600, c.none, no)
Group.new("jsStorageClass", c.blue600, c.none, no)
Group.new("jsxRegion", c.blue600, c.none, no)
Group.new("javaScriptMember", c.blue600, c.none, no)
Group.new("jsObjectValue", c.green500, c.none, no)
Group.new("javaScriptIdentifier", c.red500, c.none, no)
Group.new("jsParens", c.red500, c.none, no)
Group.new("javascriptAsyncFuncKeyword", c.red500, c.none, b)
Group.new("jsBracket", c.red500, c.none, no)
Group.new("jsObjectColon", c.red500, c.none, no)
Group.new("javascriptAwaitFuncKeyword", c.red500, c.none, b)
Group.new("javascriptOperator", c.red500, c.none, no)
Group.new("javascriptForOperator", c.red500, c.none, no)
Group.new("javascriptYield", c.red500, c.none, no)
Group.new("javascriptExceptions", c.red500, c.none, no)
Group.new("javascriptMessage", c.red500, c.none, no)
Group.new("jsFutureKeys", c.red300, c.none, b)
Group.new("jsFuncParens", c.red300, c.none, no)
Group.new("javascriptVariable", c.red300, c.none, no)
Group.new("javascriptHeadersMethod", c.grey100, c.none, no)
Group.new("javascriptObjectLabel", c.grey100, c.none, no)
Group.new("javascriptPropertyName", c.grey100, c.none, no)
Group.new("javascriptLogicSymbols", c.grey100, c.none, no)
Group.new("jsVariableDef", c.grey100, c.none, no)
Group.new("javascriptGlobalMethod", c.grey100, c.none, no)
Group.new("javaScriptBraces", c.grey100, c.none, no)
Group.new("javascriptNodeGlobal", c.grey100, c.none, no)
Group.new("javascriptBOMWindowProp", c.grey100, c.none, no)
Group.new("javascriptArrayMethod", c.grey100, c.none, no)
Group.new("javascriptArrayStaticMethod", c.grey100, c.none, no)
Group.new("javascriptIdentifier", c.red300, c.none, no)
Group.new("javascriptClassSuper", c.red300, c.none, no)
Group.new("javascriptClassStatic", c.red300, c.none, no)
Group.new("javaScriptNumber", c.red400, c.none, no)
Group.new("javaScriptNull", c.red400, c.none, no)
Group.new("jsNull", c.red400, c.none, no)
Group.new("javascriptImport", c.blue200, c.none, no)
Group.new("javascriptTemplateSB", c.blue200, c.none, no)
Group.new("jsTemplateBraces", c.blue200, c.none, no)
Group.new("javascriptFuncKeyword", c.blue200, c.none, no)
Group.new("javascriptEndColons", c.grey100, c.none, no)
Group.new("javascriptFuncArg", c.grey100, c.none, no)
Group.new("javascriptLabel", c.grey100, c.none, no)
Group.new("javascriptBrackets", c.grey100, c.none, no)
Group.new("javascriptTemplateSubstitution", c.grey100, c.none, no)
Group.new("javascriptStringMethod", c.grey100, c.none, no)
Group.new("javascriptBOMWindowMethod", c.grey100, c.none, no)
Group.new("javascriptAsyncFunc", c.blue200, c.none, no)
Group.new("javascriptClassKeyword", c.blue200, c.none, no)
Group.new("javascriptClassExtends", c.blue200, c.none, no)
Group.new("javascriptDefault", c.blue200, c.none, no)
Group.new("javaScriptFunction", c.blue200, c.none, no)
Group.new("javascriptExport", c.blue200, c.none, no)
Group.new("javascriptDOMElemAttrs", c.grey100, c.none, no)
Group.new("javascriptDOMEventMethod", c.grey100, c.none, no)
Group.new("javascriptDOMNodeMethod", c.grey100, c.none, no)
Group.new("javascriptDOMStorageMethod", c.grey100, c.none, no)
Group.new("javascriptBOMNavigatorProp", c.grey100, c.none, no)
Group.new("javascriptDOMDocMethod", c.grey100, c.none, no)
Group.new("javascriptDOMDocProp", c.grey100, c.none, no)
Group.new("javascriptBOMLocationMethod", c.grey100, c.none, no)

----------------
-- TYPESCRIPT --
----------------
Group.new("typeScriptDocParam", g.Comment, g.Comment, g.Comment)
Group.new("typeScriptDocTags", g.vimCommentTitle, g.vimCommentTitle, g.vimCommentTitle)
Group.new("typeScriptGlobalObjects", g.Keyword, g.Keyword, g.Keyword)
Group.new("typeScriptFuncKeyword", g.Function, g.Function, g.Function)
Group.new("typeScriptIdentifier", g.Identifier, g.Identifier, g.Identifier)
Group.new("typeScriptBraces", c.red500, c.none, no)
Group.new("typeScriptEndColons", c.grey100, c.none, no)
Group.new("typeScriptDOMObjects", c.grey100, c.none, no)
Group.new("typeScriptParens", c.blue600, c.none, no)
Group.new("typeScriptOpSymbols", g.Operator, g.Operator, g.Operator)
Group.new("typeScriptHtmlElemProperties", g.Special, g.Special, g.Special)
Group.new("typeScriptNull", c.red400, c.none, b)
Group.new("typeScriptInterpolationDelimiter", c.blue200, c.none, no)
Group.new("typeScriptReserved", c.blue200, c.none, no)
Group.new("typeScriptLabel", g.Label, g.Label, g.Label)
Group.new("typeScriptAjaxMethods", g.Function, g.Function, g.Function)
Group.new("typeScriptLogicSymbols", c.grey100, c.none, no)
Group.new("typeScriptDocSeeTag", g.Comment, g.Comment, g.Comment)

----------
-- JSON --
----------
Group.new("jsonKeyword", c.red500, c.none, no)
Group.new("jsonNumber", c.red300, c.none, no)
Group.new("jsonStringSQError", c.red500, c.none, r)
Group.new("jsonNumError", c.red500, c.none, r)
Group.new("jsonQuote", c.grey600, c.none, no)
Group.new("jsonTrailingCommaError", c.red500, c.none, r)
Group.new("jsonMissingCommaError", c.red500, c.none, r)
Group.new("jsonNoQuotesError", c.red500, c.none, r)
Group.new("jsonString", c.green500, c.none, no)
Group.new("jsonBoolean", c.red400, c.none, no)
Group.new("jsonCommentError", c.grey100, c.none, no)
Group.new("jsonSemicolonError", c.red500, c.none, r)

---------
-- PHP --
---------
Group.new("phpClass", c.yellow500, c.none, no)
Group.new("phpFunction", c.blue700, c.none, no)
Group.new("phpFunctions", c.blue700, c.none, no)
Group.new("phpInclude", c.red400, c.none, no)
Group.new("phpKeyword", c.red400, c.none, no)
Group.new("phpParent", c.grey100, c.none, no)
Group.new("phpType", c.red400, c.none, no)
Group.new("phpSuperGlobals", c.red500, c.none, no)

----------
-- RUST --
----------
Group.new("rustCommentLineDocError", c.grey500, c.none, no)
Group.new("rustCommentBlock", c.grey500, c.none, no)
Group.new("rustDeriveTrait", c.green500, c.none, no)
Group.new("SpecialComment", c.grey500, c.none, no)
Group.new("rustCommentLine", c.grey500, c.none, no)
Group.new("rustCommentBlockDoc", c.grey500, c.none, no)
Group.new("rustExternCrate", c.red500, c.none, b)
Group.new("rustIdentifier", c.blue700, c.none, no)
Group.new("rustCommentLineDoc", c.grey500, c.none, no)
Group.new("rustCommentBlockDocError", c.grey500, c.none, no)

-----------
-- C/C++ --
-----------
Group.new("cType", c.blue700, c.none, no)
Group.new("cStorageClass", c.red400, c.none, no)
Group.new("cStructure", c.blue200, c.none, no)
Group.new("cInclude", c.red400, c.none, no)
Group.new("cppStructure", c.red400, c.none, no)
Group.new("cppModifier", c.red400, c.none, no)
Group.new("cppOperator", c.red400, c.none, no)
Group.new("cppAccess", c.red400, c.none, no)
Group.new("cppStatement", c.red400, c.none, no)
Group.new("cppConstant", c.red500, c.none, no)
Group.new("cTODO", c.red400, c.none, no)
Group.new("cConstant", c.red300, c.none, no)
Group.new("cSpecial", c.blue200, c.none, no)
Group.new("cSpecialCharacter", c.blue200, c.none, no)
Group.new("cString", c.green500, c.none, no)
Group.new("cppType", c.red400, c.none, no)
Group.new("cppStorageClass", c.red400, c.none, no)
Group.new("cPreCondit", c.red400, c.none, no)
Group.new("cPreConditMatch", c.red400, c.none, no)
Group.new("cOperator", c.red400, c.none, no)
Group.new("cStatement", c.red400, c.none, no)
Group.new("cCppString", c.green500, c.none, no)

-----------
-- SPELL --
-----------
Group.new("SpellBad", c.red500, c.none)
Group.new("SpellCap", c.yellow500, c.none)
Group.new("SpellLocal", c.blue500, c.none)
Group.new("SpellRare", c.green500, c.none)

------------
-- ELIXIR --
------------
Group.new("elixirModuleDeclaration", c.red300, c.none, no)
Group.new("elixirOperator", c.red300, c.none, no)
Group.new("elixirModuleDefine", c.red600, c.none, no)
Group.new("elixirDocString", c.green700, c.none, no)
Group.new("elixirInclude", c.red500, c.none, no)
Group.new("elixirAlias", c.yellow500, c.none, no)
Group.new("elixirAtom", c.blue200, c.none, no)
Group.new("elixirBlockDefinition", c.red400, c.none, no)

---------
-- VIM --
---------
Group.new("vimSep", c.grey600, c.none, no)
Group.new("vimCommand", c.red400, c.none, no)
Group.new("vimCommentTitle", c.grey500, c.none, b)
Group.new("vimLineComment", c.grey500, c.none, i)
Group.new("vimParenSep", c.grey600, c.none, no)
Group.new("vimFunction", c.blue200, c.none, no)
Group.new("vimFuncName", c.red400, c.none, no)
Group.new("vimHighlight", c.blue700, c.none, no)
Group.new("vimUserFunc", c.blue200, c.none, no)
Group.new("vimVar", c.red500, c.none, no)
Group.new("vimLet", c.blue600, c.none, no)
Group.new("vimNorm", c.blue600, c.none, no)
Group.new("vimBracket", c.grey100, c.none, no)
Group.new("vimMapModKey", c.red300, c.none, no)
Group.new("vimNotation", c.red300, c.none, no)
Group.new("vimGroup", c.blue600, c.none, no)
Group.new("vimSep", c.grey600, c.none, no)
Group.new("vimContinue", c.yellow500, c.none, no)
Group.new("vimSetSep", c.grey600, c.none, no)
Group.new("vimHiGroup", g.Type, g.Type, g.Type)
Group.new("vimFunction", g.Function, g.Function, g.Function)
Group.new("vimFuncSID", g.Function, g.Function, g.Function)
Group.new("vimCommentTitle", c.blue600, c.none, b)
Group.new("vimCommand", c.blue200, c.none, b)

---------
-- ZSH --
---------
Group.new("zshSubst", c.red500, c.none, no)
Group.new("zshCommands", c.grey100, c.none, no)
Group.new("zshKeyword", c.red400, c.none, no)
Group.new("zshTypes", c.red400, c.none, no)
Group.new("zshDeref", c.red500, c.none, no)
Group.new("zshShortDeref", c.red500, c.none, no)
Group.new("zshVariableDef", c.red300, c.none, no)
Group.new("zshSubstDelim", c.grey500, c.none, no)
Group.new("zshFunction", c.blue200, c.none, no)

---------
-- LUA --
---------
Group.new("luaFunction", c.blue200, c.none, no)
Group.new("luaTable", c.red300, c.none, no)
Group.new("luaIn", c.red500, c.none, no)

--------------------------------------------------------------------------
--                           PLUGINS SETTINGS                            -
--------------------------------------------------------------------------

---------------
-- TELESCOPE --
---------------
Group.new("TelescopeNormal", c.grey100, c.none, no)
Group.new("TelescopeSelection", c.grey100, c.green700, b)
Group.new("TelescopeSelectionCaret", c.red500, c.none, no)
Group.new("TelescopeMultiSelection ", c.green700, c.none, no)
Group.new("TelescopeBorder", c.green700, c.none, no)
Group.new("TelescopePromptBorder", c.green700, c.none, no)
Group.new("TelescopeResultsBorder", c.green700, c.none, no)
Group.new("TelescopePreviewBorder", c.green700, c.none, no)
Group.new("TelescopeMatching ", c.blue500, c.none, no)
Group.new("TelescopePromptPrefix", c.green700, c.none, no)
Group.new("TelescopePrompt", c.green700, c.none, no)

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
