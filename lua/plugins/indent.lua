-------------- Indent Guides --------------

require("interface")
require("general")

local themes = require("tools/themes")

---------- Verification Step

local modules = dependencies({ "indent_blankline" })

if not modules then
	return
end

local indent = modules("indent_blankline")

---------- Indent Setup

indent.setup({
	show_current_context = true,
	context_patterns = {
		"class",
		"function",
		"method",
		"statement",
		"declaration",
		"expression",
		"block",
		"if",
		"for",
		"while",
	},
	filetype_exclude = {
		"help",
		"Startup",
		"Buffers",
		"NvimTree",
		"TelescopePrompt",
	},
})

---------- Indent Functions

local function colors()
	themes.verify["update"]()

	highlight("IndentBlankLineChar", { link = "BaseFourthAbove" })
	highlight("IndentBlankLineContextChar", { link = "BaseSixthAbove" })
end

local function delete()
	unautocmd("IndentBlanklineAutogroup", "ColorScheme", "*")
end

---------- Indent Auto Commands

augroup("IndentColors")
do
	autocmd("IndentColors", "ColorScheme", "*", colors)
	autocmd("IndentColors", "VimEnter", "*", colors)
	autocmd("IndentColors", "VimEnter", "*", delete)
end
