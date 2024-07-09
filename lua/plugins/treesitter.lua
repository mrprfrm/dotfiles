local treesitter_status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not treesitter_status_ok then
	return
end

treesitter.setup({
	highlight = { enable = true },
	indent = { enable = true },
	ensure_installed = {
		"bash",
		"comment",
		"dockerfile",
		"css",
		"html",
		"json",
		"javascript",
		"lua",
		"markdown",
		"python",
		"rust",
		"scss",
		"toml",
		"tsx",
		"typescript",
		"vue",
		"yaml",
	},
})
