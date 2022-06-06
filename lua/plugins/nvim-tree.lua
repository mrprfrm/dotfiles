local nvim_tree_config = require("nvim-tree.config")
local tree_cb = nvim_tree_config.nvim_tree_callback

--   ﭜ ﭧ     
vim.g.nvim_tree_icons = {
    git = {
        unstaged = "",
        staged = "",
        unmerged = "",
        renamed = "ﰲ",
        deleted = "",
        untracked = "",
        ignored = "",
    },
}

require("nvim-tree").setup {
    auto_close = true,
    open_on_tab = false,
    diagnostics = {
        enable = true,
        icons = {
            hint = "",
            info = "",
            error = "",
            warning = "",
        },
    },
    git = {
        enable = true,
    },
    update_focused_file = {
        enable = true
    },
    view = {
        mappings = {
            custom_only = false,
            list = {
                { key = "v", cb = tree_cb("vsplit") },
            }
        }
    }
}
