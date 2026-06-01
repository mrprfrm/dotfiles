-- TODO: add auto cmd for ensure_installed list

return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		opts = {
			formatters_by_ft = {
				css = { "prettier" },
				html = { "prettier" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				json = { "prettier" },
				lua = { "stylua" },
				python = { "ruff_fix", "ruff_format" },
				rust = { "rustfmt" },
				typescript = {},
				typescriptreact = {},
				markdown = { "prettier" },
				c = { "clang-format" },
				terraform = {},
				sql = { "pg_format" },
			},
			formatters = {
				pg_format = {
					prepend_args = {
						"--wrap-limit",
						"80",
						"--spaces",
						"4",
						"--keyword-case",
						"2",
						"--type-case",
						"2",
					},
				},
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
		},
	},
}
