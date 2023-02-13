--------------- Windows Settings --------------

require("interface")

local themes = require("tools/themes")

---------- Windows Functions

local windows = {}

function windows.colors()
	local palette = themes.colors()

	highlight("StatusLine", { bg = palette.base[3], clear = true })
	highlight("StatusLineNC", { bg = palette.base[3], fg = palette.base[3], clear = true })

	highlight("VertSplit", { bg = palette.base[3], fg = palette.base[1], clear = true })
	highlight("WinSeparator", { bg = palette.base[3], fg = palette.base[1], clear = true })
	highlight("EndOfBuffer", { fg = palette.base[6], clear = true })

	highlight("CursorLine", { bg = palette.base[4], clear = true })
	highlight("CursorLineNr", { bg = palette.base[3], clear = true })

	highlight("SignColumn", { bg = palette.base[3], clear = true })

	highlight("Visual", { bg = palette.base[5], clear = true })

	highlight("FoldColumn", { bg = palette.base[3], fg = palette.case[8], clear = true })

	highlight("Pmenu", { bg = palette.base[3], fg = palette.case[3], clear = true })
	highlight("PmenuSel", { bg = palette.blue[2], fg = palette.base[5], clear = true })
	highlight("PmenuSbar", { bg = palette.base[5], clear = true })
	highlight("PmenuThumb", { bg = palette.base[7], clear = true })

	highlight("FloatBorder", { fg = palette.base[10], clear = true })
	highlight("NormalFloat", { bg = palette.base[3], fg = palette.case[3], clear = true })

	highlight("Search", { bg = palette.base[6], clear = true })
end

function windows.cursor(value)
	if value then
		highlight("Cursor", { blend = 0, reverse = true })

		execute("set guicursor-=n-v:Cursor/lCursor")
	else
		highlight("Cursor", { blend = 100, reverse = true })

		execute("set guicursor+=n-v:Cursor/lCursor")
	end
end

function windows.cursorline(value)
	if value then
		setwindow("cursorline", true)
	else
		setwindow("cursorline", false)
	end
end

function windows.number(value)
	if value then
		setwindow("number", true)
	else
		setwindow("number", false)
	end
end

function windows.relativenumber(value)
	if value then
		setwindow("relativenumber", true)
	else
		setwindow("relativenumber", false)
	end
end

function windows.foldcolumn(value)
	if value then
		setwindow("foldcolumn", "1")
	else
		setwindow("foldcolumn", "0")
	end
end

function windows.enter()
	local options = {
		cursor = {
			NvimTree = true,
			Buffers = true,
			mason = true,
		},
		cursorline = {
			Startup = true,
			Buffers = true,
			TelescopePrompt = true,
			Search = true,
		},
		number = {
			Startup = true,
			NvimTree = true,
			Buffers = true,
			TelescopePrompt = true,
			mason = true,
			Search = true,
		},
		relativenumber = {
			Startup = true,
			Buffers = true,
			NvimTree = true,
			TelescopePrompt = true,
			mason = true,
			Search = true,
		},
		foldcolumn = {
			Startup = true,
			Buffers = true,
			NvimTree = true,
			TelescopePrompt = true,
			mason = true,
			Search = true,
		},
	}

	local filetype = get("filetype")

	for option, _ in pairs(options) do
		windows[option](not options[option][filetype])
	end
end

function windows.leave()
	windows.cursorline(false)
end

function windows.schedule()
	vim.schedule(windows.enter)
end

----------- Windows Auto Commands and Augroups

augroup("WindowsColors")
do
	autocmd("WindowsColors", "ColorScheme", "*", windows.colors)
	autocmd("WindowsColors", "VimEnter", "*", windows.colors)
end

augroup("WindowsOptions")
do
	autocmd("WindowsOptions", "VimEnter", "*", windows.enter)
	autocmd("WindowsOptions", "BufEnter", "*", windows.enter)
	autocmd("WindowsOptions", "WinEnter", "*", windows.enter)

	autocmd("WindowsOptions", "VimLeave", "*", windows.leave)
	autocmd("WindowsOptions", "BufLeave", "*", windows.leave)
	autocmd("WindowsOptions", "WinLeave", "*", windows.leave)

	autocmd("WindowsOptions", "VimEnter", "*", windows.schedule)
	autocmd("WindowsOptions", "BufEnter", "*", windows.schedule)
	autocmd("WindowsOptions", "WinEnter", "*", windows.schedule)
end
