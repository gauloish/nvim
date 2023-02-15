--------------- Git Signs ---------------

require("interface")

local themes = require("tools/themes")
local painter = require("tools/painter")

---------- Verification Step

local modules = dependencies({ "gitsigns" })

if not modules then
	return
end

local signs = modules("gitsigns")

---------- Git Signs Functions

local function colors()
	local palette = themes.colors()

	local red = {
		palette.red[2],
		painter.opacity(palette.base[3], palette.red[2], 10),
		painter.opacity(palette.base[3], palette.red[2], 50),
	}
	local green = {
		palette.green[2],
		painter.opacity(palette.base[3], palette.green[2], 10),
		painter.opacity(palette.base[3], palette.green[2], 50),
	}
	local blue = {
		palette.blue[2],
		painter.opacity(palette.base[3], palette.blue[2], 10),
		painter.opacity(palette.base[3], palette.blue[2], 50),
	}

	highlight("GitSignsAdd", { fg = green[1] })
	highlight("GitSignsAddNr", { fg = green[1] })
	highlight("GitSignsAddLn", { bg = green[2] })
	highlight("GitSignsAddPreview", { fg = green[1] })
	highlight("GitSignsStagedAdd", { fg = green[3] })
	highlight("GitSignsStagedAddNr", { fg = green[1] })
	highlight("GitSignsStagedAddLn", { bg = green[2] })

	highlight("GitSignsChange", { fg = blue[1] })
	highlight("GitSignsChangeNr", { fg = blue[1] })
	highlight("GitSignsChangeLn", { bg = blue[2] })
	highlight("GitSignsChangePreview", { fg = blue[1] })
	highlight("GitSignsStagedChange", { fg = blue[3] })
	highlight("GitSignsStagedChangeNr", { fg = blue[1] })
	highlight("GitSignsStagedChangeLn", { bg = blue[2] })

	highlight("GitSignsChangedelete", { fg = blue[1] })
	highlight("GitSignsChangedeleteNr", { fg = blue[1] })
	highlight("GitSignsChangedeleteLn", { bg = blue[2] })
	highlight("GitSignsChangedeletePreview", { fg = blue[1] })
	highlight("GitSignsStagedChangedelete", { fg = blue[3] })
	highlight("GitSignsStagedChangedeleteNr", { fg = blue[1] })
	highlight("GitSignsStagedChangedeleteLn", { bg = blue[2] })

	highlight("GitSignsDelete", { fg = red[1] })
	highlight("GitSignsDeleteNr", { fg = red[1] })
	highlight("GitSignsDeleteLn", { bg = red[2] })
	highlight("GitSignsDeletePreview", { fg = red[1] })
	highlight("GitSignsStagedDelete", { fg = red[3] })
	highlight("GitSignsStagedDeleteNr", { fg = red[1] })
	highlight("GitSignsStagedDeleteLn", { bg = red[2] })

	highlight("GitSignsTopdelete", { fg = red[1] })
	highlight("GitSignsTopdeleteNr", { fg = red[1] })
	highlight("GitSignsTopdeleteLn", { bg = red[2] })
	highlight("GitSignsTopdeletePreview", { fg = red[1] })
	highlight("GitSignsStagedTopdelete", { fg = red[3] })
	highlight("GitSignsStagedTopdeleteNr", { fg = red[1] })
	highlight("GitSignsStagedTopdeleteLn", { bg = red[2] })
end

---------- Git Signs Setup

signs.setup({
	signs = {
		add = { text = "+" },
		change = { text = "~" },
		delete = { text = "-" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
		untracked = { text = ":" },
	},
	numhl = true,
	linehl = true,
	current_line_blame = true,
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol",
		delay = 1000,
		ignore_whitespace = false,
	},
	current_line_blame_formatter = "<author>, <author_time:%d-%m-%Y>: <summary>",
	update_debounce = 1000,
	max_file_length = 50000,
	preview_config = {
		border = "rounded",
		style = "minimal",
		relative = "cursor",
		row = 0,
		col = 1,
	},
	on_attach = function(_)
		nnoremap("<a-g>vh", ":Gitsigns preview_hunk")
		nnoremap("<a-g>ph", ":Gitsigns prev_hunk")
		nnoremap("<a-g>nh", ":Gitsigns next_hunk")
		nnoremap("<a-g>lh", ":Gitsigns toggle_linehl")
	end,
})

---------- Git Signs Auto Commands

augroup("GitSignsColors")
do
	autocmd("GitSignsColors", "ColorScheme", "*", colors)
	autocmd("GitSignsColors", "VimEnter", "*", colors)
end
