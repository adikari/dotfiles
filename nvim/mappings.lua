---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "Enter command mode", opts = { nowait = true } },
    ["<leader>cc"] = { ":%bd|e#<CR>", "Close all buffer but current", opts = { nowait = true } },
    ["<leader>oi"] = { ":OrganizeImports<CR>", "Organise imports", opts = { nowait = true } },
  },
}

return M
