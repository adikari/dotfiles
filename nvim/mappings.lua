---@type MappingsTable
local M = {}

M.general = {
	n = {
		[";"] = { ":", "enter command mode", opts = { nowait = true } },
	},
}

M.trouble = {
	n = {
		["<leader>tt"] = {
			function()
				vim.keymap.set("n", "<leader>tt", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })
			end,
		},
	},
}

-- more keybinds!

return M
