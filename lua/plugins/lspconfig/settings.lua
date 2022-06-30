return {
  html = {},
  emmet_ls = {},
  volar = {},
  tsserver = {},
  cssls = {},
  pyright = {
    python = {
      analysis = {
        typeCheckingMode = "off",
      },
    },
  },
  sumneko_lua = {
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
}
