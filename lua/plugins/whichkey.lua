local whichkey_status_ok, whichkey = pcall(require, "which-key")
if not whichkey_status_ok then
  return
end

whichkey.setup {
  plugins = {
    marks = false,
    registers = false,
    spelling = {
      enabled = true,
      suggestions = 20,
    },
    presets = {
      operators = false,
      motions = true,
      text_objects = false,
      windows = false,
      nav = false,
      z = false,
      g = false,
    },
  },
  operators = { gc = "Comments" },
  icons = {
    breadcrumb = "»",
    separator = "➜",
    group = "+",
  },
  popup_mappings = {
    scroll_down = "<C-d>",
    scroll_up = "<C-u>",
  },
  window = {
    border = "rounded",
    position = "bottom",
    margin = { 1, 0, 1, 0 },
    padding = { 2, 2, 2, 2 },
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 },
    width = { min = 20, max = 50 },
    spacing = 3,
    align = "left",
  },
  ignore_missing = true,
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
  show_help = true,
  triggers = "auto",
  triggers_blacklist = {
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local mappings = {
  ["a"] = { "<cmd>Alpha<CR>", "Alpha" },
  ["w"] = { "<cmd>w!<CR>", "Save" },
  ["q"] = { "<cmd>q!<CR>", "Quit" },
  ["c"] = { "<cmd>Bdelete!<CR>", "Close buffer" },
  ["h"] = { "<cmd>nohlsearch<CR>", "No highlight" },

  e = {
    name = "Explorer",
    e = { "<cmd>NvimTreeToggle<cr>", "Toggle explorer" },
    c = { "<cmd>NvimTreeFindFile<cr>", "Find current file" },
  },

  f = {
    name = "Find",
    f = { "<cmd>Telescope find_files<CR>", "Find files" },
    t = { "<cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({ previewer = false }))<CR>", "Find text buffer" },
    T = { "<cmd>Telescope live_grep<CR>", "Find text workspace" },
    p = { "<cmd>Telescope projects<CR>", "Find projects" },
    h = { "<cmd>Telescope help_tags<CR>", "Help" },
    r = { "<cmd>Telescope oldfiles<CR>", "Recent files" },
    C = { "<cmd>Telescope commands<CR>", "Find commands" },
    s = { "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", "Symbols" },
    k = { "<cmd>Telescope keymaps<CR>", "Keymaps" },
    c = { "<cmd>TodoTelescope<CR>", "Find comments" }
  },

  g = {
    name = "Git",
    g = { "<cmd>lua LAZYGIT_TOGGLE()<CR>", "Lazygit" },
    o = { "<cmd>Telescope git_status<CR>", "Local changes" },
    b = { "<cmd>Telescope git_branches<CR>", "Checkout branch" },
    c = { "<cmd>Telescope git_commits<CR>", "Checkout commit" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview hunk" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage hunk" },
    u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Unstage hunk" },
    d = { "<cmd>Gitsigns diffthis<cr>", "Diff" },
  },

  l = {
    name = "LSP",
    r = { "<cmd>Telescope lsp_references<CR>", "References" },
    d = { "<cmd>Telescope lsp_definitions<CR>", "Definitions" },
    i = { "<cmd>Telescope lsp_implementations<CR>", "Implementations" },
    s = { "<cmd>SymbolsOutline<CR>", "Symbols" },
    l = { "<cmd>TroubleToggle<CR>", "Toggle troubles" }
  },

  t = {
    name = "Terminal",
    f = { "<cmd>ToggleTerm direction=float<CR>", "Float" },
    v = { "<cmd>ToggleTerm size=60 direction=vertical<CR>", "Vertical" },
    x = { "<cmd>ToggleTerm size=10 direction=horizontal<CR>", "Horisontal" },
  },

  d = {
    name = "Debugger",
    a = { "<cmd>lua ATTACH_TO_DEBUGGER()<cr>", "Attach" },
    d = { "<cmd>lua require'dapui'.toggle()<cr>", "Dap" },
    R = { "<cmd>lua require'dap'.repl.toggle({}, '10split')<cr>", "Repl" },
    s = { "<cmd>lua require'dap'.step_into()<cr>", "Step into" },
    n = { "<cmd>lua require'dap'.step_over()<cr>", "Step over" },
    r = { "<cmd>lua require'dap'.step_out()<cr>", "Step out" },
    c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
    q = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
    U = { "<cmd>lua require'dap'.up()<cr>", "Up" },
    D = { "<cmd>lua require'dap'.down()<cr>", "Down" },
    -- b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Breakpoint" },
    -- B = {
    --   "<cmd>lua require'dap'.toggle_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
    --   "Conditional breakpoint"
    -- },
    -- C= { "<cmd>lua require'dap'.clear_breakpoints()<cr>", "Clear breakpoints" },
  }
}

local options = {
  mode = "n",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,

}

whichkey.register(mappings, options)
