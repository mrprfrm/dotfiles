local telescope_status_ok, telescope = pcall(require, "telescope")
local utils_status_ok, utils = pcall(require, "telescope.utils")
local actions_status_ok, actions = pcall(require, "telescope.actions")
local action_state_status_ok, action_state = pcall(require, "telescope.actions.state")
local mt_status_ok, mt = pcall(require, "telescope.actions.mt")
local builtin_ok, builtin = pcall(require, "telescope.builtin")
if
	not (
		telescope_status_ok
		and utils_status_ok
		and actions_status_ok
		and action_state_status_ok
		and action_state_status_ok
		and mt_status_ok
		and builtin_ok
	)
then
	return
end

-- vim.cmd("command! -nargs=+ Silent silent . <q-args> | redraw")
local custom_actions = mt.transform_mod({
	system_nvim_open = function(prompt_bufnr)
		local entry = action_state.get_selected_entry()

		if not entry then
			utils.notify("custom_actions.open_in_new_term", {
				msg = "Nothing currently selected",
				level = "WARN",
			})
		end

		local filename = entry.path or entry.filename
		local status_ok, result = pcall(vim.cmd, string.format("silent !open -a nvim %s", filename))

		if status_ok then
			require("telescope.pickers").on_close_prompt(prompt_bufnr)
			pcall(vim.cmd, "redraw")
			print(string.format("Open file %s", filename))
		else
			print(result)
		end
	end,
})

function FIND_LSP_REFERENCES()
	builtin.lsp_references({
		layout_strategy = "vertical",
		layout_config = {
			width = 0.8,
			height = 0.7,
		},
	})
end

function FIND_LSP_DEFINITIONS()
	builtin.lsp_definitions({
		layout_strategy = "vertical",
		layout_config = {
			width = 0.8,
			height = 0.7,
		},
	})
end

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
				["<C-s>"] = custom_actions.system_nvim_open,

				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,

				["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,

				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<C-Q>"] = actions.send_selected_to_qflist + actions.open_qflist,

				["<C-\\>"] = actions.which_key,
				["<C-c>"] = actions.delete_buffer,
			},
		},
	},
})

telescope.load_extension("projects")
telescope.load_extension("live_grep_args")
telescope.load_extension("harpoon")
