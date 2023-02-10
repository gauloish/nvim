-------------- Plugin Configuration ---------------

require("interface")

---------- Verification Step

local modules = dependencies({ "ufo" })

if not modules then
	return
end

local fold = modules("ufo")

---------- Other Configurations

local handler = function(texts, first, second, width, truncate)
	local line = eval["line"](".")
	local column = eval["col"](".")

	local text = eval["getline"](second)

	local position = 1

	for index = 1, #text do
		local char = text:sub(index, index)

		if char ~= " " and char ~= "	" then -- checking spaces and tabulations!!!
			position = index

			break
		end
	end

	text = text:sub(position, #text)

	eval["cursor"](second, position)

	local group = require("nvim-treesitter-playground.hl-info").get_treesitter_hl()[1]

	if group then
		group = group:match("%* %*%*(.*)%*%*")
	else
		group = eval["synID"](second, position, 1)
	end

	if not group or group == 0 or group == "" then
		group = "Comment"
	end

	table.insert(texts, { " ... ", "BaseTenthAbove" })
	table.insert(texts, { text, group })

	eval["cursor"](line, column)

	return texts
end

local folding = function()
	local line = eval["line"](".")
	local column = eval["col"](".")

	execute("normal! za")

	eval["cursor"](line, column)
end

fold.setup({
	fold_virt_text_handler = handler,
	provider_selector = function(bufnr, filetype, buftype)
		return { "treesitter", "indent" }
	end,
	preview = {
		win_config = {
			winhighlight = "Normal:FloatBorder",
			maxheight = 20,
			winblend = 0,
		},
		mappings = {
			scrollB = "H",
			scrollD = "J",
			scrollU = "K",
			scrollF = "L",
		},
	},
})

nnoremap("<a-f>f", folding)

nnoremap("<a-f>o", fold.openAllFolds)
nnoremap("<a-f>c", fold.closeAllFolds)

nnoremap("<a-f>v", fold.peekFoldedLinesUnderCursor)
