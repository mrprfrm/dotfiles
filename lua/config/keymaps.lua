local keymap = require("utils").keymap

-- Window navigation
keymap("Move focus to the buffer on the right", "n", "<C-h>", "<C-w>h")
keymap("Move focus to the buffer on the left", "n", "<C-l>", "<C-w>l")
keymap("Move focus to the buffer at the bottom", "n", "<C-j>", "<C-w>j")
keymap("Move focus to the buffer at the top", "n", "<C-k>", "<C-w>k")

-- Window move
keymap("Move curretn window to the left", "n", "<C-S-Left>", "<C-w>H")
keymap("Move curretn window to the right", "n", "<C-S-Right>", "<C-w>L")
keymap("Move curretn window to the top", "n", "<C-S-Up>", "<C-w>K")
keymap("Move curretn window to the top", "n", "<C-S-Down>", "<C-w>J")

-- Window Resize
keymap("Increase current window size vertically", "n", "<M-Up>", ":resize +2 <CR>")
keymap("Decrease current window size vertically", "n", "<M-Down>", ":resize -2 <CR>")
keymap("Increace curretn window size horizontally", "n", "<M-Right>", ":vertical resize +2 <CR>")
keymap("Decrease curretn window size horizontally", "n", "<M-Left>", ":vertical resize -2 <CR>")

-- Buffers navigation
keymap("Move to the next buffer", "n", "<S-l>", ":bnext<CR>")
keymap("Move to the previous buffer", "n", "<S-h>", ":bprevious<CR>")

-- Insert mode
keymap("Exit insert mode", "i", "jk", "<ESC>")

-- Visual mode
keymap("Increase current line indent", "v", "<", "<gv")
keymap("Decrease curretn line indent", "v", ">", ">gv")

-- Text move
keymap("Move selected text higher", "x", "J", ":move '>+1<CR>gv-gv")
keymap("Move selected text lower", "x", "K", ":move '<-2<CR>gv-gv")
keymap("Some", "v", "p", '"_dP"')

-- LSP config
keymap("Go to the previous diagnostic", "n", "[d", vim.diagnostic.goto_prev)
keymap("Go to the next diagnostic", "n", "]d", vim.diagnostic.goto_next)

local function find_lsp_references()
	builtin.lsp_references({
		layout_strategy = "vertical",
	})
end

-- Definition tools
-- keymap("Show references", "n", "gr", FIND_LSP_REFERENCES) -- custom lsp references using telescope
keymap("Go to the declaration", "n", "gD", vim.lsp.buf.declaration)
-- keymap("Go to the definition",  "n", "gd", FIND_LSP_DEFINITIONS)
keymap("Go to the implementation", "n", "gi", vim.lsp.buf.implementation)
keymap("Go to the type definition", "n", "gt", vim.lsp.buf.type_definition)
-- Diagnostic tools
keymap("Show diagnostic line", "n", "gl", vim.diagnostic.open_float)
keymap("Show signature", "n", "gk", vim.lsp.buf.signature_help)
keymap("Show signature line", "n", "K", vim.lsp.buf.hover)

-- Code tools
keymap("Rename", "n", "<space>r", vim.lsp.buf.rename)
keymap("Code actions", { "n", "v" }, "<space>ca", vim.lsp.buf.code_action)

-- TODO: investigate options
-- keymap('n', '<Space>e', vim.diagnostic.open_float)
-- keymap('n', '<Space>q', vim.diagnostic.setloclist)
