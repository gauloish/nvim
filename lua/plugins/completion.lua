--------------- Completion ---------------

require("interface")
require("general")

local themes = require("tools/themes")

---------- Verification Step

local modules = dependencies({
	"nvim-autopairs.completion.cmp",
	"cmp",
	"lspkind",
	"luasnip",
})

if not modules then
	return
end

local autopairs = modules("nvim-autopairs.completion.cmp")
local completion = modules("cmp")
local kind = modules("lspkind")
local snippets = modules("luasnip")

---------- Completion Setup

local alias = {
	path = "Path",
	buffer = "Buffer",
	calc = "Calculator",
	luasnip = "Snippets",
	nvim_lua = "Vim",
	nvim_lsp = "Language",
	nvim_lsp_document_symbol = "Document",
	nvim_lsp_signature_help = "Signature",
}

kind.init({
	mode = "symbol_text",
	preset = "codicons",
	symbol_map = {
		Class = " ﰩ",
		Color = " ",
		Constant = " π",
		Constructor = " ",
		Enum = " ",
		Member = " ",
		EnumMember = " ",
		Event = " כּ",
		Field = " ",
		File = " ",
		Folder = " ",
		Function = " ",
		Interface = " ",
		Keyword = " ▢",
		Method = " ",
		Module = " ",
		Operator = " ◎",
		Property = " ",
		Reference = " ",
		Snippet = " ",
		Struct = " ",
		Text = "Aa",
		Type = " ",
		TypeParameter = " ",
		Unit = " λ",
		Value = " β",
		Variable = " α",
	},
})

completion.setup({
	snippet = {
		expand = function(args)
			snippets.lsp_expand(args.body)
		end,
	},
	window = {
		completion = {
			border = "rounded",
			winhighlight = "Normal:CaseThirdAbove," .. "CursorLine:BaseFifthBelow," .. "Search:GreenSecondAbove",
			scrollbar = false,
		},
		documentation = {
			border = "rounded",
			winhighlight = "Normal:Normal," .. "FloatBorder:FloatBorder",
			scrollbar = true,
		},
	},
	mapping = {
		["<cr>"] = completion.mapping.confirm({
			behavior = completion.ConfirmBehavior.Replace,
		}),
		["<tab>"] = function(fallback)
			if completion.visible() then
				completion.select_next_item()
			else
				fallback()
			end
		end,
		["<s-tab>"] = function(fallback)
			if completion.visible() then
				completion.select_prev_item()
			else
				fallback()
			end
		end,
		["<a-s>"] = function(fallback)
			if snippets.expand_or_jumpable() then
				snippets.expand_or_jump()
			else
				fallback()
			end
		end,
		["<a-a>"] = function(fallback)
			if snippets.jumpable(-1) then
				snippets.jump(-1)
			else
				fallback()
			end
		end,
		["<c-j>"] = completion.mapping.scroll_docs(1),
		["<c-k>"] = completion.mapping.scroll_docs(-1),
	},
	sources = {
		{ name = "luasnip" },
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "calc" },
		{ name = "nvim_lsp_document_symbol" },
		{ name = "nvim_lsp_signature_help" },
	},
	formatting = {
		format = kind.cmp_format({
			mode = "symbol_text",
			maxwidth = 40,
			ellipsis_char = " ... ",
			before = function(entry, item)
				item.menu = "[" .. alias[entry.source.name] .. "]"

				item.abbr = item.abbr:match("^%s*(.*)")

				--print(item.kind) -- Tipo
				--print(item.abbr) -- Abreviação
				--print(item.word) -- Palavra
				--print(item.menu) -- Origem
				--print(item.dup)  -- Algo

				return item
			end,
		}),
	},
	completion = {
		completeopt = "menu," .. "menuone," .. "preview," .. "noinsert," .. "noselect",
	},
	experimental = {
		native_menu = false,
	},
})

completion.event:on("confirm_done", autopairs.on_confirm_done())

---------- Completion Functions

local function colors()
	local palette = themes.colors()

	-- Completion Menu
	highlight("CmpItemAbbr", { fg = palette.case[3] })
	highlight("CmpItemAbbrDeprecated", { fg = palette.case[10] })
	highlight("CmpItemAbbrMatch", { fg = palette.cyan[2] })
	highlight("CmpItemAbbrMatchFuzzy", { fg = palette.cyan[2] })
	highlight("CmpItemKind", { fg = palette.magenta[2] })
	highlight("CmpItemMenu", { fg = palette.base[8] })
	highlight("CmpItemSelected", { bg = palette.base[5] })

	-- Kind Icons
	highlight("CmpItemKindClass", { fg = palette.green[2] })
	highlight("CmpItemKindEnum", { fg = palette.green[2] })
	highlight("CmpItemKindStruct", { fg = palette.green[2] })
	highlight("CmpItemKindInterface", { fg = palette.green[2] })
	highlight("CmpItemKindConstructor", { fg = palette.green[2] })

	highlight("CmpItemKindMember", { fg = palette.blue[2] })
	highlight("CmpItemKindMethod", { fg = palette.blue[2] })
	highlight("CmpItemKindField", { fg = palette.blue[2] })
	highlight("CmpItemKindEnumMember", { fg = palette.blue[2] })
	highlight("CmpItemKindProperty", { fg = palette.blue[2] })
	highlight("CmpItemKindEvent", { fg = palette.blue[2] })
	highlight("CmpItemKindOperator", { fg = palette.blue[2] })
	highlight("CmpItemKindFunction", { fg = palette.blue[2] })

	highlight("CmpItemKindModule", { fg = palette.yellow[2] })
	highlight("CmpItemKindReference", { fg = palette.yellow[2] })
	highlight("CmpItemKindKeyword", { fg = palette.yellow[2] })
	highlight("CmpItemKindText", { fg = palette.yellow[2] })

	highlight("CmpItemKindType", { fg = palette.cyan[2] })
	highlight("CmpItemKindTypeParameter", { fg = palette.cyan[2] })
	highlight("CmpItemKindUnit", { fg = palette.cyan[2] })
	highlight("CmpItemKindValue", { fg = palette.cyan[2] })
	highlight("CmpItemKindVariable", { fg = palette.cyan[2] })
	highlight("CmpItemKindConstant", { fg = palette.cyan[2] })
	highlight("CmpItemKindColor", { fg = palette.cyan[2] })

	highlight("CmpItemKindFile", { fg = palette.magenta[2] })
	highlight("CmpItemKindFolder", { fg = palette.magenta[2] })
	highlight("CmpItemKindSnippet", { fg = palette.magenta[2] })
end

---------- Completion Auto Commands

augroup("CompletionColors")
do
	autocmd("CompletionColors", "ColorScheme", "*", colors)
	autocmd("CompletionColors", "VimEnter", "*", colors)
end
