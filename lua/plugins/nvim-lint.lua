local nvim_lint_status_ok, nvim_lint = pcall(require, "lint")
if not nvim_lint_status_ok then
	return
end

nvim_lint.linters_by_ft = {
	python = { "flake8" },
}

local lint_group = vim.api.nvim_create_augroup("lint", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = lint_group,
	callback = function()
		nvim_lint.try_lint()
	end,
})
