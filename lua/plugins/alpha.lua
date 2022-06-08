local dashboard = require("alpha.themes.dashboard")

dashboard.section.buttons.val = {
    dashboard.button("e", "  New file", "<cmd>ene <CR>"),
    dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
    dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
    dashboard.button("r", "  Recently opened files", ":Telescope oldfiles <CR>"),
    dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
    dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

require("alpha").setup(
    dashboard.opts
)
