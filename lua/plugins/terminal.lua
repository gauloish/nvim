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
	size = function(screen)
		if screen.direction == "horizontal" then
			return get("lines") * 0.2
		elseif screen.direction == "vertical" then
			return get("columns") * 0.4
		end
	end,
	hide_numbers = true,
	highlights = {
		Normal = { link = "TerminalNormal" },
		NormalFloat = { link = "TerminalNormalFloat" },
		FloatBorder = { link = "TerminalFloatBorder" },
	},
	float_opts = {
		border = "curved",
		width = function(_)
			return get("columns") * 0.6
		end,
		height = function(_)
			return get("lines") * 0.6
		end,
	},
})

---------- Terminal Functions

-- Functions

---------- Terminal Auto Commands

-- Auto Commands

---------- Terminal Mappings

-- Mappings
