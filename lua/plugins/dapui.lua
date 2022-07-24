local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
  return
end
local dapui_status_ok, dapui = pcall(require, "dapui")
if not dapui_status_ok then
  return
end

dapui.setup {
  layouts = {
    {
      elements = {
        { id = "scopes", size = 0.5},
        { id = "stacks", size = 0.25 },
        { id = "watches", size = 0.25 },
      },
      size = 0.25,
      position = "left"
    },
    -- {
    --   elements = {
    --     "repl"
    --   },
    --   size = 10,
    --   position = "bottom"
    -- }
  }
}

-- dap.listeners.after.event_initialized["dapui_config"] = function()
--   dapui.open {}
-- end

dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close {}
end

dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close {}
end
