local signs = {
	{ name = "DiagnosticSignError", text = "󰅙" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = "󰌵" },
	{ name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

vim.diagnostic.config({
	virtual_text = false,
	signs = { active = signs },
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "rounded",
})

function SHOW_WS_FOLDERS()
	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end

function SHOW_DIAGNOSTICS_LINE()
	vim.diagnostic.open_float()
end

local on_attach = function(client, bufnr)
	if client.name == "html" or client.name == "tsserver" then
		client.server_capabilities.documentFormattingProvider = false
	end
end

local cmp_nvim_lsp_status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status_ok then
	return
end

local config = require("plugins.lspconfig.settings")
for lsp, settings in pairs(config) do
	local opts = {}

	for name, value in pairs(settings) do
		opts[name] = value
	end

	opts.on_attach = on_attach
	opts.capabilities = cmp_nvim_lsp.default_capabilities()

	require("lspconfig")[lsp].setup(opts)
end
