local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
  return
end

dap.adapters.node2 = {
  type = "executable",
  command = "node",
  args = { os.getenv("HOME") .. "/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js" },
}

function ATTACH_TO_DEBUGGER()
  dap.run {
    type = "node2",
    request = "attach",
    cwd = vim.fn.getcwd(),
    console = "integratedTerminal",
    protocol = "inspector",
    port = 9229,
    sourceMaps = true,
    skipFiles = {
      "${workspaceFolder}/node_modules/**/*.js",
      "<node_internals>/**",
    },
    -- disableOptimisticBPs = true,
    -- trace = true,
    -- internalConsoleOptions = "neverOpen",
    -- console = 'integratedTerminal',
    -- skipFiles = { '<node_internals>/**/*.js' },
    -- outFiles = { cwd .. "/dist/**/*.js" },
  }
end
