---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "Enter command mode", opts = { nowait = true } },
    ["<leader>cc"] = { ":%bd|e#<CR>", "Close all buffer but current", opts = { nowait = true } },
    ["<leader>oi"] = { ":OrganizeImports<CR>", "Organise imports", opts = { nowait = true } },
  },
}

M.harpoon = {
  n = {
    ["<leader>po"] = {
      function()
        require("harpoon.ui").toggle_quick_menu()
      end,
      "Open harpoon",
    },
    ["<leader>k"] = {
      function()
        require("harpoon.ui").nav_next()
      end,
      "Navigate to next harpoon mark",
    },
    ["<leader>j"] = {
      function()
        require("harpoon.ui").nav_prev()
      end,
      "Navigate to previous harpoon mark",
    },
    ["<leader>pa"] = {
      function()
        require("harpoon.mark").add_file()
      end,
      "Mark file in harpoon",
    },
    ["<C-q>"] = {
      function()
        require("harpoon.ui").nav_file(1)
      end,
      "Navigate to harpooned file 1",
    },
  },
}

return M
