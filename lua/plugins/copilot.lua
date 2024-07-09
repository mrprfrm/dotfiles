vim.cmd([[imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")]])
vim.cmd([[imap <silent><script><expr> <C-F> copilot#Next()]])
vim.cmd([[imap <silent><script><expr> <C-D> copilot#Previous()]])
vim.g.copilot_no_tab_map = true
