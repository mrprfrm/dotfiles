return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {},
	},

	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"ahmedkhalf/project.nvim",
			"nvim-telescope/telescope-live-grep-args.nvim",
			"ThePrimeagen/harpoon",
		},
		config = function()
			local actions = require("telescope.actions")
			local telescope = require("telescope")
			local keymap = require("utils").keymap
			local builtin = require("telescope.builtin")

			telescope.setup({
				defaults = {
					layout_strategy = "vertical",
					file_ignore_patterns = {
						".git/.*",
						"node_modules/.*",
						"__pycache__/.*",
						"venv/.*",
						"htmlcov/.*",
					},
					mappings = {
						i = {
							["<C-l>"] = actions.cycle_history_next,
							["<C-h>"] = actions.cycle_history_prev,

							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,

							["<Up>"] = actions.move_selection_previous,
							["<Down>"] = actions.move_selection_next,

							["<CR>"] = actions.select_default,
							["<C-x>"] = actions.select_horizontal,
							["<C-v>"] = actions.select_vertical,
							-- ["<C-s>"] = custom_actions.system_nvim_open,

							["<C-u>"] = actions.preview_scrolling_up,
							["<C-d>"] = actions.preview_scrolling_down,

							["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
							["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,

							["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
							["<C-Q>"] = actions.send_selected_to_qflist + actions.open_qflist,

							["<C-\\>"] = actions.which_key,
							-- TODO: try to replace with bdelete
							["<C-c>"] = actions.delete_buffer,
						},
					},
				},
			})

			keymap("Find references", "n", "gr", function()
				builtin.lsp_references({ layout_strategy = "vertical" })
			end)

			keymap("Find definitions", "n", "gd", function()
				builtin.lsp_definitions({ layout_strategy = "vertical" })
			end)

			telescope.load_extension("projects")
			telescope.load_extension("live_grep_args")
			telescope.load_extension("harpoon")
		end,
	},

	{
		"ahmedkhalf/project.nvim",
		config = function()
			local project = require("project_nvim")
			project.setup({
				active = true,
				detection_methods = { "pattern" },
				patterns = {
					".git",
					"_darcs",
					".hg",
					".bzr",
					".svn",
					"Makefile",
					"package.json",
					"pyproject.toml",
					"alacritty.toml",
					"tmux.conf",
				},
			})
		end,
	},

	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
}
