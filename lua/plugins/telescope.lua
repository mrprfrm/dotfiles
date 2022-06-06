require("telescope").setup {
    defaults = {
        file_ignore_patterns = {
            ".git/.*",
            "node_modules/.*",
            "__pycache__/.*",
            "venv/.*",
            "htmlcov/.*"
        },

    }
}
