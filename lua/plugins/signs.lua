-------------- Git Signs --------------

require("interface")

---------- Verification Step

local modules = dependencies({ "gitsigns" })

if not modules then
	return
end

local signs = modules("gitsigns")

---------- Scroll Setup

signs.setup()
