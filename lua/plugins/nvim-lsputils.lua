local code_action_ok, code_action = pcall(require, "lsputil.codeAction")
local locations_ok, locations = pcall(require, "lsputil.locations")
local symbols_ok, symbols = pcall(require, "lsputil.symbols")
if not code_action_ok and locations_ok and symbols_ok then
	print("Plugin lsputil is not awailable")
	return
end

if vim.fn.has("nvim-0.5.1") == 1 then
	vim.lsp.handlers["textDocument/codeAction"] = code_action.code_action_handler
	vim.lsp.handlers["textDocument/references"] = locations.references_handler
	vim.lsp.handlers["textDocument/definition"] = locations.definition_handler
	vim.lsp.handlers["textDocument/declaration"] = locations.declaration_handler
	vim.lsp.handlers["textDocument/typeDefinition"] = locations.typeDefinition_handler
	vim.lsp.handlers["textDocument/implementation"] = locations.implementation_handler
	vim.lsp.handlers["textDocument/documentSymbol"] = symbols.document_handler
	vim.lsp.handlers["workspace/symbol"] = symbols.workspace_handler
else
	local bufnr = vim.api.nvim_buf_get_number(0)

	vim.lsp.handlers["textDocument/codeAction"] = function(_, _, actions)
		code_action.code_action_handler(nil, actions, nil, nil, nil)
	end

	vim.lsp.handlers["textDocument/references"] = function(_, _, result)
		locations.references_handler(nil, result, { bufnr = bufnr }, nil)
	end

	vim.lsp.handlers["textDocument/definition"] = function(_, method, result)
		locations.definition_handler(nil, result, { bufnr = bufnr, method = method }, nil)
	end

	vim.lsp.handlers["textDocument/declaration"] = function(_, method, result)
		locations.declaration_handler(nil, result, { bufnr = bufnr, method = method }, nil)
	end

	vim.lsp.handlers["textDocument/typeDefinition"] = function(_, method, result)
		locations.typeDefinition_handler(nil, result, { bufnr = bufnr, method = method }, nil)
	end

	vim.lsp.handlers["textDocument/implementation"] = function(_, method, result)
		locations.implementation_handler(nil, result, { bufnr = bufnr, method = method }, nil)
	end

	vim.lsp.handlers["textDocument/documentSymbol"] = function(_, _, result, _, bufn)
		symbols.document_handler(nil, result, { bufnr = bufn }, nil)
	end

	vim.lsp.handlers["textDocument/symbol"] = function(_, _, result, _, bufn)
		symbols.workspace_handler(nil, result, { bufnr = bufn }, nil)
	end
end
