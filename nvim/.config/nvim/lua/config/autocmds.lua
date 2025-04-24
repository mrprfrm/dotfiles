local group = vim.api.nvim_create_augroup("custom-config")

local function autocmd(desc, event, callback)
	vim.api.nvim_create_autocmd(event, {
		desc = desc,
		group = group,
		callback = callback,
	})
end

autocmd("Setup LSP", "LspAttach", function(event)
	local client = vim.lsp.get_client_by_id(event.client_id)

	if client.name == "eslint" then
		client.server_capabilities.documentFormattingProvider = true
	end

	if client.name == "tsserver" then
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
	end

	if client.name == "html" then
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
	end

	if client.name == "ruff" then
		client.server_capabilities.hoverProvider = false
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
	end
end)
