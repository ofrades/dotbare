local stylua = { formatCommand = "stylua -", formatStdin = true }
local selene = {
	lintCommand = "selene --display-style quiet -",
	lintIgnoreExitCode = true,
	lintStdin = true,
	lintFormats = { "%f:%l:%c: %tarning%m", "%f:%l:%c: %tarning%m" },
}

local prettier = {
	formatCommand = "./node_modules/.bin/prettier --stdin --stdin-filepath ${INPUT}",
	formatStdin = true,
}

local eslint = {
	lintCommand = "eslint_d -f visualstudio --stdin --stdin-filename ${INPUT}",
	lintIgnoreExitCode = true,
	lintStdin = true,
	lintFormats = { "%f(%l,%c): %tarning %m", "%f(%l,%c): %trror %m" },
}

local shellcheck = {
	lintCommand = "shellcheck -f gcc -x -",
	lintStdin = true,
	lintFormats = {
		"%f=%l:%c: %trror: %m",
		"%f=%l:%c: %tarning: %m",
		"%f=%l:%c: %tote: %m",
	},
}

local markdownlint = {
	lintCommand = "markdownlint -s",
	lintStdin = true,
	lintFormats = { "%f:%l:%c %m" },
}

local fish = { formatCommand = "fish_indent", formatStdin = true }

local eslintPrettier = { prettier, eslint }

local config = {
	init_options = { documentFormatting = true },
	settings = {
		rootMarkers = { "package.json", ".git" },
		languages = {
			lua = { stylua, selene },
			typescript = { prettier },
			javascript = eslintPrettier,
			typescriptreact = eslintPrettier,
			javascriptreact = eslintPrettier,
			["typescript.tsx"] = eslintPrettier,
			["javascript.tsx"] = eslintPrettier,
			yaml = { prettier },
			json = { prettier },
			html = { prettier },
			scss = { prettier },
			css = { prettier },
			markdown = { prettier, markdownlint },
			sh = { shellcheck },
			fish = { fish },
		},
	},
}

config.filetypes = {}
for ft, _ in pairs(config.settings.languages) do
	table.insert(config.filetypes, ft)
end

local formatted_languages = {}

for lang, tools in pairs(config.settings.languages) do
	for _, tool in pairs(tools) do
		if tool.formatCommand then
			formatted_languages[lang] = true
		end
	end
end
