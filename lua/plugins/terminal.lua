--------------- Terminal ---------------

-- require(...)

---------- Verification Step

local modules = dependencies({ "toggleterm" })

if not modules then
	return
end

local terminal = modules("toggleterm")

---------- Terminal Setup

terminal.setup({
	direction = "float",
	on_open = function(term)
		vim.api.nvim_buf_set_name(term.bufnr, ("Terminal [%s]"):format(term.id))

		setwindow("number", false, term.window)
		setwindow("relativenumber", false, term.window)

		print(getwindow("number", term.window))
	end,
	size = function(screen)
		if screen.direction == "horizontal" then
			return math.floor(get("lines") * 0.2)
		elseif screen.direction == "vertical" then
			return math.floor(get("columns") * 0.4)
		end

		return 10
	end,
	hide_numbers = true,
	highlights = {
		Normal = { link = "TerminalNormal" },
		NormalFloat = { link = "TerminalNormalFloat" },
		FloatBorder = { link = "TerminalFloatBorder" },
	},
	float_opts = {
		border = "curved",
		width = function()
			return math.floor(get("columns") * 0.6)
		end,
		height = function()
			return math.floor(get("lines") * 0.6)
		end,
	},
})

---------- Terminal Functions

-- Functions

---------- Terminal Auto Commands

-- Auto Commands

---------- Terminal Mappings

-- Mappings
