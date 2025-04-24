local M = {}

function M.keymap(desc, mode, lhs, rhs)
	vim.keymap.set(mode, lhs, rhs, { noremap = true, desc = desc })
end

return M
