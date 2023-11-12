local mason_lsp_ok, mason_lsp = pcall(require, "mason-lspconfig")
if not mason_lsp_ok then
  return
end

mason_lsp.setup({
  automatic_installation = true,
})
