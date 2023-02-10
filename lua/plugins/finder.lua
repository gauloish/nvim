--------------- Telescope Configuration ---------------

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
	themes.verify["update"]()

	highlight("TelescopeSelection", { link = "BaseFourthBelow" })
	highlight("TelescopeSelectionCaret", { link = "BaseFourthBelow" })

	highlight("TelescopePreviewNormal", { link = "BaseThirdBelow" })
	highlight("TelescopeResultsNormal", { link = "BaseThirdBelow" })
	highlight("TelescopePromptNormal", { link = "BaseThirdBelow" })

	highlight("TelescopeTitle", { link = "CaseFirstAbove" })
	highlight("TelescopePreviewTitle", { link = "CaseFirstAbove" })
	highlight("TelescopeResultsTitle", { link = "CaseFirstAbove" })
	highlight("TelescopePromptTitle", { link = "CaseFirstAbove" })

	highlight("TelescopeBorder", { link = "BaseTenthAbove" })
	highlight("TelescopePreviewBorder", { link = "BaseTenthAbove" })
	highlight("TelescopeResultsBorder", { link = "BaseTenthAbove" })
	highlight("TelescopePromptBorder", { link = "BaseTenthAbove" })

	highlight("TelescopePromptPrefix", { link = "MagentaSecondAbove" })

	highlight("TelescopeMatching", { link = "CyanSecondAbove" })
end

---------- Finder Auto Commands

augroup("TelescopeColors")
do
	autocmd("TelescopeColors", "ColorScheme", "*", colors)
	autocmd("TelescopeColors", "VimEnter", "*", colors)
end

---------- Finder Maps

nnoremap("ff", bundle(actions, "files"), { desc = "Open Telescope Files Finder" })
nnoremap("fm", bundle(actions, "browser"), { desc = "Open Telescope File Browser" })
nnoremap("fg", bundle(actions, "grep"), { desc = "Open Telescope Live Grep" })
nnoremap("fb", bundle(actions, "buffers"), { desc = "Open Telescope Buffers" })
nnoremap("fc", bundle(actions, "current"), { desc = "Open Telescope Buffer Finder" })
--nnoremap('ft', function() actions("tags") end)
