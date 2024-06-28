require "nvchad.mappings"

local map = vim.keymap.set

map("i", "jj", "<ESC>")
map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<leader>cc", "<cmd>%bd|e#<CR>", { desc = "Buffer Close all buffer but current", nowait = true })

map(
  "n",
  "<leader>oi",
  "<cmd>TSToolsOrganizeImports<CR>",
  { desc = "Format Organise typescript imports", nowait = true }
)

-- tmux navigation
map("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", { desc = "Navigate Window left" })
map("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", { desc = "Navigate Window right" })
map("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", { desc = "Navigate Window down" })
map("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", { desc = "Navigate Window up" })

-- nvim dap for dubugging
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Toggle breakpoint" })
map("n", "<leader>dus", function()
  local widgets = require "dap.ui.widgets"
  local sidebar = widgets.sidebar(widgets.scopes)
  sidebar.open()
end, { desc = "Open debugging sidebar" })
