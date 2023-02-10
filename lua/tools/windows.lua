--------------- Windows Settings --------------

require("interface")

---------- Windows Functions

local windows = {}

function windows.colors()
	highlight("StatusLine", { link = "BaseThirdBelow", clear = true })
	highlight("StatusLineNC", { link = "BaseThirdBelowBaseThirdAbove", clear = true })

	highlight("VertSplit", { link = "BaseThirdBelowBaseFirstAbove", clear = true })
	highlight("WinSeparator", { link = "BaseThirdBelowBaseFirstAbove", clear = true })
	highlight("EndOfBuffer", { link = "BaseSixthAbove", clear = true })

	highlight("CursorLine", { link = "BaseFourthBelow", clear = true })
	highlight("CursorLineNr", { link = "BaseThirdBelow", clear = true })

	highlight("SignColumn", { link = "BaseThirdBelow", clear = true })

	highlight("Visual", { link = "BaseFifthBelow", clear = true })

	highlight("FoldColumn", { link = "BaseThirdBelowBaseEighthAbove", clear = true })

	highlight("Pmenu", { link = "BaseThirdBelowCaseThirdAbove", clear = true })
	highlight("PmenuSel", { link = "BlueSecondBelowBaseFifthAbove", clear = true })
	highlight("PmenuSbar", { link = "BaseFifthBelow", clear = true })
	highlight("PmenuThumb", { link = "BaseSeventhBelow", clear = true })

	highlight("FloatBorder", { link = "BaseTenthAbove", clear = true })
	highlight("NormalFloat", { link = "BaseThirdAboveCaseThirdAbove", clear = true })

	highlight("Search", { link = "BaseSixthBelow" })
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
