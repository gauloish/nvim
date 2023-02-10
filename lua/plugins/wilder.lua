--------------- Wild Menu --------------

require("interface")

local themes = require("tools/themes")

---------- Verification Step

local modules = dependencies({ "wilder" })

if not modules then
	return
end

local wilder = modules("wilder")

---------- Wild Setup

wilder.setup({
	modes = { ":" },
	next_key = "<tab>",
	previous_key = "<s-tab>",
	accept_key = "<down>",
	reject_key = "<up>",
})

wilder.set_option(
	"renderer",
	wilder.popupmenu_renderer(wilder.popupmenu_palette_theme({
		mode = "float",
		ellipsis = "...",
		left = {
			" ",
			wilder.popupmenu_devicons({
				get_hl = function(context, name, directory, icon)
					return "CaseThirdAbove"
				end,
			}),
		},
		right = {
			" ",
			wilder.popupmenu_scrollbar(),
		},
		highlighter = wilder.basic_highlighter(),
		highlights = {
			border = "BaseTenthAbove",
			default = "WildDefault",
			selected = "WildSelected",
			accent = "WildAccent",
			selected_accent = "WildSelectedAccent",
		},
		border = "rounded",
		prompt_border = { "│", "─", "│" }, --{ "╭", "─", "╮" },
		min_width = "20%",
		max_width = "80%",
		min_height = "0%",
		max_height = "60%",
		prompt_position = "bottom",
		reverse = false,
	}))
)

--[[
wilder.set_option('renderer', wilder.popupmenu_renderer(
	wilder.popupmenu_border_theme({
		mode = 'float',
		ellipsis = '...',
		left = {
			' ', wilder.popupmenu_devicons(),
		},
		right = {
			' ', wilder.popupmenu_scrollbar(),
		},
		highlighter = wilder.basic_highlighter(),
		highlights = {
			border = 'FloatBorder',
			default = 'WildDefault',
			selected = 'WildSelected',
			accent = 'WildAccent',
			selected_accent = 'WildSelectedAccent'
		},
		border = 'rounded',
		min_width = '20%',
		max_width = '60%',
		min_height = '0%',
		max_height = '40%'
	})
))
--]]

---------- Wild Functions

local colors = function()
	themes.verify["update"]()

	highlight("WildDefault", { link = "BaseThirdBelowCaseThirdAbove" })
	highlight("WildSelected", { link = "BaseFifthBelowCaseThirdAbove" })
	highlight("WildAccent", { link = "BaseThirdBelowCyanSecondAbove" })
	highlight("WildSelectedAccent", { link = "BaseFifthBelowCyanSecondAbove" })
end

---------- Wild Auto Commands

augroup("WilderColors")
do
	autocmd("WilderColors", "ColorScheme", "*", colors)
	autocmd("WilderColors", "VimEnter", "*", colors)
end
