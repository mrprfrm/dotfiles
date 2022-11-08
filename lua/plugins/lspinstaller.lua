local lsp_installer_status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not lsp_installer_status_ok then
  return
end

lsp_installer.setup {
  automatic_installation = true
}
