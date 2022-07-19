local virtualtext_status_ok, virtualtext = pcall(require, "nvim-dap-virtual-text")
if not virtualtext_status_ok then
  return
end

virtualtext.setup()
