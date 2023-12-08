local context_ok, context_commentstring = pcall(require, "ts_context_commentstring")
if not context_ok then
	return
end

vim.g.skip_ts_context_commentstring_module = true
context_commentstring.setup({})
