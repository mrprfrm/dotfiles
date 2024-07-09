local conform_status_ok, conform = pcall(require, "conform")
if not conform_status_ok then
	return
end

conform.setup({
	formatters_by_ft = {
		css = { "prettier" },
		html = { "prettier" },
		javascript = { "prettier" },
		javascriptreact = { "prettier" },
		json = { "prettier" },
		lua = { "stylua" },
		python = { "isort", "black" },
		rust = { "rustfmt" },
		typescript = {},
		typescriptreact = {},
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
})
