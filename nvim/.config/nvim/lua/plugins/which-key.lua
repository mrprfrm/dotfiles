return {
	{
		"folke/which-key.nvim",
		dependencies = {
			"moll/vim-bbye",
			"nvim-telescope/telescope.nvim",
			"nvim-treesitter/nvim-treesitter-context",
		},
		config = function()
			local whichkey = require("which-key")

			whichkey.setup({
				icons = {
					breadcrumb = "»",
					separator = "➜",
					group = "+",
				},
				plugins = {
					marks = false,
					registers = false,
					spelling = {
						enabled = false,
					},
					presets = {
						operators = false,
						motions = false,
						text_objects = false,
						windows = false,
						nav = false,
						z = false,
						g = false,
					},
				},
				win = {
					border = "rounded",
					padding = { 2, 2 },
				},
				layout = { align = "center" },
			})

			whichkey.add({ "<leader>a", "<cmd>Alpha<CR>", desc = "Alpha" })
			whichkey.add({ "<leader>w", "<cmd>w!<CR>", desc = "Save" })
			whichkey.add({ "<leader>q", "<cmd>q!<CR>", desc = "Quit" })
			whichkey.add({ "<leader>c", "<cmd>Bdelete!<CR>", desc = "Close buffer" })
			whichkey.add({ "<leader>h", "<cmd>nohlsearch<CR>", desc = "No highlight" })

			--- Explorer ---
			whichkey.add({
				"<leader>e",
				desc = "Explorer",
				{ "<leader>ee", "<cmd>NvimTreeToggle<CR>", desc = "Toggle explorer" },
				{ "<leader>ec", "<cmd>NvimTreeFindFile<CR>", desc = "Find current file" },
			})

			--- Find ---
			whichkey.add({
				"<leader>f",
				desc = "Find",
				{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
				{ "<leader>ft", "<cmd>Telescope live_grep<CR>", desc = "Find text workspace" },
				{ "<leader>fp", "<cmd>Telescope projects<CR>", desc = "Find projects" },
				{ "<leader>fr", "<cmd>Telescope oldfiles<CR>", desc = "Recent files" },
				{ "<leader>fo", "<cmd>Telescope buffers<CR>", desc = "Opened buffers" },
				{ "<leader>fc", "<cmd>TodoTelescope<CR>", desc = "Find comments" },
			})

			--- Git ---
			whichkey.add({
				"<leader>g",
				desc = "Git",
				{ "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", desc = "Preview hunk" },
				{ "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", desc = "Blame" },
				{ "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc = "Reset hunk" },
				{ "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc = "Reset buffer" },
				{ "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc = "Stage hunk" },
				{ "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", desc = "Unstage hunk" },
				{ "<leader>gd", "<cmd>Gitsigns diffthis<cr>", desc = "Diff" },
			})

			--- Treesitter ---
			whichkey.add({ "<leader>tt", "<cmd>TSContext toggle<CR>", desc = "Toggle context" })

			--- LSP ---
			whichkey.add({
				"<leader>l",
				desc = "LSP",
				{ "<leader>ld", "<cmd>Telescope diagnostics<CR>", desc = "Diagnostics" },
				{ "<leader>ll", "<cmd>SymbolsOutline<CR>", desc = "Symbols" },
			})
		end,
	},
}
