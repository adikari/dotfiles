---@type MappingsTable
local M = {}

M.general = {
	n = {
		[";"] = { ":", "enter command mode", opts = { nowait = true } },
		["<leader>cc"] = { ":%bd|e#<CR>", "close all buffer but current", opts = { nowait = true } },
	},
}

return M
