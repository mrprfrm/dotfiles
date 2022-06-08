local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)

map("n", "<leader>ee", ":NvimTreeToggle<CR>", opts)
map("n", "<leader>eq", ":NvimTreeClose<CR>", opts)
map("n", "<leader>ec", ":NvimTreeFindFile<CR>", opts)
map("n", "<leader>ef", ":NvimTreeFocus<CR>", opts)

-- Resize
-- map("n", "<C-Up>", ":resize -2 <CR>", opts)
-- map("n", "<C-Down>", ":resize +2 <CR>", opts)
-- map("n", "<C-Left>", ":vertical resize -2 <CR>", opts)
-- map("n", "<C-Right>", ":vertical resize -2 <CR>", opts)

-- Buffers navigation
map("n", "<S-l>", ":bnext<CR>", opts)
map("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert mode
map("i", "jk", "<ESC>", opts)

-- Visual mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Zen mode
map("n", "<leader>z", ":ZenMode<cr>", { noremap = true })

-- Text move
map("x", "J", ":move '>+1<CR>gv-gv", opts)
map("x", "K", ":move '<-2<CR>gv-gv", opts)
map("v", "p", '"_dP"', opts)

-- File explorer
local telescope_builtin = require("telescope.builtin")
local telescope_projects = require("telescope._extensions.projects")

map("n", "<leader>fs", ":Telescope live_grep<CR>", opts)
map("n", "<leader>fp", ":Telescope projects<CR>", opts)
vim.keymap.set("n", "<leader>ff", function()
    telescope_builtin.find_files({
        hidden = true
    })
end)

-- LSP config
vim.keymap.set('n', '<Space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<Space>q', vim.diagnostic.setloclist, opts)
