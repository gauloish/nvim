--------------- File Explorer ---------------

require("interface")
require("general")

local themes = require("tools/themes")

---------- Verification Step

local modules = dependencies({
	"nvim-tree",
	"nvim-tree.config",
})

if not modules then
	return
end

local explorer = modules("nvim-tree")
local action = modules("nvim-tree.config").nvim_tree_callback

---------- File Explorer Setup

local shortkeys = {
	{ key = "<enter>", cb = action("edit") },
	{ key = "<tab>", cb = action("preview") },
	{ key = "<bs>", cb = action("close_node") },
	{ key = "<", cb = action("dir_up") },
	{ key = ">", cb = action("cd") },
	{ key = "H", cb = action("prev_sibling") },
	{ key = "L", cb = action("next_sibling") },
	{ key = "J", cb = action("last_sibling") },
	{ key = "K", cb = action("first_sibling") },
	{ key = "a", cb = action("create") },
	{ key = "d", cb = action("remove") },
	{ key = "c", cb = action("cut") },
	{ key = "y", cb = action("copy") },
	{ key = "p", cb = action("paste") },
	{ key = "r", cb = action("rename") },
	{ key = "<c-n>", cb = action("copy_name") },
	{ key = "<c-p>", cb = action("copy_path") },
	{ key = "<c-a>", cb = action("copy_absolute_path") },
	{ key = "<c-v>", cb = action("vsplit") },
	{ key = "<c-h>", cb = action("split") },
	{ key = "<c-r>", cb = action("refresh") },
	{ key = "s", cb = action("system_open") },
	{ key = "m", cb = action("toggle_help") },
}

explorer.setup({
	disable_netrw = true,
	hijack_netrw = true,
	open_on_setup = false,
	ignore_ft_on_setup = {},
	open_on_tab = false,
	hijack_cursor = false,
	update_cwd = false,
	diagnostics = {
		enable = false,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	update_focused_file = {
		enable = false,
		update_cwd = false,
		ignore_list = {},
	},
	system_open = {
		cmd = nil,
		args = {},
	},
	view = {
		width = 30,
		side = "left",
		mappings = {
			custom_only = true,
			list = shortkeys,
		},
	},
	renderer = {
		root_folder_modifier = ":t",
		indent_markers = {
			enable = true,
		},
		icons = {
			webdev_colors = false,
			glyphs = {
				default = "",
				symlink = "",
				git = {
					unstaged = "×",
					staged = "+",
					unmerged = "",
					renamed = "~",
					untracked = "*",
					deleted = "-",
					ignored = "•",
				},
				folder = {
					arrow_open = "",
					arrow_closed = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
			},
		},
	},
	filters = {
		dotfiles = false,
		custom = {},
	},
	git = {
		enable = true,
		ignore = false,
		timeout = 500,
	},
})

---------- File Explorer Functions

local function resize()
	local begin = eval["line"]("w0")
	local ends = eval["line"]("w$")

	local size = 0
	local length = 0

	for line = begin, ends do
		length = #eval["getline"](line)

		if size < length then
			size = length
		end
	end

	size = size + 2

	if size < 32 then
		size = 32
	end

	execute("vertical resize " .. size)
end

local function rename()
	if getbuffer("filetype") == "NvimTree" then
		execute("file Files")
	end
end

---------- File Explorer Auto Commands

augroup("ResizeExplorer")
do
	autocmd("ResizeExplorer", "WinScrolled", "Files", resize)
	autocmd("ResizeExplorer", "TextChanged", "Files", resize)
	autocmd("ResizeExplorer", "CursorMoved", "Files", resize)
end

augroup("ExplorerRename")
do
	autocmd("ExplorerRename", "BufEnter", "NvimTree_*", rename)
end

---------- File Explorer Mappings

nnoremap("<a-e>", ":NvimTreeToggle <cr>", { silent = true })
