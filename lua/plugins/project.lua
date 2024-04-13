local project_status_ok, project = pcall(require, "project_nvim")
if not project_status_ok then
	return
end

project.setup({
	active = true,
	detection_methods = { "pattern" },
	patterns = {
		".git",
		"_darcs",
		".hg",
		".bzr",
		".svn",
		"Makefile",
		"package.json",
		"pyproject.toml",
		"alacritty.toml",
		"tmux.conf",
	},
})
