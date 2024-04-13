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

vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
vim.wo.foldlevel = 99

-- vim.opt.cmdheight = 2
