--------------- Windows Bar ---------------

require("interface")

local themes = require("tools/themes")

---------- Verification Step

local modules = dependencies({
	"barbecue",
	"barbecue.ui",
})

if not modules then
	return
end

local winbar = modules("barbecue")
local util = modules("barbecue.ui")

---------- Windows Bar Setup

winbar.setup({
	create_autocmd = false,
	show_dirname = false,
	show_modified = true,
	theme = {},
	symbols = {
		modified = "○", -- "●",
		ellipsis = "...",
		separator = "",
	},
	kinds = {
		File = "",
		Module = "",
		Namespace = "",
		Package = "",
		Class = "ﰩ",
		Method = "",
		Property = "",
		Field = "",
		Constructor = "",
		Enum = "",
		Interface = "",
		Function = "",
		Variable = "φ", -- "",
		Constant = "λ", -- "",
		String = "@",
		Number = "#",
		Boolean = "β",
		Array = "",
		Object = "",
		Key = "▢",
		Null = "○",
		EnumMember = "",
		Struct = "",
		Event = "כּ",
		Operator = "◎",
		TypeParameter = "", --"",
	},
})

---------- Windows Bar Functions

local function update()
	local exclude = {
		["Startup"] = true,
		["Buffers"] = true,
		["NvimTree"] = true,
		[""] = true,
	}

	for _, window in pairs(vim.api.nvim_list_wins()) do
		local buffer = eval["getwininfo"](window)[1].bufnr

		local filetype = getbuffer("filetype", buffer)

		if exclude[filetype] then
			setwindow("winbar", "", window)
		else
			util.update(window)
		end
	end
end

local function colors()
	local palette = themes.colors()

	highlight("barbecue_normal", { fg = palette.base[10] })
	highlight("barbecue_context", { fg = palette.base[10] })

	highlight("barbecue_ellipsis", { fg = palette.base[6] })
	highlight("barbecue_separator", { fg = palette.base[6] })
	highlight("barbecue_modified", { fg = palette.base[6] })

	highlight("barbecue_dirname", { fg = palette.case[6] })
	highlight("barbecue_basename", { fg = palette.case[6] })

	highlight("barbecue_context_class", { fg = palette.green[2] })
	highlight("barbecue_context_enum", { fg = palette.green[2] })
	highlight("barbecue_context_struct", { fg = palette.green[2] })
	highlight("barbecue_context_interface", { fg = palette.green[2] })
	highlight("barbecue_context_constructor", { fg = palette.green[2] })

	highlight("barbecue_context_method", { fg = palette.blue[2] })
	highlight("barbecue_context_field", { fg = palette.blue[2] })
	highlight("barbecue_context_enum_member", { fg = palette.blue[2] })
	highlight("barbecue_context_property", { fg = palette.blue[2] })
	highlight("barbecue_context_event", { fg = palette.blue[2] })
	highlight("barbecue_context_operator", { fg = palette.blue[2] })
	highlight("barbecue_context_function", { fg = palette.blue[2] })

	highlight("barbecue_context_package", { fg = palette.yellow[2] })
	highlight("barbecue_context_module", { fg = palette.yellow[2] })
	highlight("barbecue_context_namespace", { fg = palette.yellow[2] })
	highlight("barbecue_context_key", { fg = palette.yellow[2] })

	highlight("barbecue_context_type_parameter", { fg = palette.cyan[2] })
	highlight("barbecue_context_object", { fg = palette.cyan[2] })
	highlight("barbecue_context_variable", { fg = palette.cyan[2] })
	highlight("barbecue_context_constant", { fg = palette.cyan[2] })
	highlight("barbecue_context_string", { fg = palette.cyan[2] })
	highlight("barbecue_context_number", { fg = palette.cyan[2] })
	highlight("barbecue_context_boolean", { fg = palette.cyan[2] })
	highlight("barbecue_context_array", { fg = palette.cyan[2] })
	highlight("barbecue_context_null", { fg = palette.cyan[2] })

	highlight("barbecue_context_file", { fg = palette.magenta[2] })
end

---------- Windows Bar Auto Commands

augroup("WinbarUpdate")
do
	autocmd("WinbarUpdate", "BufWinEnter", "*", update)
	autocmd("WinbarUpdate", "CursorHold", "*", update)
	autocmd("WinbarUpdate", "InsertLeave", "*", update)

	autocmd("WinbarUpdate", "BufWritePost", "*", update)
	autocmd("WinbarUpdate", "TextChanged", "*", update)
	autocmd("WinbarUpdate", "TextChangedI", "*", update)
end

augroup("WinbarColors")
do
	autocmd("WinbarColors", "ColorScheme", "*", colors)
	autocmd("WinbarColors", "VimEnter", "*", colors)
end
