vim.opt.number = true
vim.opt.clipboard = "unnamedplus"
vim.opt.signcolumn = "yes"
vim.opt.completeopt = { "menuone", "noselect" }
-- vim.opt.pumheight = 10
-- vim.opt.cursorline = true

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

-- vim.opt.cmdheight = 2

local signs = {
	{ name = "DiagnosticSignError", text = "󰅙" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = "󰌵" },
	{ name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

vim.diagnostic.config({
	virtual_text = false,
	signs = { active = signs },
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
