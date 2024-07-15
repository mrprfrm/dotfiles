return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		main = "nvim-treesitter.configs",
		build = ":TSUpdateSync",
		opts = {
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		},
	},

	{
		"nvim-treesitter/nvim-treesitter-context",
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
	},
}
