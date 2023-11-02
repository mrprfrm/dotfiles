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

local show_ws_folders = function()
	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end

local show_diagnostics_line = function()
	vim.diagnostic.open_float()
end

local on_attach = function(client, bufnr)
	if client.name == "html" or client.name == "tsserver" then
		client.server_capabilities.documentFormattingProvider = false
	end

	-- vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v.lua.vim.lsp.omnifunc")
	local opts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

	vim.keymap.set("n", "gl", show_diagnostics_line, opts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "gk", vim.lsp.buf.signature_help, opts)

	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

	vim.keymap.set("n", "<space>r", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "<space>f", vim.lsp.buf.formatting, opts)
	-- vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
	-- vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
	-- vim.keymap.set("n", "<space>wl", show_ws_folders, opts)
	-- vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
	-- vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
end

local cmp_nvim_lsp_status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status_ok then
	return
end

local config = require("plugins.lspconfig.settings")
for lsp, settings in pairs(config) do
	local opts = {
		on_attach = on_attach,
		capabilities = cmp_nvim_lsp.default_capabilities(),
	}

	for name, value in pairs(settings) do
		opts[name] = value
	end

	require("lspconfig")[lsp].setup(opts)
end
