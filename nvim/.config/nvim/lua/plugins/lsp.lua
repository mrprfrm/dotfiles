return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {},
	},

	{
		"williamboman/mason.nvim",
		opts = {
			ui = {
				border = "rounded",
			},
		},
	},

	{
		"williamboman/mason-lspconfig.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"neovim/nvim-lspconfig",
			"williamboman/mason.nvim",
			"b0o/schemastore.nvim",
		},
		opts = function()
			local capabilities =
				require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
			local lspconfig = require("lspconfig")

			return {
				ensure_installed = {
					"cssls",
					"cssmodules_ls",
					"eslint",
					"html",
					"jsonls",
					"lua_ls",
					"ty",
					"ruff",
					"rust_analyzer",
					"stylelint_lsp",
					"ts_ls",
					"yamlls",
					"clangd",
				},
				handlers = {
					function(server_name)
						lspconfig[server_name].setup({
							capabilities,
						})
					end,

					eslint = function()
						lspconfig.eslint.setup({
							capabilities,
							settings = {
								codeActionOnSave = { enable = true, mode = "all" },
							},
						})
					end,

					lua_ls = function()
						lspconfig.lua_ls.setup({
							capabilities,
							settings = {
								Lua = {
									completion = { callSnippet = "Replace" },
								},
							},
						})
					end,

					ty = function()
						lspconfig.ty.setup({
							capabilities,
							root_dir = lspconfig.util.root_pattern("pyproject.toml", "WORKSPACE"),
						})
					end,
				},
			}
		end,
	},

	{
		"hedyhli/outline.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			outline_window = {
				auto_close = true,
			},
			outline_items = {
				highlight_hovered_item = false,
			},
			symbol_folding = {
				autofold_depth = 1,
			},
			symbols = {
				icons = {
					File = { icon = "", hl = "Identifier" },
					Module = { icon = "󰛡", hl = "Include" },
					Namespace = { icon = "󰀁", hl = "Include" },
					Package = { icon = "󰏗", hl = "Include" },
					Class = { icon = "", hl = "Type" },
					Method = { icon = "m", hl = "Function" },
					Property = { icon = "p", hl = "Identifier" },
					Field = { icon = "f", hl = "Identifier" },
					Constructor = { icon = "", hl = "Special" },
					Enum = { icon = "", hl = "Type" },
					Interface = { icon = "󰋙", hl = "Type" },
					Function = { icon = "󰊕", hl = "Function" },
					Variable = { icon = "󰜌", hl = "Constant" },
					Constant = { icon = "󰜋", hl = "Constant" },
					String = { icon = "󱀍", hl = "String" },
					Number = { icon = "󰎠", hl = "Number" },
					Boolean = { icon = "", hl = "Boolean" },
					Array = { icon = "󰅪", hl = "Constant" },
					Object = { icon = "󰅩", hl = "Type" },
					Key = { icon = "󰌆", hl = "Type" },
					Null = { icon = "󱓼", hl = "Type" },
					EnumMember = { icon = "", hl = "Identifier" },
					Struct = { icon = "", hl = "Structure" },
					Event = { icon = "", hl = "Type" },
					Operator = { icon = "󰆕", hl = "Identifier" },
					TypeParameter = { icon = "󰆦", hl = "Identifier" },
				},
			},
		},
	},

	{
		"github/copilot.vim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			vim.cmd([[imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")]])
			vim.cmd([[imap <silent><script><expr> <C-F> copilot#Next()]])
			vim.cmd([[imap <silent><script><expr> <C-D> copilot#Previous()]])
			vim.g.copilot_no_tab_map = true
		end,
	},
}
