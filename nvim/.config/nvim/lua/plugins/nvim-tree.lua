return {
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		opts = {
			update_cwd = true,
			open_on_tab = false,
			auto_reload_on_write = true,
			renderer = {
				icons = {
					glyphs = {
						git = {
							unstaged = "",
							staged = "",
							unmerged = "",
							renamed = "➜",
							deleted = "",
							untracked = "󰙝",
							ignored = "",
						},
					},
				},
			},
			diagnostics = {
				enable = true,
				icons = {
					hint = "󰌵",
					info = "",
					error = "󰅙",
					warning = "",
				},
			},
			git = {
				enable = true,
				ignore = false,
				timeout = 400,
			},
			update_focused_file = {
				enable = true,
				update_cwd = true,
			},
			hijack_directories = {
				enable = true,
				auto_open = true,
			},
			filesystem_watchers = {
				enable = true,
			},
		},
	},
}
