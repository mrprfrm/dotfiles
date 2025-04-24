return {
	{
		"stevearc/dressing.nvim",
		events = { "VeryLazy" },
		opts = {},
	},

	{
		"nvim-lualine/lualine.nvim",
		lazy = false,
		opts = {
			options = {
				icons_enabled = true,
			},
		},
	},

	{
		"goolord/alpha-nvim",
		event = { "VimEnter" },
		opts = function()
			local dashboard = require("alpha.themes.dashboard")

			dashboard.section.buttons.val = {
				dashboard.button("e", "  New file", "<cmd>ene <CR>"),
				dashboard.button("f", "󰍉  Find file", ":Telescope find_files <CR>"),
				dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
				dashboard.button("r", "󰈢  Recently opened files", ":Telescope oldfiles <CR>"),
				dashboard.button("t", "󰊄  Find text", ":Telescope live_grep <CR>"),
				dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
			}
			return dashboard.opts
		end,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPre", "BufNewFile" },
		main = "ibl",
		opts = {},
	},

	{
		"akinsho/bufferline.nvim",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			options = {
				numbers = "none",
				show_close_icon = false,
				show_buffer_close_icons = false,
				modified_icon = "",
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					if level:match("error") then
						return ""
					elseif level:match("warn") then
						return ""
					end
					return ""
				end,
				offsets = { { filetype = "NvimTree" } },
				show_buffer_icons = true,
				show_tab_indicators = true,
				always_show_bufferline = true,
				separator_style = "slant",
			},
		},
	},

	{
		"EdenEast/nightfox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nightfox").setup({
				palettes = {
					nordfox = {
						black = { bright = "#81899B" },
					},
				},
			})

			vim.cmd("colorscheme nordfox")
		end,
	},
}
