local lspconfig = require("lspconfig")

return {
  html = {},
  emmet_ls = {},
  volar = {
    root_dir = lspconfig.util.root_pattern('package.json', 'vue.config.js'),
  },
  eslint = {},
  tsserver = {},
  cssls = {},
  tailwindcss = {},
  pyright = {
    root_dir = lspconfig.util.root_pattern("WORKSPACE", "pyproject.toml"),
    settings = {
      python = {
        analysis = {
          typeCheckingMode = "off",
        },
      },
    },
  },
  sumneko_lua = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          -- [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          -- [vim.fn.stdpath("config") .. "/lua"] = true,
          library = vim.api.nvim_get_runtime_file("", true),
        },
      },
    },
  },
}
