---@type MappingsTable
local M = {}

M.general = {
	n = {
		[";"] = { ":", "enter command mode", opts = { nowait = true } },
		["<leader>tt"] = { "<cmd>TroubleToggle<cr>", "Toggle trouble", { silent = true, noremap = true } },
	},
}

return M
