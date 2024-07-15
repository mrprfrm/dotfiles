return {
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

			return {
				ensure_installed = {
					"cssls",
					"cssmodules_ls",
					"eslint",
					"html",
					"jsonls",
					"lua_ls",
					"pyright",
					"ruff_lsp",
					"rust_analyzer",
					"stylelint_lsp",
					"tsserver",
					"yamlls",
				},
				handlers = {
					function(server_name)
						require("lspconfig")[server_name].setup({
							capabilities,
						})
					end,
					lua_ls = function()
						require("lspconfig").lua_ls.setup({
							capabilities,
							settings = {
								Lua = {
									completion = { callSnippet = "Replace" },
									diagnostics = { globals = { "vim" } },
								},
							},
						})
					end,
				},
			}
		end,
	},

	{
		"simrat39/symbols-outline.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			auto_close = true,
			highlight_hovered_item = false,
			autofold_depth = 1,
			auto_preview = false,
			symbols = {
				File = { icon = "", hl = "TSURI" },
				Module = { icon = "󰛡", hl = "TSNamespace" },
				Namespace = { icon = "󰀁", hl = "TSNamespace" },
				Package = { icon = "󰏗", hl = "TSNamespace" },
				Class = { icon = "", hl = "TSType" },
				Method = { icon = "m", hl = "TSMethod" },
				Property = { icon = "󰆧", hl = "TSMethod" },
				Field = { icon = "󰆧", hl = "TSField" },
				Constructor = { icon = "", hl = "TSConstructor" },
				Enum = { icon = "", hl = "TSType" },
				Interface = { icon = "󰋙", hl = "TSType" },
				Function = { icon = "󰊕", hl = "TSFunction" },
				Variable = { icon = "󰜌", hl = "TSConstant" },
				Constant = { icon = "󰜋", hl = "TSConstant" },
				String = { icon = "󱀍", hl = "TSString" },
				Number = { icon = "󰎠", hl = "TSNumber" },
				Boolean = { icon = "", hl = "TSBoolean" },
				Array = { icon = "󰅪", hl = "TSConstant" },
				Object = { icon = "󰅩", hl = "TSType" },
				Key = { icon = "󰌆", hl = "TSType" },
				Null = { icon = "󱓼", hl = "TSType" },
				EnumMember = { icon = "", hl = "TSField" },
				Struct = { icon = "", hl = "TSType" },
				Event = { icon = "", hl = "TSType" },
				Operator = { icon = "󰆕", hl = "TSOperator" },
				TypeParameter = { icon = "󰆦", hl = "TSParameter" },
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
