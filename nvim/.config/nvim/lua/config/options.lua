vim.o.exrc = true
vim.opt.number = true
vim.opt.clipboard = "unnamedplus"

vim.opt.signcolumn = "yes"
vim.opt.completeopt = { "menuone", "noselect" }

vim.opt.encoding = "utf-8"
vim.opt.scrolloff = 8
vim.opt.wrap = true

vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.updatetime = 300
vim.opt.writebackup = false
vim.opt.timeoutlen = 500

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.smarttab = true

vim.opt.termguicolors = true

vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.showmode = false
vim.opt.showtabline = 2

vim.opt.splitbelow = true
vim.opt.splitright = true

-- diff options
vim.opt.diffopt:append("vertical")

-- border options
vim.o.winborder = "rounded"

vim.diagnostic.config({
	virtual_text = false,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅙",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.HINT] = "󰌵",
			[vim.diagnostic.severity.INFO] = "",
		},
	},
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = true,
		header = "",
		prefix = "",
	},
})
