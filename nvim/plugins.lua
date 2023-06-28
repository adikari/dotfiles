local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"jose-elias-alvarez/null-ls.nvim",
				config = function()
					require("custom.configs.null-ls")
				end,
			},
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
	},

	-- override plugin configs
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},

	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},

	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{ "<leader>tt", "<cmd>TroubleToggle<cr>", "Toggle Trouble", { silent = true, noremap = true } },
		},
	},

	{
		"folke/zen-mode.nvim",
		init = function()
			require("core.utils").lazy_load("zen-mode.nvim")
		end,
	},

	{
		"ggandor/leap.nvim",
		init = function()
			require("core.utils").lazy_load("leap.nvim")
		end,
		config = function()
			require("leap").add_default_mappings(true)
		end,
	},
}

return plugins
