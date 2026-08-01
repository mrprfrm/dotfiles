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
		opts = {
			automatic_enable = false,
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
				"terraformls",
				"sqls",
				"gopls",
			},
		},
		config = function(_, opts)
			local capabilities =
				require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

			for _, server_name in ipairs(opts.ensure_installed) do
				vim.lsp.config(server_name, {
					capabilities = capabilities,
				})
			end

			vim.lsp.config("eslint", {
				capabilities = capabilities,
				settings = {
					codeActionOnSave = { enable = true, mode = "all" },
				},
			})

			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
				settings = {
					Lua = {
						completion = { callSnippet = "Replace" },
					},
				},
			})

			vim.lsp.config("yamlls", {
				capabilities = capabilities,
				settings = {
					yaml = {
						format = { enable = true },
						customTags = {
							"!reset",
							"!reset sequence",
							"!override",
							"!override sequence",
						},
						schemas = {
							["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = {
								"compose.yaml",
								"compose.yml",
								"docker-compose.yaml",
								"docker-compose.yml",
							},
						},
					},
				},
			})

			require("mason-lspconfig").setup(opts)

			for _, server_name in ipairs(opts.ensure_installed) do
				vim.lsp.enable(server_name)
			end
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
		init = function()
			vim.g.copilot_no_tab_map = true
			vim.g.copilot_idle_delay = 500
		end,
		config = function()
			vim.cmd([[imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")]])
			vim.cmd([[imap <silent><script><expr> <C-F> copilot#Next()]])
			vim.cmd([[imap <silent><script><expr> <C-D> copilot#Previous()]])
			vim.g.copilot_no_tab_map = true
		end,
	},
}
