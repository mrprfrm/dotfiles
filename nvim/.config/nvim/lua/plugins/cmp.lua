return {
	{
		"hrsh7th/nvim-cmp",
		event = { "InsertEnter" },
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp",
			"rafamadriz/friendly-snippets",
			"L3MON4D3/LuaSnip",
		},
		opts = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			require("luasnip.loaders.from_vscode").lazy_load({
				include = { "python", "lua", "javascript", "typescript", "go", "rust" },
			})

			local kind_icons = {
				Text = "󰊄",
				Method = "m",
				Function = "󰊕",
				Constructor = "",
				Field = "󰆧",
				Variable = "󰜌",
				Class = "",
				Interface = "󰋙",
				Module = "󰛡",
				Property = "󰆧",
				Unit = "󰆧",
				Value = "󰎠",
				Enum = "",
				Keyword = "󰌆",
				Snippet = "󰐱",
				Color = "󰏘",
				File = "",
				Reference = "󰜴",
				Folder = "",
				EnumMember = "",
				Constant = "󰜋",
				Struct = "",
				Event = "",
				Operator = "󰆕",
				TypeParameter = "󰆦",
			}

			local check_backspace = function()
				local col = vim.fn.col(".") - 1
				return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
			end

			local function has_autoimport(entry)
				local edits = entry:get_completion_item().additionalTextEdits
				return edits ~= nil and #edits > 0
			end

			local function entry_detail(item)
				if not item.labelDetails then
					return nil
				end

				return item.labelDetails.description or item.labelDetails.detail
			end

			return {
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = {
					["<CR>"] = cmp.mapping.confirm({ select = true }),
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
					["<C-e>"] = cmp.mapping.complete(),
				},
				formatting = {
					fields = { "kind", "abbr", "menu" },
					format = function(entry, vim_item)
						local item = entry:get_completion_item()
						local detail = entry_detail(item)

						vim_item.kind = kind_icons[vim_item.kind] or vim_item.kind
						vim_item.menu = ({
							nvim_lsp = detail and ("[LSP] " .. detail) or "[LSP]",
							luasnip = "[Snippet]",
							buffer = "[Buffer]",
							path = "[Path]",
						})[entry.source.name]

						return vim_item
					end,
				},
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				},
				sorting = {
					comparators = {
						cmp.config.compare.offset,
						cmp.config.compare.exact,
						function(e1, e2) -- in-scope symbols before auto-imports; keeps both
							local a1, a2 = has_autoimport(e1), has_autoimport(e2)
							if a1 ~= a2 then
								return a2
							end
						end,
						cmp.config.compare.score,
						cmp.config.compare.recently_used,
						cmp.config.compare.locality,
						cmp.config.compare.kind,
						cmp.config.compare.sort_text,
						cmp.config.compare.length,
						cmp.config.compare.order,
					},
				},
				performance = {
					max_view_entries = 12,
					debounce = 60,
					throttle = 30,
					fetching_timeout = 200,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
			}
		end,
	},

	{
		"windwp/nvim-autopairs",
		event = { "InsertEnter" },
		dependencies = {
			"hrsh7th/nvim-cmp",
		},
		config = function()
			local autopairs = require("nvim-autopairs")
			local cmp = require("cmp")
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")

			autopairs.setup({
				check_ts = true,
				ts_config = {
					lua = { "string", "source" },
					java_script = { "string", "template_string" },
				},
			})

			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { text = "" } }))
		end,
	},

	{
		"kylechui/nvim-surround",
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
	},
}
