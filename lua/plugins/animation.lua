-------------- Animation Configuration ---------------

require("interface")

---------- Verification Step

local modules = dependencies({ "cellular-automaton" })

if not modules then
	return
end

local animation = modules("cellular-automaton")

---------- Mappings to Animation

nnoremap("<F5>", function()
	animation.start_animation("make_it_rain")
end, { silent = true })
