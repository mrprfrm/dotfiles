local treesitter_status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
local context_ok, context_commentstring = pcall(require, "ts_context_commentstring")
if not (treesitter_status_ok or context_ok) then
	return
end

vim.g.skip_ts_context_commentstring_module = true
context_commentstring.setup({})

treesitter.setup({
	highlight = { enable = true },
	rainbow = { enable = true, extended_mode = true, max_file_lines = nil },
	autotag = { enable = true },
	indent = { enable = true },
	folding = { enable = true },
	ensure_installed = {
		"html",
		"css",
		"scss",
		"javascript",
		"lua",
		"python",
		"vue",
		"toml",
		"yaml",
		"json",
		"comment",
	},
})
