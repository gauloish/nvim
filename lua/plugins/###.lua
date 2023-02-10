-------------- Plugin Configuration ---------------

require(...)

---------- Verification Step

local modules = dependencies({ ... })

if not modules then
	return
end

local module = modules(...)

---------- Other Configurations

--[[
...
--]]
