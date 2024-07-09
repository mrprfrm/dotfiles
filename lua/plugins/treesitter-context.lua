local context_ok, context = pcall(require, "treesitter-context")
if not context_ok then
	print("Plugin treesitter-context is not awailable")
	return
end

context.setup({
	enable = true,
	zindex = 20,
})
