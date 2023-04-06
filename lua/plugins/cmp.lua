local cmp_status_ok, cmp = pcall(require, "cmp")
local luasnip_status_ok, luasnip = pcall(require, "luasnip")
if not (cmp_status_ok and luasnip_status_ok) then
	return
end

require("luasnip/loaders/from_vscode").lazy_load()

-- Kind icons
--     פּ                   ﴟ
--  ﯖ   ﯟ ﯠ ﲂ     ﰉ ﰊ 
local kind_icons = {
	Text = "",
	Method = "m",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "ﰊ",
	Class = "",
	Interface = "",
	Module = "ﯟ",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "ﰲ",
	Folder = "",
	EnumMember = "",
	Constant = "ﰉ",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
}

local check_backspace = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = {
		-- Options navigation
		-- Documentatin navigation
		["<C-b>"] = cmp.mapping.scroll_docs(-1),
		["<C-f>"] = cmp.mapping.scroll_docs(1),
		-- Confirm, abort and commpllete
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<C-e>"] = cmp.mapping.abort(),
		-- ["<S-Space>"] = cmp.mapping.complete(),
		-- Smart tabs
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif check_backspace() then
				fallback()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	},
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
			vim_item.menu = ({
				nvim_lsp = "[LSP]",
				nvim_lua = "[LUA]",
				luasnip = "[Snippet]",
				buffer = "[Buffer]",
				path = "[Path]",
			})[entry.source.name]
			return vim_item
		end,
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
	},
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		sellect = false,
	},
	window = {
		documentation = cmp.config.window.bordered(),
	},
})
