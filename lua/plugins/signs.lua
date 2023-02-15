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
	signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
	numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
	linehl = true, -- Toggle with `:Gitsigns toggle_linehl`
	word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
	watch_gitdir = {
		enable = true,
		interval = 1000,
		follow_files = true,
	},
	attach_to_untracked = true,
	current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
		delay = 1000,
		ignore_whitespace = false,
	},
	current_line_blame_formatter = "<author>, <author_time:%d-%m-%Y>: <summary>",
	sign_priority = 6,
	update_debounce = 1000,
	status_formatter = nil, -- Use default
	max_file_length = 50000, -- Disable if file is longer than this (in lines)
	preview_config = {
		-- Options passed to nvim_open_win
		border = "rounded",
		style = "minimal",
		relative = "cursor",
		row = 0,
		col = 1,
	},
	yadm = {
		enable = false,
	},
})

---------- Git Signs Auto Commands

augroup("GitSignsColors")
do
	autocmd("GitSignsColors", "ColorScheme", "*", colors)
	autocmd("GitSignsColors", "VimEnter", "*", colors)
end
