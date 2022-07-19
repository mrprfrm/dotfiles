local nvim_tree_config = require("nvim-tree.config")
local tree_cb = nvim_tree_config.nvim_tree_callback

--   ﭜ    ﭧ         ﮁ
--  S  ➜  U ◌
--       
--    ➜  ﭜ 
require("nvim-tree").setup {
  -- cwd - current working directory
  update_cwd = true,
  open_on_tab = false,
  auto_reload_on_write = true,
  view = {
    mappings = {
      custom_only = false,
      list = {
        { key = "v", cb = tree_cb("vsplit") },
      }
    }
  },
  renderer = {
    icons = {
      glyphs = {
        git = {
          unstaged = "",
          staged = "",
          unmerged = "",
          renamed = "➜",
          deleted = "",
          untracked = "ﭜ",
          ignored = "",
        }
      }
    }
  },
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
    ignore = false,
    timeout = 400,
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  filesystem_watchers = {
    enable = true,
  },
}
