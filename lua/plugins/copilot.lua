vim.cmd([[imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")]])
vim.cmd([[imap <silent><script><expr> <C-F> copilot#Next()]])
vim.cmd([[imap <silent><script><expr> <C-D> copilot#Previous()]])
vim.g.copilot_no_tab_map = true

function COPILOT_TOGGLE()
	if vim.g.copilot_enabled == 1 then
		vim.cmd([[Copilot disable]])
		print("Copilot disabled")
	else
		vim.cmd([[Copilot enable]])
		print("Copilot enabled")
	end
end
