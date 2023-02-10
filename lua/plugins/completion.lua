-------------- Completion Configuration --------------

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
		Type = " φ",
		TypeParameter = " φ",
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

---------- Completion Functions

completion.event:on("confirm_done", autopairs.on_confirm_done())

local function colors()
	themes.verify["update"]()

	-- Completion Menu
	highlight("CmpItemAbbr", { link = "CaseThirdAbove" })
	highlight("CmpItemAbbrDeprecated", { link = "CaseTenthAbove" })
	highlight("CmpItemAbbrMatch", { link = "CyanSecondAbove" })
	highlight("CmpItemAbbrMatchFuzzy", { link = "CyanSecondAbove" })
	highlight("CmpItemKind", { link = "MagentaSecondAbove" })
	highlight("CmpItemMenu", { link = "BaseEighthAbove" })
	highlight("CmpItemSelected", { link = "BaseFifthBelow" })

	-- Kind Icons
	highlight("CmpItemKindClass", { link = "GreenSecondAbove" })
	highlight("CmpItemKindEnum", { link = "GreenSecondAbove" })
	highlight("CmpItemKindStruct", { link = "GreenSecondAbove" })
	highlight("CmpItemKindInterface", { link = "GreenSecondAbove" })
	highlight("CmpItemKindConstructor", { link = "GreenSecondAbove" })

	highlight("CmpItemKindMember", { link = "BlueSecondAbove" })
	highlight("CmpItemKindMethod", { link = "BlueSecondAbove" })
	highlight("CmpItemKindField", { link = "BlueSecondAbove" })
	highlight("CmpItemKindEnumMember", { link = "BlueSecondAbove" })
	highlight("CmpItemKindProperty", { link = "BlueSecondAbove" })
	highlight("CmpItemKindEvent", { link = "BlueSecondAbove" })
	highlight("CmpItemKindOperator", { link = "BlueSecondAbove" })
	highlight("CmpItemKindFunction", { link = "BlueSecondAbove" })

	highlight("CmpItemKindModule", { link = "YellowSecondAbove" })
	highlight("CmpItemKindReference", { link = "YellowSecondAbove" })
	highlight("CmpItemKindKeyword", { link = "YellowSecondAbove" })
	highlight("CmpItemKindText", { link = "YellowSecondAbove" })

	highlight("CmpItemKindType", { link = "CyanSecondAbove" })
	highlight("CmpItemKindTypeParameter", { link = "CyanSecondAbove" })
	highlight("CmpItemKindUnit", { link = "CyanSecondAbove" })
	highlight("CmpItemKindValue", { link = "CyanSecondAbove" })
	highlight("CmpItemKindVariable", { link = "CyanSecondAbove" })
	highlight("CmpItemKindConstant", { link = "CyanSecondAbove" })
	highlight("CmpItemKindColor", { link = "CyanSecondAbove" })

	highlight("CmpItemKindFile", { link = "MagentaSecondAbove" })
	highlight("CmpItemKindFolder", { link = "MagentaSecondAbove" })
	highlight("CmpItemKindSnippet", { link = "MagentaSecondAbove" })
end

---------- Completion Auto Commands

augroup("CompletionColors")
do
	autocmd("CompletionColors", "ColorScheme", "*", colors)
	autocmd("CompletionColors", "VimEnter", "*", colors)
end
