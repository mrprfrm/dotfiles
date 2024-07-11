local whichkey_status_ok, whichkey = pcall(require, "which-key")
if not whichkey_status_ok then
	return
end

whichkey.setup({
	plugins = {
		marks = false,
		registers = false,
		presets = {
			operators = false,
			motions = true,
			text_objects = false,
			windows = false,
			nav = false,
			z = false,
			g = false,
		},
	},
	operators = { gc = "Comments" },
	icons = {
		breadcrumb = "»",
		separator = "➜",
		group = "+",
	},
	popup_mappings = {
		scroll_down = "<C-d>",
		scroll_up = "<C-u>",
	},
	window = {
		border = "rounded",
		position = "bottom",
		margin = { 1, 0, 1, 0 },
		padding = { 2, 2, 2, 2 },
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 },
		width = { min = 20, max = 50 },
		spacing = 3,
		align = "left",
	},
	ignore_missing = true,
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
	show_help = true,
	triggers = "auto",
	triggers_blacklist = {
		i = { "j", "k" },
		v = { "j", "k" },
	},
})

local mappings = {
	["a"] = { "<cmd>Alpha<CR>", "Alpha" },
	["w"] = { "<cmd>w!<CR>", "Save" },
	["q"] = { "<cmd>q!<CR>", "Quit" },
	["c"] = { "<cmd>Bdelete!<CR>", "Close buffer" },
	["h"] = { "<cmd>nohlsearch<CR>", "No highlight" },
	e = {
		name = "Explorer",
		e = { "<cmd>NvimTreeToggle<cr>", "Toggle explorer" },
		c = { "<cmd>NvimTreeFindFile<cr>", "Find current file" },
	},
	f = {
		name = "Find",
		f = { "<cmd>Telescope find_files<CR>", "Find files" },
		t = { "<cmd>Telescope live_grep_args<CR>", "Find text workspace" },
		p = { "<cmd>Telescope projects<CR>", "Find projects" },
		h = { "<cmd>Telescope help_tags<CR>", "Help" },
		r = { "<cmd>Telescope oldfiles<CR>", "Recent files" },
		C = { "<cmd>Telescope commands<CR>", "Find commands" },
		s = { "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", "Symbols" },
		k = { "<cmd>Telescope keymaps<CR>", "Keymaps" },
		o = { "<cmd>Telescope buffers<CR>", "Opened buffers" },
		c = { "<cmd>TodoTelescope<CR>", "Find comments" },
	},
	g = {
		name = "Git",
		o = { "<cmd>Telescope git_status<CR>", "Local changes" },
		b = { "<cmd>Telescope git_branches<CR>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<CR>", "Checkout commit" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview hunk" },
		l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset hunk" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset buffer" },
		a = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Add hunk" },
		u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Unstage hunk" },
		d = { "<cmd>Gitsigns diffthis<cr>", "Diff" },
	},
	t = {
		name = "Treesitter",
		t = { "<cmd>TSContextToggle<CR>", "Context" },
	},
	l = {
		name = "LSP",
		d = { "<cmd>Telescope diagnostics<CR>", "Diagnostics" },
		l = { "<cmd>SymbolsOutline<CR>", "Symbols" },
		t = { "<cmd>TroubleToggle<CR>", "Toggle troubles" },
	},
	m = {
		name = "Marks",
		m = { "<cmd>Telescope harpoon marks<cr>", "Marks menu" },
		a = { "<cmd>lua ADD_HARPOON()<cr>", "Add mark" },
		d = { "<cmd>lua REMOVE_HARPOON()<cr>", "Remove mark" },
		j = { "<cmd>lua HARPOON_NEXT()<cr>", "Next mark" },
		k = { "<cmd>lua HARPOON_PREV()<cr>", "Prev mark" },
		c = { "<cmd>lua HARPOON_CLEAR()<cr>", "Clear marks" },
	},
}

local options = {
	mode = "n",
	prefix = "<leader>",
	buffer = nil,
	silent = true,
	noremap = true,
	nowait = true,
}

whichkey.register(mappings, options)
