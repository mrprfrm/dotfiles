local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)

-- Window move
map("n", "<C-S-Left>", "<C-w>H", opts)
map("n", "<C-S-Right>", "<C-w>L", opts)
map("n", "<C-S-Up>", "<C-w>K", opts)
map("n", "<C-S-Down>", "<C-w>J", opts)

-- Window Resize
map("n", "<M-Up>", ":resize +2 <CR>", opts)
map("n", "<M-Down>", ":resize -2 <CR>", opts)
map("n", "<M-Right>", ":vertical resize +2 <CR>", opts)
map("n", "<M-Left>", ":vertical resize -2 <CR>", opts)

-- Buffers navigation
map("n", "<S-l>", ":bnext<CR>", opts)
map("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert mode
map("i", "jk", "<ESC>", opts)

-- Visual mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Zen mode
-- map("n", "<leader>z", ":ZenMode<cr>", { noremap = true })

-- Text move
map("x", "J", ":move '>+1<CR>gv-gv", opts)
map("x", "K", ":move '<-2<CR>gv-gv", opts)
map("v", "p", '"_dP"', opts)

-- LSP config
-- vim.keymap.set('n', '<Space>e', vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
-- vim.keymap.set('n', '<Space>q', vim.diagnostic.setloclist, opts)
