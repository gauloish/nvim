--------------- Finder ---------------

require("interface")

local themes = require("tools/themes")

---------- Verification Step

local modules = dependencies({ "telescope" })

if not modules then
	return
end

local finder = modules("telescope")

---------- Finder Setup

finder.load_extension("fzf")
finder.load_extension("file_browser")

local actions = finder.extensions.file_browser.actions

finder.setup({
	defaults = {
		preview = {
			treesitter = true,
		},
		prompt_prefix = "  ",
		selection_caret = " ",
	},
	pickers = {
		find_files = {
			hidden = true,
		},
		file_browser = {
			hidden = true,
		},
		live_greps = {
			hidden = true,
		},
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
		file_browser = {
			hijack_netrw = true,
			mappings = {
				["n"] = {
					["a"] = actions.create,
					["y"] = actions.copy,
					["d"] = actions.remove,
					["m"] = actions.move,
					["r"] = actions.rename,
				},
			},
		},
	},
})

---------- Finder Functions

function actions(action)
	if action == "files" then
		execute("cd")
		execute(":Telescope find_files")
	elseif action == "browser" then
		execute(":Telescope file_browser")
	elseif action == "grep" then
		execute(":Telescope live_grep")
	elseif action == "buffers" then
		execute(":Telescope buffers")
	elseif action == "tags" then
		execute(":Telescope help_tags")
	elseif action == "current" then
		execute(":Telescope current_buffer_fuzzy_find")
	end

	print("Directory: " .. eval["getcwd"]())
end

local function colors()
	local palette = themes.colors()

	highlight("TelescopeSelection", { bg = palette.base[4] }) -- link = "BaseFourthBelow" })
	highlight("TelescopeSelectionCaret", { bg = palette.base[4] }) -- link = "BaseFourthBelow" })

	highlight("TelescopePreviewNormal", { bg = palette.base[3] }) -- link = "BaseThirdBelow" })
	highlight("TelescopeResultsNormal", { bg = palette.base[3] }) -- link = "BaseThirdBelow" })
	highlight("TelescopePromptNormal", { bg = palette.base[3] }) -- link = "BaseThirdBelow" })

	highlight("TelescopePreviewTitle", { fg = palette.case[1] }) -- link = "CaseFirstAbove" })
	highlight("TelescopeResultsTitle", { fg = palette.case[1] }) -- link = "CaseFirstAbove" })
	highlight("TelescopePromptTitle", { fg = palette.case[1] }) -- link = "CaseFirstAbove" })

	highlight("TelescopePreviewBorder", { fg = palette.base[10] }) -- link = "BaseTenthAbove" })
	highlight("TelescopeResultsBorder", { fg = palette.base[10] }) -- link = "BaseTenthAbove" })
	highlight("TelescopePromptBorder", { fg = palette.base[10] }) -- link = "BaseTenthAbove" })

	highlight("TelescopePromptPrefix", { fg = palette.magenta[2] }) -- link = "MagentaSecondAbove" })

	highlight("TelescopeMatching", { fg = palette.cyan[2] }) -- link = "CyanSecondAbove" })
end

---------- Finder Auto Commands

augroup("TelescopeColors")
do
	autocmd("TelescopeColors", "ColorScheme", "*", colors)
	autocmd("TelescopeColors", "VimEnter", "*", colors)
end

---------- Finder Mappings

nnoremap("ff", bundle(actions, "files"), { desc = "Open Telescope Files Finder" })
nnoremap("fm", bundle(actions, "browser"), { desc = "Open Telescope File Browser" })
nnoremap("fg", bundle(actions, "grep"), { desc = "Open Telescope Live Grep" })
nnoremap("fb", bundle(actions, "buffers"), { desc = "Open Telescope Buffers" })
nnoremap("fc", bundle(actions, "current"), { desc = "Open Telescope Buffer Finder" })
--nnoremap('ft', function() actions("tags") end)
