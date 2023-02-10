-------------- Windows Bar Configuration ---------------

require("interface")

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

---------- Other Configurations

winbar.setup({
	attach_navic = true,
	create_autocmd = false,
	include_buftypes = { "" },
	modifiers = {
		dirname = ":~:.",
		basename = "",
	},
	show_dirname = false,
	show_modified = true,
	show_navic = true,
	custom_section = function()
		return ""
	end,
	theme = {
		normal = { link = "BaseTenthAbove" },

		ellipsis = { link = "BaseSixthAbove" },
		separator = { link = "BaseSixthAbove" },
		modified = { link = "BaseSixthAbove" },

		--dirname = { fg = "#737aa2" },
		dirname = { link = "Normal" },
		basename = { link = "Normal" },
		--context = {},

		context_class = { link = "GreenSecondAbove" },
		context_enum = { link = "GreenSecondAbove" },
		context_struct = { link = "GreenSecondAbove" },
		context_interface = { link = "GreenSecondAbove" },
		context_constructor = { link = "GreenSecondAbove" },

		context_method = { link = "BlueSecondAbove" },
		context_field = { link = "BlueSecondAbove" },
		context_enum_member = { link = "BlueSecondAbove" },
		context_property = { link = "BlueSecondAbove" },
		context_event = { link = "BlueSecondAbove" },
		context_operator = { link = "BlueSecondAbove" },
		context_function = { link = "BlueSecondAbove" },

		context_package = { link = "YellowSecondAbove" },
		context_module = { link = "YellowSecondAbove" },
		context_namespace = { link = "YellowSecondAbove" },
		context_key = { link = "YellowSecondAbove" },

		context_type_parameter = { link = "CyanSecondAbove" },
		context_object = { link = "CyanSecondAbove" },
		context_variable = { link = "CyanSecondAbove" },
		context_constant = { link = "CyanSecondAbove" },
		context_string = { link = "CyanSecondAbove" },
		context_number = { link = "CyanSecondAbove" },
		context_boolean = { link = "CyanSecondAbove" },
		context_array = { link = "CyanSecondAbove" },
		context_null = { link = "CyanSecondAbove" },

		context_file = { link = "MagentaSecondAbove" },
	},
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

augroup("WinbarUpdate")
do
	-- autocmd("WinbarUpdate", "WinResized", "*", update)
	-- autocmd("WinbarUpdate", "VimEnter", "*", update)
	-- autocmd("WinbarUpdate", "WinEnter", "*", update)
	autocmd("WinbarUpdate", "BufWinEnter", "*", update)
	autocmd("WinbarUpdate", "CursorHold", "*", update)
	autocmd("WinbarUpdate", "InsertLeave", "*", update)

	autocmd("WinbarUpdate", "BufWritePost", "*", update)
	autocmd("WinbarUpdate", "TextChanged", "*", update)
	autocmd("WinbarUpdate", "TextChangedI", "*", update)
end
